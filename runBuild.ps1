if ($env:APPVEYOR) {
    $localFolder = "$env:APPVEYOR_BUILD_FOLDER"
} else {
    $localFolder = "."
}

if ($env:APPVEYOR)
{

    $compilerName = "compiler"
  # Install docfx
  (New-Object System.Net.WebClient).DownloadFile("https://github.com/dotnet/docfx/releases/download/v2.48.1/docfx.zip", "$localFolder\$compilerName.zip")
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

git clone https://github.com/robotdotnet/wpilib "$localFolder\repos\wpilib" --depth=1
dotnet restore "$localFolder\repos\wpilib"

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
