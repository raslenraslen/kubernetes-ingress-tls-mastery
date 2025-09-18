#  Partie 1 : Création et Utilisation d'un Certificat SSL/TLS Auto-Signé (pour le Test Local)

Étape 1 : Préparer un dossier de travail et définir les informations du certificat

Pour générer notre certificat, nous allons utiliser l'outil openssl.
Créer un dossier pour les certificats :
````
mkdir -p ~/tutenv/certs
cd ~/tutenv/certs`
````
Définir le nom de domaine (Hostname) pour le certificat :  
Ce doit être le nom de domaine que tu utilises dans ton fichier hosts et ton Ingress.  
````

export DOMAIN_NAME="bookinfo.kube.local"
# Remplace "bookinfo.kube.local" par le nom de domaine que tu as configuré dans ton Ingress et ton fichier hosts.
````