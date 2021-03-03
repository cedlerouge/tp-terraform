#!/bin/bash

set -e 

if [ -e ./.os-openrc.sh ]; then 
  source ./.os-openrc.sh
fi 

terraform validate 

terraform apply 

exit 0
