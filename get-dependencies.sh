#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/geerlingguy.java ] && git clone https://github.com/geerlingguy/ansible-role-java.git $rolesdir/geerlingguy.java
[ ! -d $rolesdir/geerlingguy.elasticsearch ] && git clone https://github.com/geerlingguy/ansible-role-elasticsearch.git $rolesdir/geerlingguy.elasticsearch
[ ! -d $rolesdir/geerlingguy.postgresql ] && git clone https://github.com/geerlingguy/ansible-role-postgresql.git $rolesdir/geerlingguy.postgresql
[ ! -d $rolesdir/juju4.gift ] && git clone https://github.com/juju4/ansible-role-gift.git $rolesdir/juju4.gift

