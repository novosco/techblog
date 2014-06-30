---
title: Configuring vSphere App HA 1.0
date: 2014-01-24 00:51:24 +0000
tags: App HA
author: stejoh
---

When vSphere 5.5 was released, there were a number of features listed that I wanted to check out, App HA 1.0 being one of them. Recently I have been working with App HA in my homelab and realised there were a number of components which are probably new to many VMware Administrators.

This blog post is to explain what App HA does and to cover an overview of the install guided by what I carried out on my homelab.  
I focus on parts of configuration which would be new to most people such as in the Hyperic interface and the configuration required within vSphere to enable the functionality. I gloss over common things like deploying vApp’s as I expect most people will have done so at some point but if they haven’t there is a ton of material out there covering that.  
I hope others will find my post useful to quickly gain an understanding on the requirements to deploy it and to comprehend it’s functionality.

**What does App HA do?**  
App HA will assist the VMware Admin in controlling application availability by displaying the status of applications, triggering notifications when services are unavailable and performing remedial actions such as restarting the services and resetting the virtual machine.

At the time of writing in App HA 1.0, the following Services are supported:  
**_
- Apache Tomcat 6.0 and 7.0 on Windows and Linux
- IIS 6, 7 and 8 on Windows
- Microsoft SQL 2005, 2008, 2008R2 and 2012 on Windows
- Apache HTTP Server 2.2 on Windows and Linux
- SharePoint 2007 and 2010 on Windows with Hyperic 5.7.1 SharePoint plug-in
- SpringSource tc Runtime 6.0 and 7.0 on Windows and Linux

_**  
This list of Services are provided by VMware [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.install_guide.doc/GUID-B8ED9F77-78F4-4B38-BCCC-19034B8ABD89.html "Reference").

**The Installation and Configuration Steps**  
For the installation of App HA the first thing of note is that vSphere App HA 1.0 has a number of components that’ll need installed prior to enabling it, this includes vCenter Hyperic, the App HA vApp and Hyperic Agents. App HA functionality is not present in the vSphere Client only within the vSphere Web Client.

The Installation and Configuration Steps for App HA are:  
**_
- Deploy vCenter Hyperic 5.7x
- Deploy App HA virtual Appliance
- Hyperic Agent Installation (First of all on vCenter to allow the next step) (\*)
- Setup vFabric Hyperic vCenter Server Plug-in (enables alarms to be sent from vCenter Server)
- Use Web Client to Configure App HA to see Hyperic
- Set Cluster Configuration for “VM & Application Monitoring” (\*\*)
- (Optional) Configure Hyperic agent.properties Files to Enable Automation and Mass Deployment
- Configure and Assign App HA Policies (\*)
- Test Your Policies (\*)

_**  
_**N.B. Steps with (\*) need repeated for each VM.  
Steps with (\*\*) need repeated for each Cluster.**_

_**Deploy vCenter Hyperic 5.7x – **_

