#!/bin/bash

echo "Executando PING em todos os hosts..."

echo "Carregando módulos comuns..."
current_file_dir=$(dirname $(realpath $0))
shell_modules_dir="$current_file_dir/shell_modules"
source $shell_modules_dir/common_calls.sh
echo "Módulos carregados com sucesso!"

echo "Calculando inventory path..."
ansible_dir=$(get_ansible_dir)
echo "ansible_dir: $ansible_dir"
inventory_path="$ansible_dir/inventory.yaml"
echo "inventory_path: $inventory_path"
echo "Inventory path calculado com sucesso!"
ansible -m ping all -i $inventory_path 
