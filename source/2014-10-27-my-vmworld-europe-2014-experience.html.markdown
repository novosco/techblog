---
title: My VMworld Europe 2014 Experience
date: 2014-10-27 09:55 UTC
tags: VMware
author: jimboefx
---

# Software defined everything - Hello (VM)World #

From the keynote through to the VMware lead sessions - I've heard software defined *X* more times than I care. Still there's nothing wrong with a little message reinforcement.

Repeat it until you vRealize it, eh?

READMORE

I was at VMworld Europe 2013 and the absence of a major vSphere release was a departure from last year's VMworld. Without this there was still plenty to talk about - I found this interesting it its own right as it left a gap to be filled.

Up stepped the SDDC and the new vRealize suite, vCloud Air (and the vCloud Air network) and End User Computing among other huge topics.

The theme of the event was no limits showcasing how various scaling and workload mobility challenges are being tackled across the entire VMware stack.

The following were some takeaway items.

# NSX was the clear winner in hands on labs #

![](https://pbs.twimg.com/media/B0DU23jIAAE1MzP.jpg:large)

What does this tell us? 12 months on from first giving IT professionals a taste of NSX - the hunger is still there to experience and understand this technology.

The timing is very interesting as VMware have taken the last 12 months to build up documentation and training material from a product acquired through the Nicera acquisition.

I attended two of the NSX hands on labs personally and found them to be very useful to introduce the platform and experience some of the advanced configurations possible.

# NSX has a clear marketing message at last  #

Pat Gelsinger used the keynote to refer to some high profile infrastructure network security issues. It's a well-known phenomena that organisations put their security dollars where they can be the most effective. Traditionally this budget is heavily invested in perimeter security or end point security.

The reality of many infrastructures is that if the perimeter security is breached then there is not much in the way of horizontal barriers within the data centre. The cost and complexity of implementing this level of security is beyond most organisations.

NSX - with its hypervisor embedded distributed router and firewall functionality offers something that feels relatively unique and useful in this space. The ability to construct rules based on various vCenter objects is pretty cool.

I went to a number of sessions that were designed to frame NSX in the real world - both in terms of deployment considerations and ongoing operations.

In particular the session "A Tale of Two Perspectives: IT Operations with VMware NSX" featuring Scott Lowe and Brad Hedlund took a humorous view of the "server guy" and "network guy" trying to figure out their relationship with NSX.

# Shouting loud about Virtual Volumes #

Virtual Volumes (or vVols) are not a new item of discussion. It's been in the public domain for some time - but as with any platform changing technology you need time and co-operation from your supporting ecosystem to execute on your vision.

To this end I went to the "Virtual Volumes Technical Deep Dive" session which feature some technical background and what solutions might look like. It also featured a video demo of vVols in action.

What is clear is that VMware have in some way used VSAN as demonstration of what is possible with VM centric storage policies. Virtual Volumes will leverage the same storage based policies and workflows for provisioning - requiring on the face of it only support and setup on the storage side.

# EVO:RAIL #

EVO:RAIL and EVO:RACK featured prominently in the keynote. Billed as hyper-converged 100% VMware software stack with that hardware from a partner of choice. The solutions exchange also feature the EVO:RAIL challenge where people just race to stand up their first virtual machine - I don't know what the final result was but one of the sessions referred to a 16 minute time at one stage.

That's impressive in anyone's books.

EVO:RAIL isn't just about rapid provisioning - it's targeting single SKU, single support audiences. So if you are a Dell EVO:RAIL customer then your support and updates come from Dell - VMware are 4th line support.

One press quote on a VMware slide had it billed as the "iPhone moment for VMware". I was sitting there thinking it was more like an Android or Windows Phone moment as the different partners will have their own update and support policies.

It won't be for everyone but Its one more choice for customers. 