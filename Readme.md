# 🌟 Mon Parcours de Maîtrise Kubernetes : Exposition d'Applications & Sécurité TLS 🔒

Ce document récapitule les différentes étapes et guides que j'ai réalisés pour maîtriser l'exposition d'applications sur Kubernetes, de l'environnement de développement local à la production sur Azure AKS, en intégrant les aspects cruciaux de la gestion du trafic et de la sécurité TLS/SSL.

---

## **Table des Matières et Guides Détaillés**

Cliquez sur les liens ci-dessous pour accéder aux guides pas à pas de chaque étape :

### **Phase 1 : Exposition Locale avec Nginx Ingress Controller** 💻

Cette phase se concentre sur l'exposition d'applications sur un cluster Kubernetes local (Kubeadm, Minikube, Kind).

1.  **Exposition via NodePort (HTTP) : Le B.A.B.A de l'Ingress Local**
    *   Apprenez à installer Nginx Ingress Controller et à exposer une application en HTTP en utilisant un `NodePort` sur un cluster local.
    *   **[Accéder au guide détaillé de l'Ingress Local (NodePort HTTP)](./ingress/ingress-local.md)** ⬅️ 

2.  **Exposition via MetalLB (HTTP) : Simuler un LoadBalancer Local**
    *   Découvrez comment utiliser MetalLB pour obtenir une `EXTERNAL-IP` de type `LoadBalancer` sur un cluster bare-metal local, offrant une URL plus propre que le `NodePort`.
    *   **[Accéder au guide détaillé de l'Ingress Local avec MetalLB (HTTP)](./ingress/steps-avec-metallb.md)** ⬅️ 


2.  **Nginx Ingress Controller, DNS Public  (Pré-configuration HTTP)**
    *   Apprenez à installer Nginx Ingress Controller sur AKS, à configurer un nom de domaine public (ex: DuckDNS) 
    *   **[Accéder au guide détaillé de l'Ingress Cloud (HTTP)](./ingress/steps-dans-le-cloud-azure.md)** 




---

### **Phase 2 : Sécurisation Locale (Certificat Auto-Signé)** 🛡️

Cette phase explore la mise en place du HTTPS avec des certificats auto-signés pour les environnements de développement.

1.  **Certificat Auto-Signé avec Nginx Ingress (HTTPS avec avertissement)**
    *   Comprenez le fonctionnement des certificats SSL/TLS en générant un certificat auto-signé et en l'appliquant à votre Ingress local pour activer le HTTPS.
    *   **[Accéder au guide détaillé du Certificat Auto-Signé Local](./certs/cert-autosigned-local.md)** ⬅️ 

---

### **Phase 3 : Déploiement & Sécurisation en Production sur Azure AKS** ☁️

Cette phase représente l'objectif final : déployer une application sur le cloud et la sécuriser avec un certificat TLS/SSL de production de Let's Encrypt.

1.  **Déploiement du Cluster AKS avec Terraform**
    *   Guide de la création d'un cluster Azure Kubernetes Service (AKS) en utilisant Terraform.
    *   **[Accéder aux fichiers de configuration Terraform](./cluster-AKS-terraform/)** ⬅️ 

2.  **Nginx Ingress Controller, DNS Public & NSG Azure (Pré-configuration HTTP)**
    *   Apprenez à installer Nginx Ingress Controller sur AKS, à configurer un nom de domaine public (ex: DuckDNS) et les règles de Network Security Group (NSG) pour l'accès HTTP.
    *   **[Accéder au guide détaillé de l'Ingress Cloud (HTTP)](./ingress/steps-dans-cloud-azure.md)**

3.  **Certificats Let's Encrypt avec Cert-Manager (HTTPS Cadenas Vert)**
    *   La culmination : installez Cert-Manager sur AKS, configurez-le avec Let's Encrypt et obtenez un certificat TLS/SSL de production, garantissant un cadenas vert dans votre navigateur.
    *   **[Accéder au guide détaillé des Certificats de Production (Let's Encrypt sur AKS)](./cert-prod-aks.md)** ⬅️ 

---