---
title: The Stateless Desktop Part 2
date: 2013-11-15 12:34 UTC
tags: Desktop,VDI,RDS
author: crod
---
As discussed on Part 1, anyone that has been dealing with TS/RDS and its add-ons (i.e. Citrix XenApp) do understand applications, settings, preferences and what to do with these regarding the user experience.

That means over the years RDS delivered a solution that would indeed allow the user to connect to any server and have its preferences, settings and files follow them. Nothing was really stored on the server, regarding the user environment (his preferences, settings and data). That is why users could be redirected to any server and work the exact same way he did the day before.

READMORE

If a server experienced an issue, like a BSOD, the user would simply connect to the environment again and get a new session. His environment followed him. Sure some data could have been lost during that crash but that could be minimized in many ways (autosaving, committed transactions, etc).

Leaving RDS aside for a moment, that was the exact same scenario when using regular PCs. We would save the user data to the network and if we wanted to preserve his settings and preferences when replacing a dying PC we would enable roaming profiles (in a plain Windows environment). Of course we could also leverage other solutions to deal with the user environment.

And when that PC died the user would get a new PC and his environment would be back exactly like it was before the crash. Again, some data could be lost…

Then virtualization took off, first on the idea of consolidation. How many of you heard (or pitched) the story about servers being idle in the datacenter and why virtualization would allow you to consolidate five, ten servers in one? That was the sales pitch for virtualization at the beginning.

As everything evolves, so did virtualization. Admins could now move running virtual machines between physical hosts (how many of you did not think that was the coolest shit ever developed by the human race?), reducing downtime. That of course, at the beginning, required shared storage. That is when SANs came into the virtualization world.

Before we jump into the VDI discussion let’s think about RDS. Do we really need to be able to move a running RDS VM to another host? This would only be required during maintenance on the physical host. If the whole environment was properly sized the other hosts can indeed take the load of the missing RDS servers if they were down (for example if the host itself explodes). That brings us back to the days where when our RDS server did crash users would connect to another one and life went on. And of course his environment was there.

So do we really need shared storage (SAN) with RDS? IMHO not really, unless you have a problematic environment where your hosts have to be patched every day. Or you need to certify your environment as 99.9999999% available for whatever reason, in case 99.9999% is not good (that is by the way 32 seconds of downtime in a full year).

Ok no SAN. Assuming that, what does it mean? First of all, probably more money in your pocket. Well technically your company’s pocket. Secondly, with that money we can try some interesting things. That brings us
