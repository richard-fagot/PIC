# Plateforme d'intégration continue
Ce projet permet de créer une plateforme d'intégration continue (PIC) contenue dans une image Docker.

# Plugins pour jenkins
Le jenkins de la PIC est fourni avec un ensemble de plugins nécessaires à l'organistion.

Les plugins sont listés dans le fichier *plugins.txt* et installés grâce au script */usr/local/bin/plugins.sh* fourni avec l'image *Docker* de *Jenkins*.

Le script n'étant pas transitif il faut [lister l'ensemble des dépendances](http://stackoverflow.com/questions/35442590/installing-jenkins-plugin-mercurial-in-docker-shows-in-plugins-folder-but-not) de chaque plugin pour que leur installation soit effective.

## Maven Integration Plugin
[Ce plugin](https://wiki.jenkins-ci.org/display/JENKINS/Maven+Project+Plugin) permet de créer des jobs de type projet *maven*.


# Configuration de Jenkins
Pour configurer Maven, JDK, etc. il faut, depuis la version 2.x de *jenkins* aller dans [Global Tools](http://stackoverflow.com/questions/37391778/maven-installation-settings-not-showing-in-jenkins)

# Autoriser l'accès au port 4243 de docker
https://www.digitalocean.com/community/tutorials/how-to-dockerise-and-deploy-multiple-wordpress-applications-on-ubuntu

# Créer un esclave
1. Créer un droplet sur *DigitalOcean* en précisant la clé ssh à utiliser (qui sera la clé du root);
1. Se connecter à la droplet avec le root
    ssh root@IP_DROPLET
1. Si la clé ssh est
