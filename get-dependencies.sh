#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/geerlingguy.java ] && git clone https://github.com/geerlingguy/ansible-role-java.git $rolesdir/geerlingguy.java
#[ ! -d $rolesdir/geerlingguy.elasticsearch ] && git clone https://github.com/geerlingguy/ansible-role-elasticsearch.git $rolesdir/geerlingguy.elasticsearch
[ ! -d $rolesdir/geerlingguy.elasticsearch ] && git clone https://github.com/juju4/ansible-role-elasticsearch.git $rolesdir/geerlingguy.elasticsearch
[ ! -d $rolesdir/geerlingguy.postgresql ] && git clone https://github.com/juju4/ansible-role-postgresql.git $rolesdir/geerlingguy.postgresql
[ ! -d $rolesdir/juju4.gift ] && git clone https://github.com/juju4/ansible-gift.git $rolesdir/juju4.gift
[ ! -d $rolesdir/geerlingguy.redis ] && git clone https://github.com/geerlingguy/ansible-role-redis.git $rolesdir/geerlingguy.redis
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.timesketch ] && ln -s ansible-timesketch $rolesdir/juju4.timesketch
[ ! -e $rolesdir/juju4.timesketch ] && cp -R $rolesdir/ansible-timesketch $rolesdir/juju4.timesketch

## don't stop build on this script return code
true

