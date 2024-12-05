#!/bin/bash

echo " "
echo "     ------- INICIO -------     "
echo " "

echo "Etapa 1/4 -> Criando diretorios"
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Etapa 2/4 -> Criando grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Etapa 3/4 -> Criando usuarios"
useradd carlos -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_ADM

useradd roberto -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_VEN
useradd debora -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -1 123) -G GRP_SEC

echo "Etapa 4/4 -> Configurando permissoes dos diretorios"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chown root:root /publico

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo " "
echo "     ------- FIM -------     "

echo " "
echo "------- Configurações atuais -------"
echo "Usuários:"
cat /etc/passwd | grep -E "carlos|maria|joao|roberto|sebastiana|debora|josefina|amanda|rogerio"
echo " "
echo "Grupos:"
ls -l / | grep -E "adm|ven|sec|publico"
echo " "
echo "Diretórios"
cat /etc/group | grep -E "GRP_ADM|GRP_VEN|GRP_SEC"

echo " "
