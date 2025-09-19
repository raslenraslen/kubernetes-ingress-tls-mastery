# 🚀 Guide Complet : Déploiement et Sécurisation d'une Application sur Azure AKS (Nginx Ingress & Let's Encrypt)

Ce guide pas à pas détaille le processus complet pour déployer une application sur un cluster Azure Kubernetes Service (AKS), l'exposer publiquement via un Nginx Ingress Controller, et sécuriser l'accès avec un certificat TLS/SSL de production de Let's Encrypt.

---

### **Pré-requis Indispensables (Configuration Initiale)**

Pour une configuration complète de votre environnement, veuillez suivre les étapes et guides détaillés ci-dessous :

1.  **Installation et Connexion à Azure CLI :**
    *   Si Azure CLI n'est pas déjà installé sur votre machine :
        ```bash
        sudo apt update && sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg
        curl -sL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
        AZ_REPO=$(lsb_release -cs)
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
        sudo apt update
        sudo apt install -y azure-cli
        ```
    *   Connectez-vous à votre compte Azure :
        ```bash
        az login
        ```
    *   Vérifiez l'installation :
        ```bash
        az version
        ```

2.  **Cluster Azure AKS fonctionnel :**
    *   **Création :** Référez-vous à mes fichiers de configuration Terraform dans `~/tutenv/cluster-AKS-terraform/` (incluant `main.tf`, `outputs.tf`) pour le déploiement d'un cluster AKS vierge.
    *   **Connexion `kubectl` :** Assurez-vous que `kubectl` est configuré et connecté à votre cluster AKS (`kubectl config use-context <nom-de-votre-aks>`). Pour récupérer les identifiants :
        ```bash
        az aks get-credentials --resource-group <votre-resource-group-aks> --name <votre-nom-aks> --overwrite-existing
        ```

3.  **Nginx Ingress Controller et Nom de Domaine Public (Configuration Avancée) :**
    *   **Configuration Complète :** Référez-vous à mon guide dédié `~/tutenv/ingress/steps-dans-cloud-azure.md`. Ce guide couvre :
        *   L'installation du Nginx Ingress Controller sur AKS.
        *   L'obtention d'une IP publique Azure Load Balancer.
        *   La configuration de votre nom de domaine (ex: `rasleneboutique.duckdns.org`).
        *   L'ajustement des règles du Network Security Group (NSG) pour autoriser le trafic HTTP (port 80) et HTTPS (port 443).
    *   **Avant de poursuivre ce guide, assurez-vous que toutes ces étapes sont complétées et que votre application est accessible en HTTP via votre nom de domaine public.**

---


### **1. Installation de Cert-Manager sur AKS** 🔒

Maintenant que l'infrastructure réseau et l'exposition HTTP de votre application sont en place (selon le guide `steps-dans-cloud-azure.md`), nous allons installer Cert-Manager. Cet outil va automatiser l'obtention et la gestion des certificats TLS/SSL de production.

1.  **Création du Namespace `cert-manager` :**
    ```bash
    kubectl create namespace cert-manager
    ```

2.  **Installation des Custom Resource Definitions (CRDs) :**
    ```bash
    kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.crds.yaml
    ```
    > **Pourquoi ?** Les CRDs (`ClusterIssuer`, `Certificate` etc.) sont des types d'objets Kubernetes personnalisés introduits par Cert-Manager. Le cluster doit les connaître avant de pouvoir les utiliser.

3.  **Installation des composants principaux de Cert-Manager :**
    ```bash
    kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml
    ```

4.  **Vérification du Déploiement :**
    ```bash
    kubectl get pods -n cert-manager -w
    # Attendez que les pods "cert-manager-XXXXX", "cert-manager-cainjector-XXXXX", "cert-manager-webhook-XXXXX" soient "Running" et "READY 1/1".
    ```
    > **Validation :** À ce stade, Cert-Manager est entièrement opérationnel sur votre cluster.

---

