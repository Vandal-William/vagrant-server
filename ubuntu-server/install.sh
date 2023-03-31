#!/bin/sh
apt-get update 

#NVM
echo "intallation de NVM"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#node js
echo "Installation de node"
nvm install --lts
node -v
npm -v

#Git
echo "installation de git"
apt-get install -y git 
git --version

#PM2
npm install -g pm2
pm2 --version

# #Ansible
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
ansible --version

#Clée ssh

# Générer une paire de clés SSH
ssh-keygen -t rsa -b 4096 -C "vagrant@localhost" -f /home/vagrant/.ssh -N ""

# Chemin d'acces aux variables de connexion
source connexion.env

# Ajouter la clé publique à votre compte GitHub
curl -H "Expect:" -u "$USER_NAME:$PASS_WORD" --data "{\"title\":\"Vagrant SSH Key\",\"key\":\"$(cat ~/.ssh/id_rsa.pub)\"}" https://api.github.com/user/keys


ssh-keyscan github.com >> ~/.ssh/known_hosts

echo "clonage du projet github"
git clone git@github.com:Vandal-William/Attitude-v2.git
echo "Projet cloner"
