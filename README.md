# Plateforme d'intégration continue
Ce projet permet de créer une plateforme d'intégration continue (PIC) contenue dans une image Docker.

# Plugins pour jenkins
Le jenkins de la PIC est fourni avec un ensemble de plugins nécessaires à l'organistion.

Les plugins sont listés dans le fichier *plugins.txt* et installés grâce au script */usr/local/bin/plugins.sh* fourni avec l'image *Docker* de *Jenkins*.

Le script n'étant pas transitif il faut [lister l'ensemble des dépendances](http://stackoverflow.com/questions/35442590/installing-jenkins-plugin-mercurial-in-docker-shows-in-plugins-folder-but-not) de chaque plugin pour que leur installation soit effective.

## Maven Integration Plugin
[Ce plugin](https://wiki.jenkins-ci.org/display/JENKINS/Maven+Project+Plugin) permet de créer des jobs de type projet *maven*.
