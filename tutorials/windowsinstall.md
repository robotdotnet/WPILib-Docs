# Windows installation

RobotDotNet and projects built from it can be compiled using Mono on Linux and Mac OSX, but is currently best supported using Windows and Visual Studio 2015. Here's how to get started:

## Online installation
If you do not have Visual Studio 2015 installed, you will need to install it. Note 2013 should be supported, but has not been tested recently, and 2017 RC is currently not supported.

We recommend Visual Studio 2015 Community, which can be found [here.](https://www.visualstudio.com/vs/) The license for the Community edition allows for educational use so it can be used for our purposes.

After Visual Studio has been installed, open it and go to Tools | Extensions and Updats. Select Online, and search for "FRC Extension" Click download on the extension, which will install it and then ask you to restart Visual Studio.

## Offline installation
First you will need to have Visual Studio installs. See the Online Installation section for where to get it.

After VS is installed, an offline version of the extension can be found [here.](https://marketplace.visualstudio.com/items?itemName=RobotDotNet.FRCExtension) Download the file, and run the file to install it into Visual Studio

## What to do next
After you have the extension installed, if it is the first time for the install, you will need to set the team number. Do this by going to FRC | Settings in VS, and setting the team number there.

If your roboRIO has not yet been provisioned for running RobotDotNet projects, see [Installing the Runtime onto the roboRIO](provisioning.md) for instructions on how to do this.

Once everything has been done, you will now be ready to set up and run your first .NET project and upload it to your robot. See [Creating your first project](firstcreate.md) to do this.

## Upgrading the Extension
If your developer system is connected to the internet, go to the Extension and Updates utility in the tools menu in Visual Studio. If an update is available, it will show up in the Updates section.

If you need an offline update, just redownload the offline installer and run it again. That will update the extension.