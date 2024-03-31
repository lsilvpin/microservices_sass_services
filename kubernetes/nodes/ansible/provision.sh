#!/bin/bash

echo "Executando provisionamento com Ansible..."
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

echo "Calculando playbook path..."
playbook_path="$ansible_dir/playbook.yaml"
echo "playbook_path: $playbook_path"
echo "Playbook path calculado com sucesso!"

echo "Executando playbook..."
ansible-playbook -i $inventory_path $playbook_path $1
echo "Playbook executado com sucesso!"
