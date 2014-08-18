---
title: How VSANs Are Like Kit Cars (in light of recent VSAN HCL Update)
date: 2014-08-18 13:26:11 +0100
tags: Storage
author: stejoh
---

Sometimes the two things I love most, technology and cars overlap, or maybe I am just wanting an excuse to talk about them both. Either way, people seem to understand analogies using cars related to technology so I am going to use one here to describe something that has happened recently affecting one of the emerging trends in technology ‘Software Defined Storage’ (SDS).

Every now and again, car manufacturers who provide pre-built cars recall certain models due to issues. In the UK we even have a government website to check [https://www.gov.uk/check-if-a-vehicle-has-been-recalled](https://www.gov.uk/check-if-a-vehicle-has-been-recalled "UK Gov Vehicle Recall Check").

So this brings me to what has happened recently. VMware announced they were removing support for a dozen Storage Controllers that were previously on the VSAN Supported Hardware Compatibility List (See the VMware blog post [Here](http://blogs.vmware.com/kb/2014/08/alert-storage-controllers-virtual-san-longer-supported.html "VSAN Storage Controllers No Longer Supported")).

I wasn’t that surprise to see this, especially as two Months ago a colleague drew my attention to this post on Reddit, under the VMware Sub-Reddit ( [VSAN Outage Root Cause](http://www.reddit.com/r/vmware/comments/2799p4/root_cause_analysis_of_my_vsan_outage/ "VSAN Outage")). This post describes a VSAN outage were the conclusion which came from VMware Support was that after experiencing the outage and then needing to rebuild, that their Storage Controller, a Dell H310 (with very low queue depth of 25) simply wasn’t able to support high enough IO throughput to perform the rebuild whilst still running production.

The amendments to the VSAN HCL are no doubt related to support cases like this or perhaps related to Storage Controllers that share the same family or characteristics which prevent them from being able to deal with the worst-case scenarios such as the one which happened to this unfortunate person.

It isn’t really surprising to see updates to Hardware Compatibility Lists (HCL) although perhaps less usual to see amendments removing items that were already on there. This brings me to the following conclusion. In the Software Defined World where VSAN in this case is the Software Defined Storage (SDS) product, it isn’t just about the software. The hardware is **even** more important.

So back to my car analogy. This time I am contrasting the differences between a pre-built car and a kit car.

When you buy Off-The-Shelf storage arrays from EMC/NetApp/HDS/3PAR etc these are designed specifically to meet a certain standard of performance, just like a pre-built car. When you buy one of the Porsche 911 models it comes with a distinctive look, feel and performance characteristic just like the Off-The-Shelf storage array.

When you buy a kit car you will get a frame and other parts that define the look and feel of the car (like the software in SDS) but what you put underneath it, the engine and drivetrain (the part that delivers the engines power to the wheels) you choose determines the performance of that vehicle. This is the same with a Software Defined Storage approach and in this analogy, the engine is like the disks and the Storage Controller like the drivetrain.

There is another point that this analogy can be used to explain. When you buy a pre-built car, you typically get a manufacturers warranty which covers everything for the first 3 years whereas if you buy a kit car then the individual components have their own warranty.  
In a pre-built car, the sum of the parts are guaranteed to function as expected for the term of the warranty. Whereas in the case of the kit-car the individual components are covered or in the case of Software Defined Storage, the software and the hardware are covered independently, so the software is assured to function with the hardware designated as supported but the performance derived from the sum of the components is not covered. So remember the burden of ownership with regards to performance is on the customer not the supplier.

Kit cars don’t get recalled in their entirety, perhaps a component like a seat belt holder will get recalled just as a Power Supply from a server may be recalled. If a seat belt in a pre-built car was found to be faulty then the whole car would be recalled so that could be addressed but the reason a kit car isn’t recalled in it’s entirety is because it is not the whole product.  
Like a pre-built car manufacturer, Off-The-Shelf Storage Array manufacturers will normally distribute any known issues and have a fix available for them. They may even just contact you to arrange a time to apply the hotfix included under your maintenance. In the case of a kit car or a Software Defined Storage array, the ownership of maintaining the setup is on the customer.

So if you are running VSAN, the burden is on you the customer to ensure you are not let down by either performance or any issues that have become known. Don’t cheap out on the components, not the disks or the Storage Controller. The Storage Controller other than the disks is probably the most important component to ensuring it performs as you expect it to.  
For known issues I would suggest frequently checking for updates from VMware, to see if there are any Knowledge Base articles specific to your hardware configuration and then arrange to upgrade, patch or amend your setup to address the issues with it as soon as possible. To assist in keeping track of known issues use the [VMware KB Digest](http://blogs.vmware.com/kbdigest/ "KBDigest"), you can subscribe via RSS or follow their twitter account [@vmwarekb](https://twitter.com/vmwarekb "VMwareKB Twitter").

I think Software Defined everything is great, it will help give us get many flexibility benefits just as virtualisation has already done. I think Vmware VSAN is great, a real step forward and perhaps something which will ultimately lower the entry level cost of shared storage whilst also increasing the mobility of data.  
However compared to an Off-The-Shelf Storage Array, VSAN has slightly higher maintenance needs. It has many positive aspects too, such as it’s simplicity of operations and tremendous flexibility.  
So if planning a VSAN it is worth being equipped with this knowledge before hand. Also check the latest VMware pre-validated configurations named ‘Virtual SAN Ready Nodes’ over [here](http://partnerweb.vmware.com/programs/vsan/Virtual%20SAN%20Ready%20Nodes.pdf "VSAN Ready Nodes"). It may be best to form your solution matching or close to one these.

Now I just need to get a home that has a garage so I can build a kit car or maybe I will just get saving for that Porsche 911 Carrera. Ha, even if I had the cash, my Wife would have something to say about either option!
