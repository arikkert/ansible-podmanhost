playbook documentation
======================

N.B. This version defines the container storage location from /var/lib/containers to /container-data/var/lib/containers without
moving the existing container storage. So I expect it to break the podman host when there are existing containers using the old location.

Installs and configures podman on target host with CentOS/Almalinux >= 8.
It will configure the target host as podman host (controlling pods and containers) and reserves a separate partition for the pod/container data

Tested on CentOS 8 and Almalinux 9

Info
----

This implementation uses a Makefile as installation wrapper.  
Just type *make* in the directory where the Makefile is located, to install all dependencies and run the playbook.  
The makefile calls tools like *yamllint* and *ansible-lint*.  
These tools are only called when found in the search path, so no problem if they are not installed.  
It will add and configure a user *podman* that has elevated root privileges.  

Requirements
------------

Deploy host has *make*, *ansible* and *ansible-galaxy* installed.  
Target host has CentOS >= 8 installed.  
Requires root access to target host.  
Target host has an extra disk */dev/sdb* of at least 40 GB in size for future pod/container data.  

Variables
--------------

Dependencies
------------

License
-------

BSD

Author Information
------------------

    ARK-ICT
    Andre Rikkert de Koe - ICT
