---
title: VNXe 3100 with ESXi using iSCSI, lets clear up the confusion.
date: 2013-04-08 10:41:00 +0100
tags: EMC
author: stejoh
---

[**Edit -** I Wrote this blog post a very long time ago but never published it to the public as I felt I needed to address the addition of the SLIC cards to VNXe before I released this into the wild. I have decided to open it up anyway as it is still relevant today in VNXe or even just general iSCSI configurations.]

I do a lot of VNX work and until recently didn’t get an opportunity to deploy a VNXe. As with any product for the first time I did some research in to how it should be configured. It was a VNXe 3100 and would be used with ESXi 5.0 using iSCSI. I searched the web, asked colleagues and the results were that every configuration seemed to be slightly different. Part of the reason behind this is connectivity options. It comes with 2 on-board NICs per Storage Processor but some are also sold with an additional 4 port SLIC card in each SP and it supports link aggregation.

The VNXe is designed to be simple to implement and it is exactly that. The VNXe itself is a very clever box and it is because of this that it’s hard not to implement in a way that will work under most failure situations (thanks in part to FSN). Even if most configurations will allow the VNXe to work, there are still better ways to do things.

Part of the issue with VNXe is that it’s so simple, people who don’t normally dabble with storage solutions implement it and thats when people come up with these unnecessarily elaborate configurations because they aren’t familiar with multipathing, either with VMware ESXi or in general. This inspired me to create this blog post in the hope I can help steer people to the relevent documentation before they deploy their VNXe 3100.

A pre-requesit before even trying to deploy any iSCSI solution with ESXi is to read the VMware guidelines.

Software iSCSI Adapter configuration can be found for ESXi 4.1 and 5.0 in the following places.

- PG34 of [http://www.vmware.com/pdf/vsphere4/r41/vsp\_41\_iscsi\_san\_cfg.pdf](http://www.vmware.com/pdf/vsphere4/r41/vsp_41_iscsi_san_cfg.pdf)
- PG74 of [http://pubs.vmware.com/vsphere-50/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-50-storage-guide.pdf](http://pubs.vmware.com/vsphere-50/topic/com.vmware.ICbase/PDF/vsphere-esxi-vcenter-server-50-storage-guide.pdf)

 

The part I see people getting wrong time and time again with iSCSI configurations is with VMkernel ports and physical NICs. There should always be a 1 to 1 relationship between these. 1 VMkernel port with an IP to 1 Physical vmnic port. The guides above both show this in two specific configurations.

- Option 1 – one vSwitch, multiple VMkernel Ports and multiple NICs. (Uses port-binding)  
[ ![](http://www.neogeek.net/wp-content/uploads/2012/04/vSS-iSCSI-Option1.png "vSS iSCSI Option1") ](http://www.neogeek.net/wp-content/uploads/2012/04/vSS-iSCSI-Option1.png)
- Option 2 – A seperate vSwitch for each VMkernel/NIC. (Easiest configuration, no port-binding required)  
[ ![](http://www.neogeek.net/wp-content/uploads/2012/04/vSS-iSCSI-Option2.png "vSS iSCSI Option2") ](http://www.neogeek.net/wp-content/uploads/2012/04/vSS-iSCSI-Option2.png)

There are excellent videos showing Option 1 ( [http://www.youtube.com/watch?v=Mu-HyD3E3cw](http://www.youtube.com/watch?v=Mu-HyD3E3cw)) and Option 2 above ( [http://www.youtube.com/watch?v=oKH-DW6HrMc](http://www.youtube.com/watch?v=oKH-DW6HrMc)). The videos also show MTU being set for Jumbo frames which is important to help increase performance.

So after grasping the concept of 1-1 vmk to NIC the next question is, “_Is one NIC per subnet enough? Shouldn’t we have redundancy at this level?_”

If you have the NICs then sure why not but whatever you do, **DO NOT** just add these as Standby NICs. This is not a supported configuration from VMware.

The correct way to do this is to maintain the 1-1 vmk to NIC relationship and if using Option 1 add a NIC for each additional vmk and use port binding as you will already have done. In this setup you can add vmk ports which are in the same subnets as the existing two, i.e. add an additional port in each.

For Option 2 I am lead to believe when two subnets are used, going beyond two vSwitches would be unsupported since a subnet would be required per switch.  
The reason behind my opinion on this are the following line from the SAN Config guide on PG77.  
“ `NOTE If you use separate vSphere switches, you must connect them to different IP subnets. Otherwise,  
VMkernel adapters might experience connectivity problems and the host will fail to discover iSCSI LUNs.` “.  
I guess a hybrid approach where you have two vmk ports in two vSwitches using port binding would still meet the requirments and be supported as long as the same subnets are used on the two vmk ports in the same vSwitch.

Ultimately the simplest configurations are normally the best and easiest to troubleshoot. The diagram below shows the same config as described in the “EMC VNXe High Availability Overview” white paper. The white paper can be viewed here [https://support1.emc.com/docu35554\_White-Paper:-EMC-VNXe-High-Availability.pdf?language=en\_US](https://support1.emc.com/docu35554_White-Paper:-EMC-VNXe-High-Availability.pdf?language=en_US). The configuration below provides two pathes to each Datastore and uses the simplest vSphere configuration (Option 2 above). In my opinion if you are using the VNXe3100 without the add-on SLIC cards then its best to adhere to the document and have a deployment as below.

 

[ ![](http://www.neogeek.net/wp-content/uploads/2012/04/VNXe_Failover11-1024x654.jpg "VNXe_Failover1") ](http://www.neogeek.net/wp-content/uploads/2012/04/VNXe_Failover11.jpg)

        