# Creating a project using the LabVIEW style base class
The LabVIEW Style Robot is designed to make it easier for teams to move from LabVIEW to text based programming.
Instead of running autonomous and test modes in the main robot thread, it runs them in a seperate thread. In addition, the main methods have been renamed
to match their equivalents in LabVIEW. Information on the methods contained in this base class can be found at [LabVIEW Robot.](xref:WPILib.Extras.LabViewRobot)

## Creating a project with the LabVIEW Template
1. Create a new robot project using the LabVIEW Robot template. You should see the following methods in the main robot class.
    * **Begin**
        * The method is equivalent to *Begin.vi*. This is where you should put your robot initialization code
    * **Disabled**
        * This method is equivalent to *Disabled.vi*. It runs in the main robot thread whenever the robot is Disabled. Use the 
        CallContext parameter to determine if it is the initialization run or the execute run on the method.
    * **Teleoperated**
        * This method is equivalent to *Teleop.vi*. It runs in the main robot thread whenever the robot is in Telop mode and Enabled.
        Use the CallContext parameter to determine if it is the initialization run or the execute run on the method.
    * **Autonomous**
        * This method is equivalent to Autonomous.vi. It runs in its own thread, and is called once only at the beginning of Autonomous Enabled.
    * **Test**
        * This method is equivalent to *Test.vi*. It runs in its own thread, and is called once only when the robot first enters test mode.
        Note that this includes Test Disabled, and its state will not switch when switching between enabled and disabled test modes.

### Properly handling threads
When dealing with threads, it is important to note that the threads will be aborted when switching modes. This means you should not use any functionality
that requires cleanup, such as writing to a log file. If you must, you can try and catch the ThreadAbortedException, and run your cleanup code there.
However, you have to make sure to not cancel the abort, as this will lock up the robot code. In addition, please do not start another thread,
as the library will not be able to clean up that thread, and it will continue to run.