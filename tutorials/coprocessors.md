# OpenCV and Arm Coprocessors
Coprocessors running vision has been one of the most discussed items in FRC the past few years. On the roboRIO, the new [CameraServer](xref:WPILib.CameraServer)
helps makes vision and streaming easy. For 2017, beta support for the 3 libraries required (ntcore, cscore and opencv) has been added for running on Arm based coprocessor boards.
With these additions, it is easier than ever to get vision support on an FRC robot. In addition to these being supported in C++ and Java, we provide full .NET support
for all of these tool as well, which makes it easy to have your choice of language to do your processing in.

## Picking a board and camera
There are many choices out in the marketplace for arm based coprocessors. However, for FRC you will most likely come across 2. The NVIDIA Jetson has been provided on FIRST
Choice for a few years now, and is a great choice for vision processing. The other option is the highly popular Raspberry Pi. Both of these options are very viable options, 
and either choice is highly recommended. Note that when choosing a Pi, we heavily recommend a Pi 3. A Pi 2 works, but the additional processing power is very useful. The Pi 1 
and Pi Zero are not supported platforms because of their old architecture. When using a Pi, we recommend adding both a heatsink and a fan to the device, in order to keep 
your framerates high and your temperatures low. 

For cameras, there are a lot more options. We recommend either a Microsoft or a Logitech camera. A Microsoft Lifecam has been offered on FIRST Choice in the past, 
and is a great option. If you are running on a Raspberry Pi, it is actually possible to get the Raspberry Pi Camera working with CameraServer as well. 
This has the advantages of being off the USB bus, so you don't have to worry about running out of USB bandwidth. This requires running the following command at boot to enable it. 

    sudo modprobe bcm2835-v4l2

You can follow the instructions [here](http://www.richardmudhar.com/blog/2015/02/raspberry-pi-camera-and-motion-out-of-the-box-sparrowcam/) to see how to enable
that setting on startup.

## Installing Mono
On these coprocessors, Mono is what we will use to run our processing. To install Mono on these plaforms, follow the instructions found on 
[the mono website](http://www.mono-project.com/docs/getting-started/install/linux/). When choosing the package to install, make sure to install
`mono-complete` in order to make sure you have all the necessary runtime dependencies.

## Setting up a project
A project for your coprocessor can either be set up using Visual Studio, or use can build locally on the coprocessor using Mono. We 
recommend Visual Studio on Windows for the easiest support. See the note at the bottom of this page for information on using .NET Core.

To set up a project in Visual Studio, create a new Console Application, and make sure that the target framework is set to at least 4.6. Once you
have that, install the following packages from NuGet:
* [FRC.CameraServer](https://www.nuget.org/packages/FRC.CameraServer/)
* [FRC.NetworkTables](https://www.nuget.org/packages/FRC.NetworkTables/)
* [FRC.OpenCvSharp](https://www.nuget.org/packages/FRC.OpenCvSharp/)
* [FRC.OpenCvSharp.DesktopLibraries](https://www.nuget.org/packages/FRC.OpenCvSharp.DesktopLibraries/)

This will get you all the dependencies you will need to set up a coprocessor project. 

## Deploying to the Coprocessor
Once you have your project created, you need to get the code onto the coprocessor. To do this, run a build. The output will be placed into either `bin/Release` or `bin/Debug`
in your project folder. You need to copy all files from this directory to a folder on your coprocessor.

Once you do this, from the terminal on the coprocessor, run `mono YourExecutableNameHere.exe`. This will run your vision project.

## Using .NET Core
If your choses platform has .NET Core support, all of our libraries support .NET Core Standard 1.5 or above. So if you want to compile for
.NET Core, you can. However note that no arm devices at the time of this writing have released .NET Core support, so our instructions are
currently only for running on the full framework. You can however use the .NET Core SDK and target .NET 4.6 in order to run on mono, 
but we do not currently have instructions for doing this.
