@echo off
REM Script d'arrêt OpenRefine pour Windows

echo 🛑 Arrêt d'OpenRefine...

docker-compose down

echo ✅ OpenRefine a été arrêté.
echo 💾 Vos données sont conservées dans le volume Docker 'openrefine_data'
echo.
pause
