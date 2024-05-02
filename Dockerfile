# Use a Node.js base image 
FROM node:latest
# set the working directory  in the container
WORKDIR /usr/app
# copy package.json and package-lock.json files to the working directory
COPY package*.json .
# Install dependencies
RUN npm install
# Copy the rest of the application  files to the woorking dir.
COPY . .
# Expose port 3000 to thee outside world
EXPOSE 3000
# Command to run the application 
CMD ["npm", "start"]