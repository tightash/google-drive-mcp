# Use Node.js LTS as base image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install all dependencies (including dev for build)
RUN npm ci

# Copy source files and build scripts
COPY src ./src
COPY tsconfig.json ./
COPY start.sh ./start.sh

# Build the TypeScript project
RUN npm run build

# Remove dev dependencies after build
RUN npm prune --production

# Create directory for config files
RUN mkdir -p /app/config

# Make start script executable
RUN chmod +x /app/start.sh

# Set environment variables
ENV NODE_ENV=production

# Run as non-root user
USER node

# Start the server using start.sh which reads env vars into config files
CMD ["bash", "/app/start.sh"]
