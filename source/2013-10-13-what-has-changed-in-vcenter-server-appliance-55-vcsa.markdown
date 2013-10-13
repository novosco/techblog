---
title: What has changed in vCenter Server Appliance 5.5 (vCSA)?
date: 2013-10-13 14:00:05 +0100
tags: vCenter
author: stejoh
---

Strategically it makes a lot of sense for VMware to decouple themselves from the Windows Server OS for management machines. There are many advantages to doing this which benefit SMB and Enterprises such as simplified install and no Windows or SQL licenses required. These advantages are also valid for Service Providers along with the automation possibilities it brings.

So lets look briefly at the history of vCSA:

READMORE

In vSphere 5.0 along came vCenter Server Appliance (vCSA). DB support was embedded (DB2 or Postgres) or externally on Oracle. The single biggest problem was that using the embedded database it was severely limited. So much that it was relegated to test labs.

**vCSA with vSphere 5.0/5.1 – Supports Max 5 Hosts and 50 virtual machines.**

The new version with vSphere 5.5 has the same DB options (with embedded on Postgres) but has removed this embedded DB limitation taking that up to well past what most customers are ever likely to use on a single vCenter

**vCSA with vSphere 5.5 – Supports Max 100 Host and 3000 virtual machines.**

There are however still other things holding the vCSA back from dominance as the preferred method of vCenter deployment. vCenter matured on the Windows platform and had capabilities built on.

- Linked Mode (uses Microsoft ADAM)
- Heartbeat (only works with SQL)

These capabilities are what to this day are still missing from the virtual appliance and are some of the reasons vCSA cannot be used in certain production environments. For the vCSA to get these features means they need to be Linux friendly and that probably means using different methods rather than a port of existing software.

Even for those that can live without Linked Mode and Heartbeat the single biggest reason why people will stick with a Windows vCenter is that Update Manager (VUM) does not come integrated in the vCSA or have a standalone virtual appliance. **There is also a 1 to 1 relationship between vCenter and Update manager meaning for every deployment assuming you want to use VUM you will need a Windows Server and a SQL database anyway**, so why not use it for vCenter too.

Continuing to deploy vCenter on Windows is probably the route many people will still take as it takes no real extra thought. Components like SSO have made that install more complicated so it makes real sense to want to simplify this and the vCSA is definitely the way to do this.

Until at least the Update Manager component has its Windows dependencies removed, made into a virtual appliance or integrated into vCSA, we will continue to see vCSA reign as the quick and easy pop-up VM in the lab but not in Production. That said, let me not play down what an important milestone this is towards the removal of Windows OS’s in vSphere administration, the core vCenter functionality is now here in vCSA and this is a great win for VMware at this stage. Addressing the VUM component next is likely to swing sufficient number of customers over to using vCSA and it would likely snowball from there.