A pre-requisite for App HA is Hyperic, which is a product in it’s own right and came from one of VMware’s acquisitions. Hyperic is provided as either a vApp or an installer for selected Linux and Windows OS. One important point to note, if you intend on using Hyperic outside of the App HA use case, the vApp is recommended for large environments greater than 1000 managed platforms, other configurations are for “medium scale environments”.  
The Hyperic deployment type isn’t so much an issue when used with App HA as it has a scale limitation of 400 agents as mentioned in the [App HA 1.0 release notes](https://www.vmware.com/support/appha/doc/releasenotes-appha10.html "Reference") but the vApp is easier to deploy.  
The vApp is deployed via OVF and actually contains 2 VMs, one for the application and the other for the database (Remember to configure an IP Pool prior to deployment). The full deployment instructions can be found [here](http://pubs.vmware.com/hyperic-58/topic/com.vmware.hyperic.install.config.doc/GUID-996029EB-D20C-486F-A0F8-7F4893A44E9B.html "Reference").

![vFabric_Hyperic_vApp](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_Hyperic_vApp.png)

The Hyperic Dashboard looks like this:  
[ ![Hyperic](http://www.neogeek.net/wp-content/uploads/2014/01/Hyperic.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Hyperic.png)

_**Deploy App HA virtual Appliance – **_

This is the other vApp required for enabling App HA, this one being the actual AppHA vApp. It is deployed the same as Hyperic using an OVF template. This one consists of a single VM. Full vApp deployment details are [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.install_guide.doc/GUID-A98FA19A-EE71-40F1-B5C8-67E8C0B21D55.html "Reference")  
![AppHA_vApp](http://www.neogeek.net/wp-content/uploads/2014/01/AppHA_vApp.png)

_**Hyperic Agent Installation – **_

Each Server which you intend to leverage App HA with, will require the Hyperic Agents to be deployed and the Hyperic Agent will need to be installed on the vCenter Server to allow the creation of the VFabric Hyperic vCenter Server Plug-in (the next step).

On the vCenter server follow the below instructions (they are the same for the deployment of the Hyperic Agent for all Windows Servers):

- Download the zip archive
- Extract it to a directory (e.g. `"c:\hyperic-hqee-agent-5.7.1"` )
- Navigate to the _**“bin”**_ sub-directory (e.g. `"c:\hyperic-hqee-agent-5.7.1\bin"` )
- Execute _**“hq-agent.bat install”**_ and wait until it finishes.
- Execute _**“hq-agent.bat start”**_. Respond to the series of questions it will ask, they will be specific to your environment. Defaults will be correct in most cases except the final question for which the response must be changed to _**“yes”**_

These steps are shown in the command prompt window below:  
[ ![Hyp_Agent_Install](http://www.neogeek.net/wp-content/uploads/2014/01/Hyp_Agent_Install.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Hyp_Agent_Install.png)

The Platform (Server) will appear in the Hyperic Dashboard under the Auto-Discovery section. From there you can add it to the inventory by clicking the _**Add to Inventory**_ button.  
[ ![Add_to_Inv](http://www.neogeek.net/wp-content/uploads/2014/01/Add_to_Inv.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Add_to_Inv.png)

Perform the above Hyperic Agent install steps again for any other servers you wish to configure with App HA.  
Look to the _**“(Optional) Configure Hyperic agent.properties Files to Enable Automation and Mass Deployment”**_ section for details on making this easier.

_**Setup vFabric Hyperic vCenter Server Plug-in – **_

To enable alarms from vCenter Server if remediation actions are triggered, the vFabric Hyperic vCenter Server Plug-in needs created.  
The Hyperic Agent needs to be installed on vCenter Server for this. After the agent is deployed follow the steps below.

- Go to _**Resource > Browse**_ as shown below

[ ![vFabric_1](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_1.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_1.png)

- Click the vCenter server from the Platforms list. In my case this is NEO-VC01  
[ ![vFabric_2](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_2.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_2.png)
- Select _**Tools Menu > New Server**_  
[ ![vFabric_3](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_3.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_3.png)
- Enter Name as _**“VC”**_, select _**“VMware vCenter”**_ from the list and Install Path _**“\*”**_  
[ ![vFabric_4](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_4.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_4.png)
- Click on _**Configuration Properties**_  
[ ![vFabric_5](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_5.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_5.png)
- Fill in the _**URL**_ replacing “localhost” with your vCenter name or IP. Complete _**user**_ and _**pass**_ and leave _**process query**_ as it is. Finally ensure _**Auto-Discover Services?**_ is unticked.  
[ ![vFabric_6](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_6.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_6.png)
- On the vCenter Server ensure the _**VC**_ Resource has a green tick beside it (note this might take a short while) and thats the VC Plug-in sorted.  
[ ![vFabric_7](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_7.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/vFabric_7.png)

VMware documentation for this is [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.install_guide.doc/GUID-A1D00BE9-F105-48FE-B754-08CABFA57A5A.html "Reference").

_**Use Web Client to Configure App HA to see Hyperic – **_

The next step is to configure App HA from within the Web Client to see the Hyperic Server. This is done from the Inventory under _**Administraton > vSphere App HA**_ on the _**Settings**_ tab.

Complete the details giving IP or Hostname of _**vFabric Hyperic Server**_, _**Port**_ and _**Username**_/_**Password**_ as shown below.  
[ ![Hyperic_WebC_Config](http://www.neogeek.net/wp-content/uploads/2014/01/Hyperic_WebC_Config-1024x508.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Hyperic_WebC_Config.png)  
Full documentation on this is [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.install_guide.doc/GUID-A768AB6C-19D8-4A5E-ABB0-932887599B66.html "Reference").

_**Set Cluster Configuration for “VM & Application Monitoring” – **_

Each Cluster in which you wish to use App HA needs to have that functionality enabled.  
To do this, select the cluster then go to _**Manage > Settings > vSphere HA**_. From there click _**Edit**_.

In this menu ensure _**Turn ON vSphere HA**_ has the check box ticked if it isn’t already and under _**VM Monitoring**_ select _**VM & Application Monitoring**_ then click _**OK**_. The final step of this is shown in the image below.  
[ ![Cluster_Options](http://www.neogeek.net/wp-content/uploads/2014/01/Cluster_Options-1024x569.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Cluster_Options.png)  
Ensure you repeat these steps for each Cluster you wish to use App HA with.  
VMware documentation covering this section is [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.install_guide.doc/GUID-AA95681D-E39D-4E7B-974F-DB911BB1FAE3.html "Reference").

_**(Optional) Configure Hyperic agent.properties Files to Enable Automation and Mass Deployment – **_

When I came across this topic within the App HA documentation, the title was not the same as I have used for this section. I was a little confused and unsure why it was required. The reason for my confusion was the title and description in the first line of the docs mentioned nothing of automation or enabling mass deployment. The description on the first line was:  
_“To trigger vSphere App HA alarms on vCenter, you must configure certain properties in the relevant vFabric Hyperic agent.properties file.”_.

What it doesn’t explain here is that these steps are covered when you first run _**“hq-agent start”**_ and are asked a series of questions regarding Hyperic IP Address, Username and Password etc (this is described in the deploying Hyperic Agents section above).

We already know in order to use App HA the Hyperic Agent needs to be installed so if you have deployed and started the service for the Hyperic Agent then you have already ran through the series of questions covering these options and this isn’t required.

So what this section within the VMware documentation is actually describing is how to automate the answers to the Hyperic Agent deploy process. This became obvious when I looked at what it was trying to achieve and was confirmed by the description within the commented section in the `agent.properties` file. It states  
_“Use the following if you’d like to have the agent setup automatically from these properties.”_  
I highly recommend using these steps as it makes deploying the agent quicker, easier and most importantly enables mass deployment.

If you have already deployed the Hyperic Agent to a server and the service is running but wish to remove the configuration to try again, such as for testing then follow the clean-up steps below.  
_**If the Hyperic Agent has never been deployed then you will not need to perform these clean-up steps. Skip to the section “Configure the agent.properties File:”**_

_**Clean-up Steps (Only required if Agent already deployed):**_

- Stop the vFabric Hyperic agent which is achieved by running the _**“hq-agent.bat stop”**_ from a command prompt open at the agent bin directory. In my example from the `"c:\hyperic-hqee-agent-5.7.1\bin\"` directory.
- Delete the _**“data”**_ sub-folder from within the agent folder, in my example this is the `"c:\hyperic-hqee-agent-5.7.1\data\"` directory.
- Next delete the agent Platform from the Hyperic server inventory (i.e. Delete the Server entry within the Hyperic Inventory)  
[ ![Remove_Agent_from_Inv](http://www.neogeek.net/wp-content/uploads/2014/01/Remove_Agent_from_Inv.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Remove_Agent_from_Inv.png)

The following section describes steps to edit the `agent.properties` file and includes the properties the VMware documentation mentions as well as two other properties I found necessary to have the deployment fully automated. I found if I did not include these properties that it would ask me for a response when the Hyperic Agent was started for the first time. The extra properties are “agent.setup.camIP=” and “agent.setup.unidirectional=”. The first is the Hyperic Server IP address and the second is the option on whether the agent should communicate in a unidirectional manner.

_**Configure the agent.properties File:**_

- If the Hyperic Agent is not already on the Server, extract it to a local directory. Open the `agent.properties` file found within the _**“conf”**_ sub-directory. In my example from the `"c:\hyperic-hqee-agent-5.7.1\conf\"` directory and edit the following values replacing the entries between the asterisks (N.B. The Username is normally hqadmin) ensuring the “#” at the beginning of the line is deleted so the option is not commented out:
**agent.setup.camLogin=\*Replace\_With\_Hyperic\_Username\*  
agent.setup.camPword=\*Replace\_With\_Hyperic\_password\*  
agent.setup.acceptUnverifiedCertificate=yes  
accept.unverified.certificates=true  
agent.setup.camIP=\*Replace\_With\_Hyperic\_Server\_IP\*  
agent.setup.unidirectional=no  
**

Then save the file.

- Start the Hyperic agent by running _**“hq-agent.bat start”**_ from the command prompt opened at the agent _**“bin”**_ directory.  
If it is configured correctly it should not ask any questions as it did prior to using the agent.properties file.

To use this for other Servers you intend to use with App HA:  
Extract the Hyperic Agent, copy the `agent.properties` file with the modified properties above to the _**“Conf”**_ sub-directory, install with _**“hq-agent.bat install”**_ and start the service with _**“hq-agent.bat start”**_.

The VMware documentation covering this section can be found [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.install_guide.doc/GUID-851BF1D0-3558-4ABD-9113-67EA31BBAA99.html "Reference").

_**Configure and Assign App HA Policies – **_

The next step for configuring App HA is to look at Policies.  
Remember any servers you wish to monitor need the Hyperic Agent installed so ensure the agent is deployed before proceeding (Steps above).

Policies are created from within the vSphere Web Client at _**Administration > vSphere App HA**_ on the _**Policies**_ tab.

For my testing I created a SQL Server policy which can be seen in this list.  
[ ![AppHA_Policies](http://www.neogeek.net/wp-content/uploads/2014/01/AppHA_Policies.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/AppHA_Policies.png)

To create a Policy click the green plus seen in the above image. In the wizard assign a _**Policy Name**_, choose an _**Application Service**_ with any further service specific options, choose _**Remediation**_ for that service (Service restart and VM reset configuration) and whether you want to create an _**Alarms Definition**_. Policies configured can be used across multiple VM’s, there is no need to create duplicate policies unless the configuration options are different.

Now you have created a policy it just needs assigned to whatever machines you wish to provide App HA for. This is done at the cluster level.

On the cluster which contains the VM you wish to enable the policy with, navigate to _**Monitor**_ then the _**Application Availability**_ tab. This will list all machines with services Hyperic is aware of. This is shown in the image below.  
[ ![App_Avail](http://www.neogeek.net/wp-content/uploads/2014/01/App_Avail-1024x324.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/App_Avail.png)

From the _**Application Availability**_ screen right click or use the _**Actions**_ menu to _**Assign**_ or _**Unassign**_ a Policy.

Full details on Assigning a Policy to Application Services can be found [here](http://pubs.vmware.com/appha-1/topic/com.vmware.app.ha.users_guide.doc/GUID-2C55E2A8-3DCA-46F9-BB95-376D6AD9D8B5.html "Reference").

_**Test Your Policies – **_  
As with anything you configure, it is prudent to test it to see if it reacts as you would expect. In my homelab I have configured a policy for SQL Server so used that as my test.  
I stopped the SQL Service on my NEO-TOOLS01 server and within about 60 seconds the following was visible from the vSphere Web Client:  
[ ![Service_Unavail](http://www.neogeek.net/wp-content/uploads/2014/01/Service_Unavail-1024x375.png) ](http://www.neogeek.net/wp-content/uploads/2014/01/Service_Unavail.png)

And nearly immediately after this alert came through, the service was restarted and the Availability Status returned to Available.

**Wrap Up**  
This concludes the steps which I performed in order to get App HA 1.0 up and running in my homelab environment. If you’ve got through this far and look back at the start, at the list of tasks involved in configuration you’ll notice the steps marked with (\*) which will need to be performed to add new VM’s/Applications to be monitored by App HA and steps with (\*\*) that you’ll need to complete for each new Cluster configuration.  
Once it is up and running you’ll find it’s extremely easy to add more and also once you are familiar with the process I recommending looking at methods of deploying the Hyperic Agent with the modified agent.properties file in bulk.

Thanks for reading.
