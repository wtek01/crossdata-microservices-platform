@echo off

set EUREKA_SERVER_PORT=8761
set ADMIN_SERVER_PORT=8085
set API_GATEWAY_PORT=8090
set PRODUCT_SERVICE_PORT=8081
set ORDER_SERVICE_PORT=8082
set DASHBOARD_SERVICE_PORT=8083

if "%1"=="start" goto start
if "%1"=="stop" goto stop
if "%1"=="restart" goto restart

echo Usage: %0 {start^|stop^|restart}
goto end

:start
echo Demarrage des services...
start "Eureka Server" java -jar eureka-server/target/eureka-server-0.0.1-SNAPSHOT.jar
timeout /t 10
start "Admin Server" java -jar admin-server/target/admin-server-0.0.1-SNAPSHOT.jar
timeout /t 5
start "API Gateway" java -jar api-gateway/target/api-gateway-0.0.1-SNAPSHOT.jar
start "Product Service" java -jar product-service/target/product-service-0.0.1-SNAPSHOT.jar
start "Order Service" java -jar order-service/target/order-service-0.0.1-SNAPSHOT.jar
start "Dashboard Service" java -jar dashboard-service/target/dashboard-service-0.0.1-SNAPSHOT.jar
echo Tous les services ont ete demarres.
goto end

:stop
echo Arret des services...
for /f "tokens=5" %%a in ('netstat -ano ^| find ":%EUREKA_SERVER_PORT%"') do taskkill /F /PID %%a
for /f "tokens=5" %%a in ('netstat -aon ^| find ":%ADMIN_SERVER_PORT%"') do taskkill /F /PID %%a
for /f "tokens=5" %%a in ('netstat -aon ^| find ":%API_GATEWAY_PORT%"') do taskkill /F /PID %%a
for /f "tokens=5" %%a in ('netstat -aon ^| find ":%PRODUCT_SERVICE_PORT%"') do taskkill /F /PID %%a
for /f "tokens=5" %%a in ('netstat -aon ^| find ":%ORDER_SERVICE_PORT%"') do taskkill /F /PID %%a
for /f "tokens=5" %%a in ('netstat -aon ^| find ":%DASHBOARD_SERVICE_PORT%"') do taskkill /F /PID %%a
echo Tous les services ont ete arretes.
goto end

:restart
call :stop
timeout /t 5
call :start
goto end

:end