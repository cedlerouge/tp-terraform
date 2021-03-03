#!/bin/bash

# tp_init 

echo "Preparing directories environment ..." 
if [ ! -d ~/bin ]; then 
  mkdir ~/bin
fi
export PATH=$PATH:~/bin

if [ ! -d ~/terraform/tp_init/ ]; then 
  mkdir -p ~/terraform/tp_init/
fi


sudo apt-get install \
	git \
	vim

echo "Downloading terraform binary ..."
if [ ! -e terraform_0.14.7_linux_amd64.zip ]; then  
  curl -O https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
fi
if [ ! -x ~/bin/terraform ]; then 
  unzip terraform_0.14.7_linux_amd64.zip -d ~/bin/
fi
rm -f terraform_0.14.7_linux_amd64.zip

terraform -v 

echo "Create a void template in tp_init directory "

touch ~/terraform/tp_init/void.tf 

pushd ~/terraform/tp_init/
terraform apply 
popd 

exit 0
