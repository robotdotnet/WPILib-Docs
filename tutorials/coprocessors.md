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

For cameras, there are a lot more options. We recommend either a Microsoft or a Logitech camera. A Microsoft Lifecam has been offered on FIRST Choice in the past, and is
a great option. If you are running on a Raspberry Pi, it is actually possible to get that working with CameraServer as well. This has the advantages of being off the USB
bus, so you don't have to worry about running out of USB bandwidth. This requires running the following command at boot to enable it. 

    sudo modprobe bcm2835-v4l2

You can follow the instructions [here](http://www.richardmudhar.com/blog/2015/02/raspberry-pi-camera-and-motion-out-of-the-box-sparrowcam/) to see how to enable
that setting on startup.

## Installing Mono
On these coprocessors, Mono is what we will use to run our processing. To install 

## Setting up a build