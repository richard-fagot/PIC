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
1. Créer un droplet sur *DigitalOcean* en précisant la clé ssh à utiliser (qui sera la clé du root) :

```bash
    curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer **LICENCE_KEY**"
     -d '{"name":"jenkins-slave", "region":"fra1", "size":"512mb", "image":"ubuntu-16-04-x64"
     ,"ssh_keys":["**SSH_FINGERPRINT**"], "backups":false, "ipv6":false,
     "user_data":null, "private_networking":null, "volumes": null}' "https://api.digitalocean.com/v2/droplets"   
```

1. **SI** la clé SSH a un nom différent de *id_rsa* utiliser la commande suivante pour se connecter en _root_ sur le droplet :

 ```bash
    ssh -i NOM_CLE_SSH root@IP_DROPLET
```

1. **SINON** Se connecter à la droplet avec _root_ simplement :

 ```bash
    ssh root@IP_DROPLET
```

1. Créer un utilisateur *jenkins-slave* :

      $ adduser jenkins-slave

1. Se loguer avec l'utilisateur *jenkins-slave*
1. Créer un répertoire */home/jenkins-slave/jenkins_slave_home*
1. Créer un couple clé privée/clé publique
1. Ajouter la clé privée dans les *authorized_keys* de l'esclave
1. Créer les crédentials pour jenkins-slave
1. Dans le *jenkins* maître :
   2. **Administrer jenkins > Gérer les noeuds > Créer un noeud**,
   2. Nommer le noeud *jenkins_slave*,
   2. Sélectionner **Permanent agent** puis **OK**,
   2. **Nombre d'exécuteurs** : 1,
   2. **Répertoire de travail du système distant** : */home/jenkins-slave/jenkins_slave_home*,
   2. **Méthode de lancement** : *Launch slave agents on Unix machines via SSH*,
   2. **host** : IP_DROPLET,
   2. **Crédentials** : *jenkins-slave*,
   2. **Enregistrer** ;
