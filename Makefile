# Makefile pour OpenRefine Docker

.PHONY: help start stop restart logs status clean backup restore build

# Variables
COMPOSE_FILE := docker-compose.yml
SERVICE_NAME := openrefine
BACKUP_DIR := ./backups

help: ## Afficher l'aide
	@echo "Commandes disponibles :"
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

start: ## Démarrer OpenRefine
	@echo "🚀 Démarrage d'OpenRefine..."
	docker-compose -f $(COMPOSE_FILE) up -d
	@echo "✅ OpenRefine est accessible sur http://localhost:8888"

stop: ## Arrêter OpenRefine
	@echo "🛑 Arrêt d'OpenRefine..."
	docker-compose -f $(COMPOSE_FILE) down
	@echo "✅ OpenRefine arrêté"

restart: ## Redémarrer OpenRefine
	@echo "🔄 Redémarrage d'OpenRefine..."
	docker-compose -f $(COMPOSE_FILE) restart
	@echo "✅ OpenRefine redémarré"

logs: ## Afficher les logs
	docker-compose -f $(COMPOSE_FILE) logs -f $(SERVICE_NAME)

status: ## Vérifier le statut
	docker-compose -f $(COMPOSE_FILE) ps

clean: ## Supprimer les conteneurs et volumes
	@echo "🧹 Nettoyage complet..."
	docker-compose -f $(COMPOSE_FILE) down -v
	docker system prune -f
	@echo "✅ Nettoyage terminé"

backup: ## Sauvegarder les données
	@mkdir -p $(BACKUP_DIR)
	@echo "💾 Sauvegarde des données..."
	docker run --rm -v openrefine_data:/data -v $(PWD)/$(BACKUP_DIR):/backup alpine tar czf /backup/openrefine-backup-$(shell date +%Y%m%d-%H%M%S).tar.gz -C /data .
	@echo "✅ Sauvegarde créée dans $(BACKUP_DIR)/"

restore: ## Restaurer les données (nécessite BACKUP_FILE=fichier.tar.gz)
	@if [ -z "$(BACKUP_FILE)" ]; then echo "❌ Veuillez spécifier BACKUP_FILE=fichier.tar.gz"; exit 1; fi
	@echo "📥 Restauration des données depuis $(BACKUP_FILE)..."
	docker run --rm -v openrefine_data:/data -v $(PWD)/$(BACKUP_DIR):/backup alpine tar xzf /backup/$(BACKUP_FILE) -C /data
	@echo "✅ Données restaurées"

build: ## Construire l'image personnalisée
	@echo "🔨 Construction de l'image..."
	docker build -t openrefine-custom .
	@echo "✅ Image construite"

update: ## Mettre à jour l'image
	@echo "🔄 Mise à jour de l'image..."
	docker-compose -f $(COMPOSE_FILE) pull
	docker-compose -f $(COMPOSE_FILE) up -d
	@echo "✅ Mise à jour terminée"
