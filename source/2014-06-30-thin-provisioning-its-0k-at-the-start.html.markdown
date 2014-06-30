---
title: Thin provisioning - its 0K at the start
date: 2014-06-30 14:28 UTC
tags: Storage
author: jimboefx
---


It probably says a lot about me that I find the title funny. This post is about thin provisioning - but in reality its all about money.

READMORE

# Thin provisioning is lying #

Thin provisioning is promising something that you don't have - but will have by the time its needed. It's that simple.

![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/01_IOU.PNG)

In monetary terms thin provisioning is no more than an IOU.

## Why is thin provisioning all about money? ##

Generally speaking thin provisioning is about getting more out of less - its normally a value orientated proposition to maximise the usage of scare resource. Traditionally this is a function operated within the storage infrastructure - however it can be found as a native function of hypervisors and guest OSes alike.

Storage is interesting as it is often treated as a scare resource to provision and at the same time a zero-cost resource to consume. Why is this?

This problem exists because the resource is often seen as paid for and wasted unless provisioned. If I'm only consuming half of my storage the effective cost is 2X.

## How much does my storage cost? ##

For this simple example I have put together a fictitious 20TB storage system consisting of 1TB disks. For the sake of simplicity I've assumed a 1TB disk has 1TB usable (that's another kettle of fish). 

2 disks are used to hot spare. 12 of the usable 14TB is provisioned as 6x2TB LUNs (2TB is kept back for array operations such as replication or free space for a rainy day). These are effectively design decisions as you could certainly rationalise less (or more hot spares) and the 2TB LUNs could easily be 4TB LUNs instead.

![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/Storage_Costs_1.png)

In thus example the cost of the raw storage is £X/TB. The effective cost of a usable TB to the application is actually closer to 2X in this example. This assumes no more than 90% utilisation at the various levels of provisioning that I've illustrated.

## Comparing raw and usable costs is like comparing apples with apple juice ##

You can consider the cost differential of raw versus usable as an **availability tax**. It is a tunable cost in line with your appetite for risk. You could make it cheaper by reducing the level of data protection at the RAID level - or you could have fewer hot spare disk to cover disk failure scenarios.

As systems rarely run at 90% utilisation (due to the potential of running out of space and causing an outage) there is often storage allocated to cover months or even years of potential growth.

One might note that there's no explicit availability tax in the layers above RAID - (LUN provision, VMFS, Guest file system). 

This is where thin provisioning typically enters the fray.

## Storage allocation - thick provision ##

Application 1 and Application 2 each require 1TB of usable storage for the next 3 years. Each application owner will be charged 10% of the storage costs since we have about 10TB usable in total.

![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/Storage_Costs_2.png)

The application owners may protest. We only need that storage assigned - we don't actually need it all initially. Couldn't you thin provision it and charge us what we actually use?

## Storage allocation - with thin provisioning ##

Thin provisioning appears to solve a problem here. We can assign some of the "scarce" resource to the application owners and only charge them what they use - this appears to lower the cost of the application to the business. Everyone's happy, right?

With thin provisioning the storage allocation may be portrayed as at least initially:

![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/Storage_Costs_3a.png)

In actual fact its more like this:
![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/Storage_Costs_3b.png)

The "free" space will decrease over time as on the on disk usage of Application 1 and Application 2 increase. In this scenario however you haven't achieved any saving. The underlying physical capacity remains under utilised and the storage promised equals the storage available. You may as well have thick provisioned.

This is a waste of everyone's time unless there is further provision. Enter application 3:

![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/Storage_Costs_3c.png)

You have achieved a provision of application 3 without the requirement of physical storage provision - but at the cost of risk. There is now a capacity race. You must provision physical capacity before you use all of the "free" space.

Depending on your appetite for risk you may over commit by any degree:

![](http://tech.novosco.com/images/jamesmontgomery/thinprov14/Storage_Costs_3d.png)

## Monetary debt has interest. Technical debt is no different. ##

Understanding monetary debt is relatively simple. You borrow an amount of money and repay it plus some percentage. The interest is used to service the loan and provide profit to then lender who assumes the risk of loaning you the money.

Technical debt is a little harder to understand. In the case of thin provisioning you will take on the following debt:

- Periodic capacity review and report.
- Training of application owners to understand where thin provisioning exists and to implement processes to communicate with the storage team where high disk writing is expected (such as a DB copy or restore).
- Understanding the present lead time of delivery of storage expansion and costs.

## Is thin provisioning bad? ##

No. Thin provisioning is a tool that can be used to enable IT to provision infrastructure at business speeds.

The challenge is deciding on the appropriate use of the technology and matching your operations with any risk or complexity you introduce.

<!---
Version 1a
-->


