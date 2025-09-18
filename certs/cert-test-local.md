#  Partie 1 : Création et Utilisation d'un Certificat SSL/TLS Auto-Signé (pour le Test Local)

__Étape 1 : Préparer un dossier de travail et définir les informations du certificat__

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

__Étape 2 : Générer la Clé Privée et le Certificat Auto-Signé__


````
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout $DOMAIN_NAME.key -out $DOMAIN_NAME.crt -subj "/CN=$DOMAIN_NAME/O=MyTestOrg"
````

__Explication de la commande openssl :__

**req :** Indique que nous voulons gérer une "Certificate Request" (demande de certificat).  
**-x509 :** Crée un certificat auto-signé directement (pas besoin d'une CA externe pour le signer).  
**-sha256 :** Utilise l'algorithme de hachage SHA-256 pour la signature (sécurisé).  
**-nodes :** "No DES", ne chiffre pas la clé privée (plus simple pour le labo, pas de mot de passe à taper).  
**-days 365 :** Le certificat sera valide pendant 365 jours.  
**-newkey rsa:2048 :** Génère une nouvelle clé privée RSA de 2048 bits.  
**-keyout $DOMAIN_NAME.key :** Sauvegarde la clé privée générée dans un fichier nommé bookinfo.kube.local.key (en utilisant ta variable DOMAIN_NAME).  
**-out $DOMAIN_NAME.crt :** Sauvegarde le certificat généré dans un fichier nommé bookinfo.kube.local.crt.  
**-subj "/CN=$DOMAIN_NAME/O=MyTestOrg" :** Définit le "Subject" du certificat.  
**CN (Common Name) :** C'est le nom de domaine principal pour lequel le certificat est délivré. C'est crucial qu'il corresponde à bookinfo.kube.local.  
**O (Organization) :** Le nom de l'organisation (ici, "MyTestOrg" pour l'exemple).  