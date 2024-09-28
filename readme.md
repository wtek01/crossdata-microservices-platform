# CrossData Microservices Platform

## Description

Cette plateforme est composée de plusieurs microservices orchestrés avec Docker Compose, utilisant Spring Boot, Eureka, Config Server, et Spring Cloud Gateway. Elle inclut également des outils de monitoring tels que Prometheus et Grafana.

## Architecture

- **Eureka Server** : Service de découverte des microservices.
- **Config Server** : Gestion centralisée des configurations via Git.
- **Admin Server** : Surveillance et gestion des microservices via Spring Boot Admin.
- **API Gateway** : Point d'entrée unique pour les requêtes externes.
- **Product Service** : Service de gestion des produits.
- **Order Service** : Service de gestion des commandes.
- **Dashboard Service** : Service de tableau de bord.
- **Prometheus** : Collecte des métriques.
- **Grafana** : Visualisation des métriques.

## Prérequis

- Docker et Docker Compose installés.
- Maven installé pour construire les microservices.

## Installation

1. **Cloner le dépôt**

   ```bash
   git clone https://github.com/votre-repo/crossdata-microservices-platform.git
   cd crossdata-microservices-platform

# Accès aux services
     - Eureka Server : http://localhost:8761.
     - Config Server : http://localhost:8888.
     - Admin Server : http://localhost:8085
     - API Gateway : http://localhost:8090
     - Product Service : http://localhost:8081
     - Order Service : http://localhost:8082
     - Dashboard Service : http://localhost:8083
     - Prometheus : http://localhost:9090
     - Grafana : http://localhost:3000
# Monitoring
     - Prometheus collecte les métriques des microservices.
     - Grafana visualise les métriques collectées par Prometheus.

# DOCKER 
Certainement. Voici la liste des commandes avec une brève explication pour chacune :

   - <b>docker-compose down</b> : Arrête et supprime tous les conteneurs, réseaux et volumes définis dans le docker-compose.yml.
   - docker image prune : Supprime toutes les images non utilisées et non taguées pour libérer de l'espace disque.
   - docker image prune -a : Supprime toutes les images non utilisées, y compris celles qui sont taguées.
   - mvn clean install : Nettoie le projet Maven, compile le code, exécute les tests et installe les artefacts dans le référentiel local.
   - docker-compose build : Reconstruit toutes les images des services définis dans le docker-compose.yml.
   - docker-compose up -d : Démarre tous les services définis dans le docker-compose.yml en mode détaché (arrière-plan).
   - docker-compose ps : Affiche l'état actuel de tous les services définis dans le docker-compose.yml.
   - docker-compose logs -f : Affiche les logs en temps réel de tous les services.
   - docker-compose logs -f dashboard-service : Affiche les logs en temps réel spécifiquement pour le service dashboard.

# Redémarrage d'un Service Spécifique après Modification du Code
```bash
docker-compose build dashboard-service : Reconstruire l''image du service
docker-compose stop dashboard-service : Arrêter le service existant
docker-compose up -d dashboard-service : Démarrer le service avec la nouvelle image
docker-compose up -d --build dashboard-service : Alternative : Reconstruire et redémarrer en une seule commande
docker-compose ps dashboard-service  : Vérifier l''état du service
docker-compose logs -f dashboard-service : Consulter les logs du service redémarré
```
Ces commandes vous permettent de gérer efficacement votre environnement Docker, de la suppression des anciens conteneurs à la reconstruction et au démarrage de nouveaux services, tout en surveillant leur état et leurs logs.

# TODO 
 - Docker 
 - React