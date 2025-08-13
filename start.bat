@echo off
REM Script de démarrage OpenRefine pour Windows

echo 🚀 Démarrage d'OpenRefine avec Docker...

REM Vérifier si Docker est installé
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker n'est pas installé. Veuillez l'installer avant de continuer.
    pause
    exit /b 1
)

REM Vérifier si Docker Compose est installé
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose n'est pas installé. Veuillez l'installer avant de continuer.
    pause
    exit /b 1
)

REM Démarrer les services
echo 📦 Démarrage des conteneurs...
docker-compose up -d

REM Vérifier le statut
echo 🔍 Vérification du statut...
timeout /t 5 /nobreak >nul
docker-compose ps

echo.
echo ✅ OpenRefine est maintenant accessible à l'adresse :
echo 🌐 http://localhost:8888
echo.
echo 📋 Commandes utiles :
echo    • Arrêter : docker-compose down
echo    • Redémarrer : docker-compose restart
echo    • Voir les logs : docker-compose logs -f
echo    • Statut : docker-compose ps
echo.
pause
