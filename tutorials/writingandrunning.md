# Writing and Running your first WPILib program
Once you have your project created, you are ready to start programming. .NET documentation is still a work in progress, but you can look at C++ and Java WPILib documentation for ideas. 
In addition, take a look at [the WPILib .NET Documentation](~/api/index.md) for API Documentation for all of .NET suite.

## Deploying code
Make sure you have [the runtime installed](provisioning.md) along with having set your Team Number in Visual Studio. Once you have, you are ready to deploy
1. Click on the **FRC** menu, and then click on **Deploy Code**. This will deploy all code, along with all necessary libraries to the robot.

### Extra deploy features
The FRC extension has support for some extra deploy features as well. These can be found in the settings menu.
* **Send command line arguments** This setting will send all command line arguments specified in the Visual Studio solution to the robot.
* **Verbose** Turns on verbose output to the deploy window

## Troubleshooting
Below are some issues that might pop up when being deployed
* If the wrong project is being deployed, or the Deploy Code button is not enabled, it is possible something got corrupted in your project.
The first debug step is to right click on the robot project, and click **Set Main Robot Project**. This will reconfigure the project to be a known WPILib project,
and the deploy should work again. If it does not, contact RobotDotNet and we will try to help you
* If you get a message saying the image is not correct, or a message saying the runtime is not installed, see [installing the runtime](provisioning.md) and make sure you have
followed both the imaging and runtime steps.