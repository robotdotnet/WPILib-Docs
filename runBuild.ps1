if ($env:APPVEYOR)
{
  # Install docfx
  cinst docfx -y
}

if ($env:APPVEYOR) {
    $localFolder = "$env:APPVEYOR_BUILD_FOLDER\repos"
} else {
    $localFolder = ".\repos"
}

git clone https://github.com/robotdotnet/frc-opencvsharp "$localFolder\frc-opencvsharp" --depth=1
git clone https://github.com/robotdotnet/cameraserver "$localFolder\cameraserver" --depth=1
git clone https://github.com/robotdotnet/wpilib "$localFolder\wpilib" --depth=1
git clone https://github.com/robotdotnet/networktables "$localFolder\networktables" --depth=1
git clone https://github.com/robotdotnet/wpilib-ctre "$localFolder\wpilib-ctre" --depth=1
