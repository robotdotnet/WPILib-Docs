if ($env:APPVEYOR)
{
  # Install docfx
  cinst docfx -y
}

if ($env:APPVEYOR) {
    $localFolder = "$env:APPVEYOR_BUILD_FOLDER"
} else {
    $localFolder = "."
}

git clone https://github.com/robotdotnet/frc-opencvsharp "$localFolder\repos\frc-opencvsharp" --depth=1
git clone https://github.com/robotdotnet/cameraserver "$localFolder\repos\cameraserver" --depth=1
git clone https://github.com/robotdotnet/wpilib "$localFolder\repos\wpilib" --depth=1
if ($env:APPVEYOR) {
    nuget restore "$localFolder\repos\wpilib\robotdotnet-wpilib.sln"
} else {
    .\repos\wpilib\NuGet.exe restore .\repos\wpilib\robotdotnet-wpilib.sln
}
git clone https://github.com/robotdotnet/networktables "$localFolder\repos\networktables" --depth=1
git clone https://github.com/robotdotnet/wpilib-ctre "$localFolder\repos\wpilib-ctre" --depth=1

git checkout master

docfx

Remove-Item "$localFolder\site.zip"

Add-Type -Assembly System.IO.Compression.FileSystem
$compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
[System.IO.Compression.ZipFile]::CreateFromDirectory("$localFolder\_site\",
    "$localFolder\site.zip", $compressionLevel, $false)

if ($env:APPVEYOR) {
  Get-ChildItem "$localFolder\site.zip" | % { Push-AppveyorArtifact $_.FullName -FileName $_.Name }
}
