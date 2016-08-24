## Instructions

This document describes the necessary steps to deploy a DataStax Enterprise (DSE) cluster in an Oracle Public Cloud (OPC) environment.  Below is the high level sequence of steps you will need to follow in order to successfully deploy your DSE cluster.

1. Obtain your Oracle Public Cloud (OPC) account
2. Set up your workstation with Oracle Compute Cloud Service Command Line Tool
3. Install our assets on your workstation to provision DSE cluster in OPC
4. Update the clusterParameters.json to reflect your own settings
5. Run the deploy.sh to deploy a DSE cluster in your OPC environment
<br>

###### 1. Obtain your Oracle Public Cloud account
If you do not have an account with OPC, please follow this [here](https://myaccount.cloud.oracle.com/mycloud/faces/trialsignup.jspx?serviceType=IAASMB) to apply for one.
<br>

###### 2. Set up your workstation with OPC Command Line Tool
With regards to where you want your workstation to be, you have two options.  The first option is to create a local  Oracle Enterprise Linux 6.7 virtual machine on your destktop.  The second option is to create an OEL 6.7 instance in your OPC account.  
        
Once you got this virtual machine or OPC instance up and running, you can follow this [link](http://docs.oracle.com/cloud/latest/stcomputecs/STCLR/GUID-62B0B2BD-A95F-4F82-B144-8C1DBA8760E9.htm#STCLR-GUID-62B0B2BD-A95F-4F82-B144-8C1DBA8760E9) 
to set up your Oracle Compute Cloud Service CLI and the required environment variables and files.
<br>
        
###### 3. Install DSPN assets on your workstation to provision DSE cluster in OPC
At this point, you should have your OPC CLI environment variables namely OPC_API, OPC_USER, and a plain-text file storing your OPC account's password all setup already.  For the environment variables, I would highly recommend to store them in your .bash_profile file if you have not done so already.

In your local root or user account of your workstation, please do the followings:

 * Follow this [link](https://docs.oracle.com/cloud/latest/stcomputecs/STCSG/GUID-EE29085A-79B1-4A3A-BF25-A2A9516EC5F3.htm#OCSUG149) to generate an SSH key pair so you can use the private key to log in to your DataStax cluster instances using SSH.
 * Run "wget https<nolink>://github.com/DSPN/oracle-compute-cloud-dse/archive/master.zip"
 * Run "unzip master.zip" and a directory called "oracle-compute-cloud-dse-master" should be created.
<br>

###### 4. Update the clusterParameters.json file to reflect your environment settings
 * cd into ./oracle-compute-cloud-dse-master directory, and you should find a file called clusterParameters.json looks like the following.

 ```json
 {
   "locations": { 
    "us1": "https://api-z27.compute.us6.oraclecloud.com/",
    "us2": "https://api-z27.compute.us6.oraclecloud.com/"
  },
  "OPC_DOMAIN" : "/Compute-usoracle19809",
  "OPC_USER" : "/Compute-usoracle19809/gilbert.lau@datastax.com",
  "nodeCount" : 1,
  "vmType" : "oc4",
  "osImage": "/oracle/public/OL_6.7_3GB-1.3.0-20160411",
  "bootDriveSizeInBytes" : "10737418240",
  "appDataDriveSizeInBytes" : "42949672960",
  "networkPrefix" : "DSE_IP_",
  "sshKey": "dse_opc_key",
  "securityList": "DSE_Seclist",
  "securityRules": "DSE_Rules"
 }
 ```

 * In the clusterParameters.json template, you will need to do the followings:
 
 > * "us1" is a label to decribe your Oracle data center.  You can change it to any name best describes your data cener location.
 > * "https://api-z27.compute.us6.oraclecloud.com/" is the API endpoint of your specific OPC data center which is the same value of your OPC_API environment variable. Again, this [link](http://docs.oracle.com/cloud/latest/stcomputecs/STCSA/SendRequests.html) shows you how to find your API endpoint information.  Replace it with your own value.
 > * "locations" element is a list.  This means you can specify as many data centers as required for your deployment.
 > * OPC_DOMAIN is the Compute-identity_domain.
 > * OPC_USER is the same value of your OPC_USER environment variable.
 > * nodeCound is the number of Cassandra cluster nodes you want to deploy in each data center you specify above.
 > * vmType is the Oracle Public Cloud instance type.  For DataStax Enterprise, the minimum requirement is 2 CPU cores and 8 GB Memory.  Please refer to this [link](https://cloud.oracle.com/compute?tabname=PricingInfo) for different compute shapes.
 > * osImage is the OS image type supported by OPC.
 > * bootDriveSizeInBytes is the size of the boot volumne where you would store your operating system.  In OPC, this is defaulted to a HDD.
 > * appDataDriveSizeInBytes is the size of your low latency drive for storing your Cassandra database data.
 > * networkPrefix is the prefix you can define for your static IPs used by your OPC instances.
 > * sshKey is the label of your sshkey in your OPC environment.  You can give any name your want.
 > * securityList is name of your security list used for your DataStax Enterprise cluster deployment.  Our current release does not make use of it and we use OPC default security list instead.
 > * securityRules is the name of your security rules used for your DataStax Enterprise cluster deployment.   Our current release does not make use of it.
 <br>
 
###### 5. Run the deploy.sh script to deploy a DSE cluster in your OPC environment

 At this point, you can run the deploy.sh as "./deploy <public ssh-key's full filename> <full filename of the plain-text file storing your OPC password>".  In my own experience, it will take about 25 minutes to provision a cluster comprising four DataStax Enterprise nodes and one OpsCenter instance.

