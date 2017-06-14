if ($env:APPVEYOR) {
    $localFolder = "$env:APPVEYOR_BUILD_FOLDER"
} else {
    $localFolder = "."
}

if ($env:APPVEYOR)
{

    $compilerName = "compiler"
  # Install docfx
  (New-Object System.Net.WebClient).DownloadFile("https://github.com/dotnet/docfx/releases/download/v2.18.3/docfx.zip", "$localFolder\$compilerName.zip")
# unzip everything
Add-Type -assembly "system.io.compression.filesystem"

function Unzip($file)
{
  [io.compression.zipfile]::ExtractToDirectory("$localFolder\$file.zip", "$localFolder\$file")
}

echo "Extracting Docfx"
Unzip($compilerName)

    $env:Path += ";$localFolder\compiler"
  
  if($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode )  }
}

git clone https://github.com/robotdotnet/frc-utilities "$localFolder\repos\frc-utilities" --depth=1
git clone https://github.com/robotdotnet/networktables "$localFolder\repos\networktables" --depth=1
git clone https://github.com/robotdotnet/wpilib-ctre "$localFolder\repos\wpilib-ctre" --depth=1
git clone https://github.com/robotdotnet/CameraServer "$localFolder\repos\cameraserver" --depth=1
git clone https://github.com/robotdotnet/FRC-OpenCvSharp "$localFolder\repos\frc-opencvsharp" --depth=1

dotnet restore "$localFolder\repos\frc-opencvsharp"
dotnet restore "$localFolder\repos\frc-utilities"
dotnet restore "$localFolder\repos\networktables"
dotnet restore "$localFolder\repos\cameraserver"
dotnet restore "$localFolder\repos\wpilib-ctre"

git clone https://github.com/robotdotnet/wpilib "$localFolder\repos\wpilib" --depth=1
if ($env:APPVEYOR) {
    nuget restore "$localFolder\repos\wpilib\robotdotnet-wpilib.sln"
} else {
    .\repos\wpilib\NuGet.exe restore .\repos\wpilib\robotdotnet-wpilib.sln
}

if (!$env:APPVEYOR) {
  git checkout master
}

docfx

if($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode )  }

Remove-Item "$localFolder\site.zip"

Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
[System.IO.Compression.ZipFile]::CreateFromDirectory("$localFolder\_site\",
    "$localFolder\site.zip", $compressionLevel, $false)

if ($env:APPVEYOR) {
  Get-ChildItem "$localFolder\site.zip" | % { Push-AppveyorArtifact $_.FullName -FileName $_.Name }
}
