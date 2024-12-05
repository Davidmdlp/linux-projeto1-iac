#!/bin/bash

# Função para verificar se o diretório existe antes de deletar
delete_directory_if_exists() {
    dir=$1
    if [ -d "$dir" ]; then
        rmdir "$dir"
    else
        echo "Diretório $dir não existe."
    fi
}

# Função para verificar se o grupo existe antes de deletar
delete_group_if_exists() {
    group=$1
    if getent group "$group" > /dev/null 2>&1; then
        groupdel "$group"
    else
        echo "Grupo $group não existe."
    fi
}

# Função para verificar se o usuário existe antes de deletar
delete_user_if_exists() {
    user=$1
    if id "$user" &>/dev/null; then
        userdel "$user" -r -f
    else
        echo "Usuário $user não existe."
    fi
}

echo "Deletando diretórios"
delete_directory_if_exists /publico
delete_directory_if_exists /adm
delete_directory_if_exists /ven
delete_directory_if_exists /sec

echo "Deletando grupos"
delete_group_if_exists GRP_ADM
delete_group_if_exists GRP_VEN
delete_group_if_exists GRP_SEC

echo "Deletando usuários"
delete_user_if_exists carlos
delete_user_if_exists maria
delete_user_if_exists joao

delete_user_if_exists roberto
delete_user_if_exists sebastiana
delete_user_if_exists debora

delete_user_if_exists josefina
delete_user_if_exists amanda
delete_user_if_exists rogerio
