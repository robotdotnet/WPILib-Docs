# Using the CTRE Libraries
For 2017, the CTRE Libraries, including CAN Talon, have been removed from the base install. This change has been made to match upstream WPILib. 
Instead, the CTRE Libraries are provided in a separate NuGet package, which can be found at [https://www.nuget.org/packages/FRC.WPILib.CTRE/](https://www.nuget.org/packages/FRC.WPILib.CTRE/).

The difference between 2016 and 2017 is that the [CANTalon](xref:CTRE.CANTalon) class has been moved into the `CTRE` namespace. To add this to your code, add 
`using CTRE;` to your using declarations. API Docs can be found at the [CANTalon](xref:CTRE.CANTalon) page.

Currently this only includes the CANTalon functionality, however we hope to add support the new Pigeon IMU soon. 
