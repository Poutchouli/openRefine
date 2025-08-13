#!/bin/bash

# Script de mise à jour OpenRefine pour Linux/macOS
echo "🔄 Mise à jour d'OpenRefine..."

echo "📥 Téléchargement de la dernière version..."
docker-compose pull

echo "🔄 Redémarrage avec la nouvelle version..."
docker-compose up -d

echo "✅ Mise à jour terminée !"
echo "🌐 OpenRefine est accessible sur http://localhost:8888"
