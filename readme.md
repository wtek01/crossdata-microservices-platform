# Ordre de Démarrage des Services et ports
config-server : 8888
eureka-server : 8761
admin-server : 8085
api-gateway : 8090
product-service : 8081
order-service : 8082
dashboard-service : 8083

# TODO 
 - Docker 
 - React

# GIT CONFIG SERVER
The error message indicates that there's an issue with the configuration 
of your Config Server. Specifically, it's saying that you need to 
configure a URI for the Git repository if you're using the git 
profile. Let's address this issue:

First, we need to determine if you intend to use Git as a 
backend for your configuration files or if you want to use 
the local filesystem (which you indicated earlier with the native profile).
If you want to use the local filesystem, we need to ensure that the
native profile is active and that the correct search locations are specified.