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

#Ansible
echo "installation de ansible"
apt -y install ansible
echo "installation de ansible terminer"

#PM2 
echo "installation de PM2"
apt -y install pm2
echo "installation de PM2 terminer"

#Clée ssh

# Vérifie si le répertoire .ssh existe, sinon le crée
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    # Copie le fichier .ssh vers le serveur Vagrant
    echo "Copie du fichier .ssh vers le serveur Vagrant"
    scp -i /chemin/vers/la/cle/privee -r ~/.ssh vagrant@adresse_ip:/home/vagrant

    # Définit les permissions appropriées pour le fichier .ssh
    echo "Définition des permissions appropriées pour le fichier .ssh"
    ssh -i /chemin/vers/la/cle/privee vagrant@adresse_ip "chmod 700 ~/.ssh && chmod 600 ~/.ssh/*"
fi

# Ajoute la clé privée SSH
echo "Ajout de la clé privée SSH"
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# Ajoute la clé publique SSH
echo "Ajout de la clé publique SSH"
echo "$SSH_PUBLIC_KEY" > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa.pub

# Ajoute l'adresse de GitHub à known_hosts
echo "Ajout de l'adresse de GitHub à known_hosts"
ssh-keyscan github.com >> ~/.ssh/known_hosts

# Teste la connexion à GitHub
echo "Test de la connexion à GitHub"
ssh -T git@github.com

# Exécute la commande git clone
echo "Clonage du dépôt GitHub"
git clone git@github.com:nom_utilisateur/nom_du_depot.git

echo "installation de git"
apt -y install git 
echo "installation de git terminer"

echo "clonage du projet github"
git clone git@github.com:Vandal-William/Attitude-v2.git
echo "Projet cloner"
