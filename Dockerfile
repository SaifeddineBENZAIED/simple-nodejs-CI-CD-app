# Utiliser une image officielle Node.js comme base
FROM node:16

# Définir le répertoire de travail à la racine de l'application
WORKDIR /app

# Copier les fichiers package.json et package-lock.json pour installer les dépendances
COPY package*.json ./

# Installer les dépendances Node.js
RUN npm install

# Copier tout le contenu du projet dans le conteneur
COPY . .

# Exposer le port sur lequel votre application écoutera
EXPOSE 3000

# Définir la commande de démarrage
CMD ["node", "src/app.js"]
