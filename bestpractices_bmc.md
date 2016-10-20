# Best Practices for deploying DataStax Enterprise to Oracle Bare Metal Cloud Service

## General

## Compute

### Recommended Machine Types

We recommend the following machine types for running DSE:

* Image: Oracle-Linux-7.2-2016.10.05-0
* Shape: BM.HighIO1.36

## Storage

* Mount NVMe storage by running these [commands](./mount_nvme_disks.sh)

We recommend standard storage for OS disks.  We recommend using the above NVMe storage as data disks for high performance throughout.

## Network

Currently, Oracle Bare Metal Cloud Service offers one region namely "us-phoenix-1".  It has three Availability Domains (AD).  

When setting up your own Virtual Cloud Network, we recommend creating a seperate subnet for each availability zone.  This way you can increase service availability if you spread your DSE nodes evenly over three availability domains.

When defining your security list, you will create necessary security rules to enable access and protect your Bare Metal Cloud Service instances and their workloads.

In future, to create a cross region deployment, each DSE data center will be deployed seperately.


