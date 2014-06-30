---
title: Session Printers in XenApp 6.5
date: 2014-05-01 15:44:27 +0100
tags: Citrix
author: rainco
---

Citrix has several ways to enable printers in user’s sessions including network print server based printers. These are called _Session Printers_ and are configured in the Policies node in the Citrix AppCentre Management console.

Printers can also be mapped using a login script or Vb-script. In this case, all the print server drivers for individual printers need install on the XenApp server of PVS image. Printers mapped in scripts are outside of the control of Citrix Policies and management.

By Using Citrix Policies, administrators have more control over when and how printers are made available.

For example, a set of Printer Policies filtered by IP Subnets could be used to enable roaming printers on mobile devices or laptops. Users would then find printers in session that are close to the department they are working in at the time. Other filters include Groups/Users and client device names.

So, you could have a Policy that is enabled by “IPAD\*” for example where all devices called IPAD will get that policy – and enabled printers and other settings.

Client connected printers (not addressed here) are either locally attached OR may be mapped network printers on a PC or Mac client machine. These can be controlled in Citrix AppCentre Management and are known as _Client Connected_ printers.

Citrix XenApp servers can use server printers in two ways:

- Citrix Universal Print Server (requires UPS server and client install, on XenApp media).
- Native Manufacturers Printer driver.

**To install a native driver**

- login as an admin to the XenApp server.
- browse the print server and find the printer (must have x64 drivers).
- double click and install the printer as normal.
- then delete the printer from the Control Panel/Devices and Printers – leaving the driver installed.

**Creating a Policy with Session Printers**

The three steps you need to enable Session printers are:

**Create a new User Policy**

Under Policies – select the User tab, and click on New – or edit an existing policy. Givr your policy a name.

**Assign the Session Printers**

Go to Settings and look for Printers

Click on Add/Edit at Session Printers – when prompted type the name of the print server – and browse the servers printers – select the printer you need.

Add in other printers if required – you can also set the Default printer as shown above.

**Filter by AD User Group**

Click on the item you want to use as the filter – for example, User of Group.

You should then test the policy by using a suitable test account or known user. If the UPS service is compatible with the printer – the device should be shown as an available printer in the users session and applications.

**Issues:**

- Citrix UPS is not compatible with manufacturers Universal Drivers.
- If the Citrix UPS Driver does not print to the device – the native driver will need to be installed. The server policy should be set to “fallback” to native in this case.
- Some printer drivers may not be Citrix ready. It is recommended to check the vendors support or documentation regarding suitable models and drivers.

**Some manufacturers support references:**

HP Supported Printers in XenApp

[http://support.citrix.com/servlet/KbServlet/download/10498-102-649930/HPprinters\_CitrixXenApp\_1053.pdf](http://support.citrix.com/servlet/KbServlet/download/10498-102-649930/HPprinters_CitrixXenApp_1053.pdf)

Ricoh Terminal and Citrix supported printers

[https://support.citrix.com/article/CTX121349](https://support.citrix.com/article/CTX121349)

Sharp

[https://support.citrix.com/article/CTX135670](https://support.citrix.com/article/CTX135670)

Xerox

[http://www.office.xerox.com/support/dctips/dc14cc0492.pdf](http://www.office.xerox.com/support/dctips/dc14cc0492.pdf)

Brother

[http://www.brother.co.uk/g3.cfm/s\_page/257810/s\_name/citrixreadybrotherdevices](http://www.brother.co.uk/g3.cfm/s_page/257810/s_name/citrixreadybrotherdevices)

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/59/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/59/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=59&subd=cjrainey&ref=&feed=1)
