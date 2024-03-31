#!/bin/bash

function get_root_dir {
  origin_dir=$(pwd)
  # Suba um nível de diretório até encontrar o arquivo ".__shell__root__reference__file__" ou chegar no diretório raiz "/"
  while [ ! -e ".__shell__root__reference__file__" -a $(pwd) != "/" ]; do
    cd ..
  done
  root_dir=$(pwd)
  cd $origin_dir
  if [ $root_dir == "/" -a ! -e ".__shell__root__reference__file__" ]; then
    exit 1
  fi
  echo $root_dir
}

function get_kubernetes_dir {
  root_dir=$(get_root_dir)
  kubernetes_dir="$root_dir/kubernetes"
  echo $kubernetes_dir
}

function get_nodes_dir {
  root_dir=$(get_root_dir)
  nodes_dir="$root_dir/kubernetes/nodes"
  echo $nodes_dir
}

function get_ansible_dir {
  root_dir=$(get_root_dir)
  ansible_dir="$root_dir/kubernetes/nodes/ansible"
  echo $ansible_dir
}

function get_shell_modules_dir {
  root_dir=$(get_root_dir)
  shell_modules_dir="$root_dir/kubernetes/nodes/ansible/shell_modules"
  echo $shell_modules_dir
}

function get_inventory_path {
  inventory_path=""
  inventory_dir=$(get_ansible_dir)
  if [ -e "$inventory_dir/inventory.ini" ]; then
    inventory_path="$inventory_dir/inventory.ini"
  else
    inventory_path="$inventory_dir/inventory.yaml"
  fi
  echo $inventory_path
}
