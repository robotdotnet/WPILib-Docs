# Updating WPILib
When the extensions create a new template, it uses libraries internal to the extension. These might not be the newest versions, so we recommend updating to the newest releases anytime a new project is created.
In addition, we will post updates to both the website and ChiefDelphi when a new release is made.

## Updating with Visual Studio GUI
The easiest way to update is to use the Visual Studio NuGet GUI. 
1. Right click on References in your project, and click Manage NuGet Packages
2. Go to Updates, find FRC.WPILib, and click on it.
3. On the right, make sure Version says Latest stable, and then click update. This will update WPILib and all dependencies
4. If you have either WPILib.Extras or WPILib.CTRE installed, you will have to update those as well.

## Updating with the NuGet Package Manager
Coming Soon