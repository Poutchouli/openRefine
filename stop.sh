#!/bin/bash

# Script d'arrêt OpenRefine pour Linux/macOS
echo "🛑 Arrêt d'OpenRefine..."

docker-compose down

echo "✅ OpenRefine a été arrêté."
echo "💾 Vos données sont conservées dans le volume Docker 'openrefine_data'"
