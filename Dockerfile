# Use official Node.js runtime as the base image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY ./app.js .

# Expose the application port
EXPOSE 3000

# Command to run the app
CMD ["node", "app.js"]
