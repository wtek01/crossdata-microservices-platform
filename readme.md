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

# TODO 
 - Docker 
 - React