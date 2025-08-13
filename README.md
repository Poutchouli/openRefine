# OpenRefine Docker Deployment

Ce projet permet de déployer facilement OpenRefine avec Docker et Docker Compose.

## 🚀 Démarrage rapide

### Prérequis
- [Docker](https://www.docker.com/get-started) installé
- [Docker Compose](https://docs.docker.com/compose/install/) installé

### Démarrage

#### Windows
```bash
# Double-cliquer sur start.bat ou exécuter :
start.bat
```

#### Linux/macOS
```bash
# Rendre le script exécutable
chmod +x start.sh

# Exécuter le script
./start.sh
```

#### Manuel avec Docker Compose
```bash
docker-compose up -d
```

### Accès à OpenRefine
Une fois démarré, OpenRefine est accessible à l'adresse :
🌐 **http://localhost:8888**

## 📋 Commandes utiles

### Arrêter OpenRefine
```bash
# Windows
stop.bat

# Linux/macOS
./stop.sh

# Manual
docker-compose down
```

### Redémarrer OpenRefine
```bash
docker-compose restart
```

### Voir les logs
```bash
docker-compose logs -f
```

### Vérifier le statut
```bash
docker-compose ps
```

### Supprimer complètement (avec les données)
```bash
docker-compose down -v
```

## 💾 Persistance des données

Vos projets OpenRefine sont automatiquement sauvegardés dans un volume Docker nommé `openrefine_data`. Cela signifie que :

- ✅ Vos données persistent même si vous arrêtez le conteneur
- ✅ Vos projets sont conservés lors des mises à jour
- ✅ Vous pouvez sauvegarder/restaurer le volume si nécessaire

### Sauvegarder vos données
```bash
# Créer une sauvegarde
docker run --rm -v openrefine_data:/data -v $(pwd):/backup alpine tar czf /backup/openrefine-backup.tar.gz -C /data .
```

### Restaurer vos données
```bash
# Restaurer depuis une sauvegarde
docker run --rm -v openrefine_data:/data -v $(pwd):/backup alpine tar xzf /backup/openrefine-backup.tar.gz -C /data
```

## ⚙️ Configuration

### Modifier la mémoire allouée
Éditez le fichier `docker-compose.yml` et modifiez la ligne :
```yaml
environment:
  - JAVA_OPTS=-Xms1400M -Xmx2048M  # Modifiez ces valeurs
```

### Changer le port
Éditez le fichier `docker-compose.yml` et modifiez :
```yaml
ports:
  - "8888:3333"  # Changez 8888 par le port désiré
```

## 🔧 Dépannage

### Le conteneur ne démarre pas
```bash
# Vérifier les logs
docker-compose logs

# Vérifier l'état des conteneurs
docker-compose ps
```

### Port déjà utilisé
Si le port 8888 est déjà utilisé, modifiez le fichier `docker-compose.yml` pour utiliser un autre port.

### Problèmes de mémoire
Si OpenRefine manque de mémoire, augmentez les valeurs dans `JAVA_OPTS`.

## 📁 Structure du projet

```
openrefine-docker/
├── docker-compose.yml    # Configuration Docker Compose
├── Dockerfile           # Dockerfile personnalisé (optionnel)
├── start.bat           # Script de démarrage Windows
├── start.sh            # Script de démarrage Linux/macOS
├── stop.bat            # Script d'arrêt Windows
├── stop.sh             # Script d'arrêt Linux/macOS
└── README.md           # Cette documentation
```

## 🤝 Contribution

N'hésitez pas à proposer des améliorations via des issues ou des pull requests !

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.
