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
        
Once you got this virtual machine or OPC instnace up and running, you can follow this [link](http://www.datastax.com) 
to set up your Oracle Compute Cloud Service CLI and the required environment variables and files.
<br>
        
###### 3. Install DSPN assets on your workstation to provision DSE cluster in OPC
At this point, you should have your OPC CLI environment variables namely OPC_API, OPC_USER, and a plain-text file storing your OPC account's password all setup already.  For the environment variables, I would highly recommend to store them in your .bash_profile file if you have not done so already.

In your local root or user account of your workstation, please do the followings:
> * Follow this [link](https://docs.oracle.com/cloud/latest/stcomputecs/STCSG/GUID-EE29085A-79B1-4A3A-BF25-A2A9516EC5F3.htm#OCSUG149) to generate an SSH key pair so you can use the private key to log in to your DataStax cluster instances using SSH.
> * Run "wget https<nolink>://github.com/DSPN/oracle-compute-cloud-dse/archive/master.zip"
> * Run "unzip master.zip" and a directory called "oracle-compute-cloud-dse-master" should be created.

###### 4. Update the clusterParameters.json file to reflect your environment settings
> * cd into ./oracle-compute-cloud-dse-master directory, and you should find a file called clusterParameters.json

```json
{
  "locations": {
    "us1": "https://api-z27.compute.us6.oraclecloud.com/",
    "us2": "https://api-z27.compute.us6.oraclecloud.com/"
  },
  "OPC_DOMAIN" : "/Compute-usoracle19809",
  "OCP_USER" : "/Compute-usoracle19809/gilbert.lau@datastax.com",
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

> * 

> *

