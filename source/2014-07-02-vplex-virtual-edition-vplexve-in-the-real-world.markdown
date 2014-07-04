---
title: VPLEX Virtual Edition (VPLEX/VE) In The Real World
date: 2014-07-02 23:55:35 +0100
tags: EMC
author: stejoh
---

It seems so long ago now when I reviewed EMC World 2014. One of the things I wanted to learn more about while I was there was VPLEX/VE.  
So far, everything I have found out makes me wonder, “Which type of customer it is designed to fit?”. To explain what I am talking about here you need to know the architecture.

**VPLEX/VE Architectural Features:**

- Uses vApps and runs on ESXi.
- Requires 4 vDirectors per site and each is statically bound to an ESXi Host.
- Has a virtual management server per site that can reside on any of the ESXi hosts.

[ ![VPLEX-VE_Architecture](http://www.neogeek.net/wp-content/uploads/2014/07/VPLEX-VE_Architecture.jpg) ](http://www.neogeek.net/wp-content/uploads/2014/07/VPLEX-VE_Architecture.jpg)

- Has optional cluster witness feature and for ideal circumstances this needs a third site.
- VPLEX/VE will only operate between 2 sites synchronously (VPLEX Metro).
- 2x WAN links are preferred with latency up to 10ms roundtrip between replicated sites and up to 1000ms between replicated sites and witness site

[ ![VPLEX-VE_Architecture2](http://www.neogeek.net/wp-content/uploads/2014/07/VPLEX-VE_Architecture2.jpg) ](http://www.neogeek.net/wp-content/uploads/2014/07/VPLEX-VE_Architecture2.jpg)

- Is iSCSI only (FC is only in the bigger brother full VPLEX).
- Supports VNXe arrays only.
- Is limited to 80K IOPS
- Is managed via the vSphere Web Client
- Needs distributed Switches for operation

**The Argument:**

Having covered the above points lets extract what this really means. VPLEX/VE is an amazing feat of engineering. I welcome the software only version of the brilliant VPLEX hardware but I find its use may be somewhat limited currently. Perhaps I am not thinking openly enough?

My argument is based on the fact that VPLEX/VE supports VNXe and iSCSI only, so can only appeal to companies who would use this combination of storage array and protocol for production storage. i.e. small businesses.

I find the following areas conflict with the typical profile of small businesses:

- 4 ESXi Hosts per site are required as a minimum. Due to needing distributing switches these Hosts will require Enterprise Plus licensing. Many small businesses aren’t likely to have as many as 8 hosts and usually license vSphere at lower versions due to costs.
- The witness should reside on a third site. Many small businesses are lucky to have somewhere suitable to run their Server hardware at 1 site, let alone 3.
- Having 2 WAN links between Site 1 and Site 2 with less than 10ms round trip time is a big ask for a small business. Even 2 WAN links between Site 1 & 3 and Site 2& 3 with 1000ms round trip time could be challenging in some small businesses. I appreciate however that it will work with 1 WAN link between each Site.
- Implementing a stretched vSphere cluster doesn’t stop once compute resource and active/active multi-site storage has been provided. It requires networking configuration providing a stretched layer 2 subnet and this is again something a small business is less likely to have.

Many of these requirements are easily met in larger companies. Multiple sites with facilities to run hardware, 4 hosts per site on 2 sites with a third to run the witness, low latency WAN links.  
These are all pretty trivial for larger customers but VNXe as a main production storage array running a workload important enough to give it a multi-site stretched vSphere cluster is something I think is unlikely to be present in those customers.

I appreciate that VNXe is frequently used in larger companies (e.g. branch, departmental use or backup targets) but those same companies are much more likely to run the full blown VPLEX with a high-end VNX or VMAX, especially for very important workloads.

VNXe as a production storage array in my experiences are primarily found in small businesses whereas the environment required to support VPLEX/VE is rarely found in companies of that size. There are always exceptions but to put it bluntly, if a company can afford the environment required to run VPLEX/VE, they are likely to use a higher caliber storage array (Not putting VNXe down, it is a great product).

Disagree? Let me know in the comments.
