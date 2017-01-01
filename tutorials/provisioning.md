# Installing the Runtime onto the roboRIO

In order to use RobotDotNet, you must first install the Mono runtime onto the roboRIO. To do this, you must first have imaged your roboRIO to the proper version. To do this, follow the 
[instructions on the FIRST website](http://wpilib.screenstepslive.com/s/4485/m/13503/l/144984-imaging-your-roborio). Note you will need to have installed the lasted FRC Update Suite in order to get the latest image.

You also need to have have [Visual Studio and the Extension installed.](windowsinstall.md) 

Make sure your roboRIO is hooked up either via USB or Ethernet. Wireless is not recommended.

## Visual Studio Online Installation - Recommended
* Open Visual Studio, and go to FRC | Mono Tools | Download Mono. This will download Mono on to your local system.
* After the download completes, a popup will appear asking if you would like to install Mono. Click Yes.
* Mono will now be getting installed to the roboRIO. Once this is finished, a popup will appear indicating if the install was successful or not.
* If successful, Mono, will now be installed on your roboRIO. You can now [create your first robot project](firstcreate.md) to create and deploy your first project.

## Offline installation
* Download [Mono 4.2.1](https://dl.bintray.com/robotdotnet/Mono/Mono4.2.1.zip), and copy this zip file to the system you want to deploy from
* Open Visual Studio, and go to FRC | Mono Tools | Install Mono. If Mono has not been previously downloaded, a popup will appear asking if you want to look for the file. Click Yes and search for the zip file.
* Mono will now be getting installed to the roboRIO. Once this is finished, a popup will appear indicating if the install was successful or not.
* If successful, Mono, will now be installed on your roboRIO. You can now [create your first robot project](firstcreate.md) to create and deploy your first project.