---
title: Planning your XenMobile MDM Pilot
date: 2013-11-21 12:21:39 +0000
tags: Uncategorized
author: rainco
---

Mobile Device Management has been around for a few years now for iPads and Androids devices, and of course BlackBerry has been doing BES for much longer. I have been doing a few MDM installs recently with Citrix XenMobile MDM. This is now in version 8.6 and was already in version 7 when Citrix purchased Zenprise, one of the market leaders in December 2012.

If you’re looking at deploying Citrix XenMobile MDM in a pilot make sure you check through the installation guide, the References Architecture and the MDM Deployment kit if you can get your hands on one. These will help you plan for the infrastructure you need to put in place.

You also need to decide the limits of your POC. Do you just want to look at the device management, security and inventory? Or do you want the whole Enterprise solution with your own corporate app store, micro-vpn into the LAN and secure apps that you can sandbox and have full control over?

For Enterprise MDM, Citrix have bundled ShareFile Enterprise which make the whole solution even more appealing if you want to enable secure file access into your corporate shares and encrypted ShareFile repository. Indeed, the combined features of XenMobile MDM, Worx corporate app store and ShareFile make the enterprise solution very appealing as it would take 2-3 other vendors’ products to do all of these.

Some questions to start you off..

- What infrastructure servers will I need?
- Have I got external IPs?
- What type of devices will I need to control? (Apple, Android, Windows Mobile etc)
- What users will I target for the pilot?
- Will I let them use their own device?
- Have you updated any use policies and got users to sign?
- What are the implications for controlling personnel devices?
- Will the project include ShareFile?
- What SSL certs will I need?
- Is there a budget for installation and licensing?
- Have I got a project plan and success criteria sorted?

 

**Pre-Requisites**

Once you have worked out the answer to the questions above..you’ll need to get the following sorted out well in advance of installation.

- External IP/ports – get your change control submitted to Firewall manager in good time.
- DNS – make sure you have external DNS records for CAG,MDM and ShareFile.
- SSL – You will need at least two external SSL certs or wildcard. You will also need another 2-3 internal certs for App Controller and StoreFront internally.
- DUNS Number – Dun and Bradstreet ID from [www.dnb.co.uk/](http://www.dnb.co.uk/) – for Apple Dev Kit
- Apple Enterprise Developer Kit from Apple at $299 + APNS Certificate
- NetScaler – you will need a NetScaler with virtual CAG

The last two go together, and you need to get that DUNS number 4-5 weeks before you apply for the Apple Ent. Dev kit.

When Applying for that Apple Dev Kit, make sure you are the project manager or someone who can say they have authority to purchase the kit from Apple – otherwise they won’t talk to you if you need to call support.

The Apple kit is required for pushing secure apps to iOS devices and for packaging the Worx app son iOS and Android. The Apple Push Notification Service (APNS) is required for installation. This is a certificate for your MDM server that you need to email to Citrix, then post into your Apple account to generate an APNS certificate. This is required just to install the MDM software.

If you don’t already have one –you’ll need NetScaler to provide secure access into the Worx Store which resides on the App Controller component, and the StoreFront server for XenApp/XenDesktop access. It also provides the micro-vpn for access to internal web and mail.

**Devices**

Beware of any documentation or sales blurb that promises that any MDM solution will work on every device with every OS. The dream of BYOD for everyone may be possible, just –  but probably with some limitations to certain functionality.

For example, HTC Desire X and 500 models with android 4.1.2 simply won’t load the Citrix Worx Mail client, while a Samsung model with 4.1.2 works perfectly. All the MDM policies work fine. Documentation for the various components in the Enterprise MDM has different supported levels of Android OS and Android SDK API for Worx apps and the micro-vpn so worth checking.

If possible, make sure your Android device has latest build and is at least in support and not End Of Life in terms of downloads and updates to core OS components.

Apple devices are easier to support as there is only one hardware platform, albeit with 2-3 iOS version out there. MDM 8.6 has support for latest iOS 7.

**References:**

Citrix, (2013) MDM Editions Data Sheet [Online] Available from: [http://www.citrix.com/content/dam/citrix/en\_us/documents/products-solutions/citrix-xenmobile-the-revolutionary-way-to-mobilize-your-business.pdf](http://www.citrix.com/content/dam/citrix/en_us/documents/products-solutions/citrix-xenmobile-the-revolutionary-way-to-mobilize-your-business.pdf)

Citrix (2013) Reference Architecture for Mobile Device and App Management [Online] Available from: [http://www.citrix.com/content/dam/citrix/en\_us/documents/products/citrix-reference-architecture-for-mobile-device-and-app-management.pdf](http://www.citrix.com/content/dam/citrix/en_us/documents/products/citrix-reference-architecture-for-mobile-device-and-app-management.pdf)

Citrix (2013) Compare XenMobile to the competition [Online] Available from: [http://www.citrix.com/products/xenmobile/how-it-helps/compare.html](http://www.citrix.com/products/xenmobile/how-it-helps/compare.html)

Dun and Bradstreet (2013) DUNS Number [Online] Available from: [http://www.dnb.co.uk/dandb-duns-number](http://www.dnb.co.uk/dandb-duns-number)

Apple (2013) iOS Developer Enterprise Program [Online] Available from: [https://developer.apple.com/programs/ios/enterprise/](https://developer.apple.com/programs/ios/enterprise/)

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/37/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/37/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=37&subd=cjrainey&ref=&feed=1)
