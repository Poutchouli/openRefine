# Dockerfile basé sur l'image officielle OpenRefine
FROM felixlohmeier/openrefine:latest

# Métadonnées
LABEL maintainer="votre-email@example.com"
LABEL description="OpenRefine container avec configuration personnalisée"
LABEL version="1.0"

# Variables d'environnement
ENV OPENREFINE_MEMORY=2048M
ENV OPENREFINE_PORT=3333
ENV OPENREFINE_HOST=0.0.0.0

# Exposition du port
EXPOSE 3333

# Volume pour les données
VOLUME ["/data"]

# Point d'entrée
CMD ["/app/refine", "-i", "0.0.0.0", "-d", "/data", "-m", "${OPENREFINE_MEMORY}"]
