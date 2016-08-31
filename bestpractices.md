# Best Practices

## General

## Compute

OPC instances are based on Oracle CPU (OCPU).  Each OCPU is a physical core that is hyperthreaded.  So, one OCPU gives you two virtual cores.

### Recommended Machine Types

We recommend the following machine types for development:
* 1 OCPU

We recommend the following machine types for production:
* 4 OCPU
* 8 OCPU
* 16 OCPU

## Storage

Oracle Public Cloud has two storage options:
* standard storage
* high performance storage

We recommend standard storage for OS disks.  We recommend separate data disks that use high performance storage.

## Network

Currently OPC does not offer availability zones.  Multiple regions are supported.

To create a cross region deployment, each Cassandra data center must be deployed seperately.
