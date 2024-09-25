# Étape 1 : Construction de l'application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copier tous les fichiers du projet
COPY . .

# Construire uniquement le module api-gateway et ses dépendances
RUN mvn clean package -pl api-gateway -am -DskipTests

# Étape 2 : Création de l'image finale
FROM openjdk:17-slim
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
WORKDIR /app

# Copier le JAR construit depuis l'étape de build
COPY --from=build /app/api-gateway/target/api-gateway-1.0-SNAPSHOT.jar app.jar

# Copier le script wait-for-it.sh depuis la racine du contexte de build
COPY wait-for-it.sh .

# Rendre le script exécutable
RUN chmod +x wait-for-it.sh

# Définir le point d'entrée en utilisant wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh", "eureka-server:8761", "--", "java", "-jar", "app.jar"]
