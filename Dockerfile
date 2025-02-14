# 1. Use the official Node.js image (Alpine version for lightweight build)
FROM node:19.7.0-alpine

# 2. Set environment variable
ENV NODE_ENV=production

# 3a. Create a directory for the app
WORKDIR /labone

# 3b. Change ownership of the directory to the Node.js user and group
RUN chown -R node:node /labone

# 4. Switch to the non-root Node.js user
USER node

# 5. Copy all source files and change file ownership
COPY --chown=node:node . .

# 6. Install dependencies
RUN npm install

# 7. Expose the application port
EXPOSE 3000

# 8. Default command to start the application
CMD ["node", "src/index.js"]
