# Utiliser une image officielle Node.js comme base
FROM node:16

# Définir le répertoire de travail
WORKDIR /app

# Copier package.json et package-lock.json
COPY package*.json ./

# Copier tout le reste
COPY . .

# Exposer le port de l'application
EXPOSE 3000

# Démarrer l'application
CMD ["node","src/app.js"]
