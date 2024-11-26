# Utiliser une image officielle Node.js comme base
FROM node:16

# Définir le répertoire de travail
WORKDIR /app

# Copier tout le contenu du projet dans le conteneur
COPY . .

# Installer les dépendances manuellement si elles sont présentes dans votre projet
RUN npm install src/lib  # Remplacez par le chemin des modules nécessaires si inclus dans le projet

# Exposer le port de l'application
EXPOSE 3000

# Définir la commande de démarrage
CMD ["node", "src/app.js"]
