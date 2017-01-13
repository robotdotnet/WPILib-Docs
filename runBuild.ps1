if ($env:APPVEYOR)
{
  # Install docfx
  cinst docfx -y
}

git clone https://github.com/robotdotnet/frc-opencvsharp repos/frc-opencvsharp --depth=1
git clone https://github.com/robotdotnet/cameraserver repos/cameraserver --depth=1
git clone https://github.com/robotdotnet/wpilib repos/wpilib --depth=1
git clone https://github.com/robotdotnet/networktables repos/networktables --depth=1
git clone https://github.com/robotdotnet/wpilib-ctre repos/wpilib-ctre --depth=1
