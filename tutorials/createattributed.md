# Creating a project with the Attributed Robot Model
The Attributed Robot Model is a new way of creating a Command-Based Robot that removes nearly all of the boilerplate code (aka hookup code, like the usual OI class) usually required. This model uses a process called "reflection" to find the subsystems and commands and hook them up correctly. Consequently, the robot will take a little longer (read: a second or two) to initialize upon startup, but the difference is not noticable in most situations.

## Creating a basic project 
1. Create a new robot project using the Attributed Command Robot template. You should see the following files:
      * **ProjectName.cs**
          * This contains your Robot class. Your robot class derives from the [AttributedRobot](xref:WPILib.Extras.AttributedCommandModel.AttributedRobot) class. This class sets everything up to execute when you want.
      * **RobotMap.cs**
          * This class should have the ports defined for each piece of hardware attached to the robot as constants.
      * **Program.cs**
          * This class contains the entry point to the project. You should never have to edit this file.
      * **Subsystems/ExampleSubsystem.cs**
          * This class is an example subsystem that will automatically be set up and have its default command set to be an instance of *ExampleCommand*.
      * **Commands/ExampleCommand.cs**
          * This class is an example command that is automatically set up as the default command for an instance of 8ExampleSubsystem8. NOTE: It MUST have the constructor taking an *ExampleSubsystem* for it to work.
      * **Commands/ExampleAutonomousCommand.cs**
          * This class is an example command that is automatically set up to start when the robot enters Autonomous mode. NOTE: It does not require the constructor taking an *ExampleSubsystem* for it to work, but that is the only way for it to *Require* the subsystem.
2. To add a new subsystem, right click on your project and click Add > New Item. Create a Subsystem. This is the same template as used fror a Command-Based Robot. To make it automatically load, add the folloing code on a new line before *class:* (Note this is called adding an attribute to the class)
    > [WPILib.Extras.AttributedCommandModel.ExportSubsystem]
    
    The subsystem will now automatically load. To specify a default command, use the following:
    > [WPILib.Extras.AttributedCommandModel.ExportSubsystem(DefaultCommandType=typeof(CommandType))]

    Where *CommandType* is the type of the command.
3. To add a new command, right click on your project and click Add > New Item. Create a Command. This is the same template as used for a Command-Based Robot. To set it up to auto-load, there are a few different ways: default command, phase command, and button command. The default command is configured on the respective subsystem as seen above. If your command is a default command, it MUST have a constructor that takes ONLY an instance of the subsystem it is the default command for, or your project will fail to run. To set it up as a phase command, add the *RunCommandAtPhaseStart* attribute to the commmand class. You will have to specify which phase to start the command on with the *MatchPhase* enumeration. If your command acts on a button, you will have to pick the correct attribute. There is one attribute for each of the different button classes. Use the correct method (and pass in the required parameters), and the library will automatically set up the command to execute when you want it to.

For more information, see the docs for the [Attributed Command Model](xref:WPILib.Extras.AttributedCommandModel)