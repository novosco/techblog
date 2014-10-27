---
title: To NUC or not to NUC
date: 2014-09-11 09:23 UTC
tags: Windows
author: shane_bre
---

Intel Next Unit of Computing or NUC, you've probably heard of them. Essentially they are a very small form factor computer that Intel produce and sell as a reference design to show that regular PCs can be small and relatively affordable. NUCs come with a range of processors (atom, Celeron, i3, i5) and a range of specifications. All they need is ram and a Hard drive to get them going.

READMORE

Recently my wife was in need of her own computer so decided to go with the intel NUC as it would be small and tidy. The monitor had a VESA mount which allowed the NUC to be mounted on the back and with a wireless keyboard and mouse the end result was extremely tidy. Making everyone happy.

The spec of the NUC was as follows:


> **NUC:** Intel DN2820FYKH Barebone Desktop (Celeron N2820 2.39GHz, HD Graphics, WLAN, Bluetooth 4.0)  
**Hard Drive:** Intel 530 Series 120GB SSD  
**Ram:** Kingston ValueRam 8 GB DDR3L 1600 MHz SODIMM CL11 Memory Module  
**Monitor:** BenQ GL2250HM 21.5-inch Widescreen LED Multimedia Monitor  

Couple of gotchas about the Intel NUCs generally and this model specifically:  




1. The ram must be the low voltage ( 1.35v) Sodimm modules. Normal voltage ram will not work in an Intel NUC There is a supported memory list which lists out the full specs of the ram : http://www.intel.com/support/motherboards/desktop/sb/CS-034475.htm
1. For this specific model of NUC you have to use a 2.5 inch hard drive as opposed to a m-SATA hard drive. However to fit the drive bay of the NUC the RAM must be no thicker than 9.5mm.  

## The installation of a Windows 8.1 ##

Honestly this was the most painful part of this process, the windows installer loaded fine all the pain came from the NUC.  

Issues:  

1. SSD not detected.  
2. BIOS screen not displaying on monitor.  

To install and operating system on the intel NUC DN2820FYKH you need to upgrade the BIOS from the factory shipped version of 0015 to a minimum of 0025 along with making some fairly minor changes to the BIOS settings. As you can probably imagine the inability to see the BIOS screen made flashing the BIOS less straightforward but not impossible. Intel supply the BIOS updates in 4 packages :  

- Recovery BIOS update : used for flashing directly from the BIOS screen
- iFlash BIOS update : DOS based utility for updating the BIOS
- Self-extracting windows based update file
- Self-extracting windows PE update file  

In my case the simplest fix was to make a windowsPE boot USB instructions here : [http://technet.microsoft.com/en-us/library/hh825109.aspx](http://technet.microsoft.com/en-us/library/hh825109.aspx), copy the appropriate BIOS version to the drive. Then boot into the windows PE and run the .exe which then updated the BIOS and all proceeded smoothly from there. The SSD was detected and OS installed.