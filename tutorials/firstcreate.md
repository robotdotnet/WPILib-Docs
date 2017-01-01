# Creating your first WPILib project

Creating your first WPILib project is easy, once the [Extension is installed](windowsinstall.md) and your [roboRIO is setup.](provisioning.md)

## Creating a new project
* Click File | New | Project.
* If you want a C# project, go to the Visual C# menu. If you want Visual Basic, go to the Visual Basic menu. Note one of these options might be in Other Lanugages depending on how you originally installed Visual Studio.
* In the Visual C# menu, find FRC. In this menu, select the base class you would like to use. For more information, see Selecting a Base class below.
* Enter a project name, a folder you would like to place your code in, and a name for the solution.
* Click OK. This will then create your first project.
* Once your project is created, we recommend that you [update WPILib](updatewpilib.md), as the extension might not include the newest version. 
* Go to [Writing and running a robot project](writingandrunning.md) to deploy the project to your roboRIO.

## Selecting a base class

RobotDotNet offers 4 base classes to start from. 2 of them (Sample Robot and Iterative Robot), along with Command Robot are implementations of the official WPILib base classes. For more information on these,
see [the official WPILib help for these classes](https://wpilib.screenstepslive.com/s/4485/m/13810/l/241853-choosing-a-base-class). If you want to use the Command Robot template, try taking a look at the 
[Attributed Command Robot](createattributed.md) as it uses some .NET features to allow even easier command creation.

RobotDotNet offers 2 custom base classes. The [Attributed Command Robot](createattributed.md) base class allows for creating command based robots while removing most of the boilerplate code usually required.
The [LabVIEW Robot](createlv.md) base class is designed to help teams who are transitioning from LabVIEW to text based code, with some of the base methods named similarly to LabVIEW, and Autonomous and Test modes running in their own thread.


## Base Classes
* [Iterative Robot](xref:WPILib.IterativeRobot)
* [Sample Robot](xref:WPILib.SampleRobot)
* [LabVIEW Robot](xref:WPILib.Extras.LabViewRobot)
* [Attributed Command Robot](xref:WPILib.Extras.AttributedCommandModel.AttributedRobot)