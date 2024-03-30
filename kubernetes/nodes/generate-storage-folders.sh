#!/bin/bash

echo "Generating storage folders for each node"
vm_names="control-plane worker-fred worker-neves worker-neon"
echo "VM names: $vm_names"
echo ""

for vm_name in $vm_names; do

  echo "Creating storage folder for $vm_name"
  dirName="node_storage_$vm_name"
  echo "Directory name: $dirName"

  if [ ! -d $dirName ]; then
    mkdir $dirName
    echo "Created $dirName"
  else
    echo "$dirName already exists"
  fi

done

