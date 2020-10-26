#Chaque instruction crée une couche :
#FROM crée un calque à partir de l'image du Docker debian:buster
#COPY ajoute les fichiers du répertoire courant de votre client Docker.
#RUN construit votre application avec make.
#CMD spécifie la commande à exécuter dans le conteneur.
#MAINTAINER L'instruction MAINTAINER définit le champ Auteur des images générées.
#EXPOSE L'instruction EXPOSE indique les ports sur lesquels un conteneur est à l'écoute des correspondances.
FROM debian:buster
MAINTAINER <rayane.qouch@gmail.com>
#faire des mises a jour
RUN apt-get -y update && apt-get -y upgrade
# Wget est un programme en ligne de commande non interactif de téléchargement de fichiers depuis le Web.
RUN apt-get install wget -y
#nginx est un logiciel libre de serveur Web
RUN apt-get -y install nginx
#MariaDB est un système de gestion de base de données,fork de MySQL
RUN apt-get -y install mariadb-server
# langage de scripts généraliste
RUN apt-get -y install php7.3-fpm php7.3-mysql
# copy tous dans le contenu du dossier srcs dans le dossier srcs_docker
COPY ./srcs/* srcs_docker/
# on se donne les droits
RUN chmod +x /srcs_docker/docker.sh
#on lance la commande
CMD bash /srcs_docker/docker.sh
#ecrit sur le port 80
EXPOSE 80 443


