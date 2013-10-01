---
title: FAST Cache&#8230; Its simple but think first.
date: 2012-03-02 12:48:21 +0000
tags: EMC
author: stejoh
---

I love finding out how technology features work, It’s like finding out the secrets behind a magic trick. When you realise it’s not magic you can break it down, get a good understanding and learn how to maximise the benefits whilst negotiating the pitfalls.

Recently I have been working on getting an environment ready to run a VDI workload. The customer uses EMC products extensively, want to do VDI but want it isolated from their other storage. VNX with FAST Cache and FAST VP is the solution. It’s whilst working with this I have come to some conclusions and I wanted to share them.

Most in this industry are aware of the high IOps which can be achieved through the use of flash storage (EFD). This presents some challenges to storage vendors because the architecture in which sets of disks reside are limited by the backend bus on which they sit. It doesn’t take much to realise spreading this load around on different buses is beneficial and will help maximise the benefits of the flash you have in your array.

There are a number of EMC Primus articles covering FAST Cache and the location of the flash drives used for it, if you work in this space. I recommend you read them, emc251589 and emc285141 (a Powerlink account is required to do that). I will share my experiences in the hope it can help others.

Note I have gathered the points for this blog post from information within the above Primus articles and as such they are much more verbose and should be consulted before making any concrete decisions on your storage array layout. Also use your TC’s (EMC Technology Consultant’s) they are a great source of information.

Since FAST Cache utilises EFD RAID1 Mirrored pairs, the same rules apply and the considerations are as follows -

- Spread the drives throughout different buses; avoid putting all the EFD drives on Bus0 (VNX OE runs here).

A point to make about this is that depending on model you are limited to the number and size of FAST Cache drives you can use (see emc251589 for full details), with models like the VNX5100 you wont have a choice but to use Bus0 since thats all it has but you also can’t use more than 2x 100Gb drives so this limits the impact. A VNX5300 has Bus0 and Bus1 so you will likely want to spread the load between these, this leads on to the next consideration.

- Avoid using a mixture of drives which reside in the vault enclosure (the DPE).

FAST Cache uses Mirrored pairs and this recommendation is because drives in the DPE are protected by SPS whilst the other drive in the pair will not be. In the case of failures your mirror will become degraded whereas if they are both unprotected by the SPS they will power off at the same time.

- Spread the Primary drives in each Mirrored pair among Buses, this helps with availability.

This is done by using the cli. Note that the order of drives specified dictates which are primary and secondary. When executing the command the first drive will be primary, then the next will be secondary, then primary, secondary etc. So Primary1 Secondary1 Primary2 Secondary2 Primary3 Secondary3 and so on.

The command is:  
`naviseccli -address [SP_IPAddress] cache -fast -create -disks [Disk_list] -mode rw -rtype r_1`

[SP\_IPAddress] is the IP address and [Disk\_list] is the disks that will be used for FAST Cache. The format of the disk list for example would be  
`0_1_0 1_1_0 1_1_1 0_1_1`  
Where the notation is “Bus”\_”Enclosure”\_”Disk” and they are seperated by spaces. In my example it would be Bus0 Enclosure1 Disk0 as the primary paired with Bus1 Enclosure1 Disk0 and another pair with primary Bus1 Enclosure1 Disk1 and secondary Bus0 Enclosure1 Disk1.

Something worth considering is that you will likely need to move the disks around from the configuration in which they were shipped. Typically they place a lot of EFD in the DPE and as mentioned above you wont want to mix these with disks in other enclosures.

In my case I am working with VNX 5300′s. As I mentioned they have two buses, Bus0 and Bus1. The array I am working with has the DPE and 3 additional DAE’s, they have 4 disks to use for FAST Cache and a Hotspare. After a chat with a very helpful TC about the Primus articles above I relocated all the EFD in the top two DAE’s. This means they are spread across Bus0 and Bus1 whilst not being protected by the SPS. I also set it so for FAST Cache one primary disk is in Bus0 with its secondary in Bus1 and the other primary is in Bus1 with its secondary in Bus0. This part I decided based on common sense and wanting to spread the load so two primarys were not on the same bus (comments on this welcome).
