# Use lightweight Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package.json ./

# Install dependencies
RUN npm install

# Copy application source
COPY . .

# Expose app port
EXPOSE 3000

# Start application
CMD ["npm", "start"]
