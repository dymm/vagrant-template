# Acces au dépot d'image Docker via une machine virtuelle

# Description

La construction et le téléversement des images docker peut être fait via une VM Linux. Afin de rendre le processus d'installation et de configuration de la VM simple et rapide il faut installer les éléments suivants :
+ VirtualBox : https://www.virtualbox.org/wiki/Downloads
+ Vagrant : https://www.vagrantup.com/downloads.html

VirtualBox est un logiciel libre de virtualisation. Vagrant est un logiciel libre permettant la création et les configuraitons des environnements virtuels. 

# Utilisation

## Lancement

C'est lors du premier lancement que la machine viruelle sera téléchargée, créee, mise à jour et configurée. Les logiciels seront installés automatiquement. Cette étape peut prendre plusieurs minutes en fonction de la vitesse du réseau et de la machine.
Afin de lancer l'environnement executer la commande "vm_start.bat".

## Connexion

La connexion à l'environement ce fait via PuTTY. Afin de permettre un fonctionnement correcte il faut s'assurer que le PATH contienne le répertoire où l'executable PuTTY se situe.
Pour ce connecter à l'environement executer la commande "vm_login.bat".

## Arret de la VM

vagrant halt


# Détail technique

## Generer le PPK a partir du PEM

### Sous Windows

Avec WinSCP :

set PATH=%PATH%;"C:\Program Files (x86)\WinSCP"

winscp /keygen .vagrant\machines\default\virtualbox\private_key /output=.vagrant\machines\default\virtualbox\private_key.ppk

### Sous Linux

Avec puttygen (apt-get install -y putty-tools) :

puttygen /vagrant/.vagrant/machines/default/virtualbox/private_key -O private -o /vagrant/.vagrant/machines/default/virtualbox/private_key.ppk

## Lancer putty avec une cle ssh donnée en arguement

PuTTY -P 2222 -i ".vagrant\machines\default\virtualbox\private_key.ppk" vagrant@127.0.0.1

## Installation de Docker, a faire lors de la premiere installation de la VM

curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
logout


