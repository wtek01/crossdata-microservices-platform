# Étape 1 : Construction de l'application
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

ARG SERVICE_NAME

# Copier tous les fichiers du projet
COPY . .

# Afficher la structure du répertoire pour le débogage
RUN ls -R

# Construire le module spécifique
RUN mvn clean package -pl ${SERVICE_NAME} -am -DskipTests

# Étape 2 : Création de l'image finale
FROM openjdk:17-slim
RUN apt-get update && apt-get install -y curl bash && rm -rf /var/lib/apt/lists/*
WORKDIR /app

ARG SERVICE_NAME

# Créer un utilisateur non-root
RUN groupadd -r spring && useradd -r -g spring spring

# Copier le JAR construit depuis l'étape de build
COPY --from=build /app/${SERVICE_NAME}/target/${SERVICE_NAME}-1.0-SNAPSHOT.jar app.jar

# Copier le script wait-for-it.sh
COPY wait-for-it.sh .

# Rendre le script exécutable et définir les bonnes permissions
RUN chmod +x wait-for-it.sh && \
    chown spring:spring app.jar wait-for-it.sh

# Passer à l'utilisateur non-root
USER spring

# Définir le point d'entrée en utilisant wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh", "eureka-server:8761", "--", "java", "-jar", "app.jar"]