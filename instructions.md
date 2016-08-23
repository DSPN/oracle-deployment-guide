## Instructions

This document describes the necessary steps to deploy a DataStax Enterprise (DSE) cluster in an Oracle Public Cloud (OPC) environment.  Below is the high level sequence of steps you will need to follow in order to successfully deploy your DSE cluster.

1. Obtain your Oracle Public Cloud (OPC) account
2. Set up your workstation with Oracle Compute Cloud Service Command Line Tool
3. Install our assets on your workstation to provision DSE cluster in OPC
4. Update the clusterParameters.json to reflect your own settings
5. Run the deploy.sh to deploy a DSE cluster in your OPC environment



#### 1. Obtain your Oracle Public Cloud account
        If you do not have an account with OPC, please follow this [link](https://myaccount.cloud.oracle.com/mycloud/faces/trialsignup.jspx?serviceType=IAASMB) to apply for one.

#### 2. Set up your workstation with OPC Command Line Tools
        With regards to where you want your workstation to be, you have two options.  The first option is to create a local 
        Oracle Enterprise Linux 6.7 virtual machine on your destktop.  The second option is to create an OEL 6.7 instance 
        in your OPC account.  
        
        Once you got this virtual machine or OPC instnace up and running, you can follow this [link](http://docs.oracle.com/cloud/latest/stcomputecs/STCLR/GUID-62B0B2BD-A95F-4F82-B144-8C1DBA8760E9.htm#STCLR-GUID-62B0B2BD-A95F-4F82-B144-8C1DBA8760E9) 
        to set up your Oracle Compute Cloud Service CLI and the required environment variables and files
        
        *
        *


