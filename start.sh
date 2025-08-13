#!/bin/bash

# Script de démarrage OpenRefine pour Linux/macOS
echo "🚀 Démarrage d'OpenRefine avec Docker..."

# Vérifier si Docker est installé
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
fi

# Vérifier si Docker Compose est installé
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
fi

# Démarrer les services
echo "📦 Démarrage des conteneurs..."
docker-compose up -d

# Vérifier le statut
echo "🔍 Vérification du statut..."
sleep 5
docker-compose ps

echo ""
echo "✅ OpenRefine est maintenant accessible à l'adresse :"
echo "🌐 http://localhost:8888"
echo ""
echo "📋 Commandes utiles :"
echo "   • Arrêter : docker-compose down"
echo "   • Redémarrer : docker-compose restart"
echo "   • Voir les logs : docker-compose logs -f"
echo "   • Statut : docker-compose ps"
