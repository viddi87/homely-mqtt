FROM node:18-alpine

ARG TARGETPLATFORM
# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --sqlite=/usr/local

# Copy app source code
COPY . .

# Build
RUN npm run build

# Run app
WORKDIR /app/dist
CMD [ "node", "index.js" ]