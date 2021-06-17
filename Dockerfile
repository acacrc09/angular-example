
# Stage 1: Compile and Build angular codebase

# Use official node image as the base image
FROM node:latest as build

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY ./ /usr/local/app/

# Install all the dependencies
RUN npm install

# Generate the build of the application
RUN npm run build


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
#FROM nginx:1.13.3-alpine

## Copy our nginx config
#COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
#RUN rm -rf /usr/share/nginx/html/*

## copy over the artifacts in dist folder to default nginx public folder
## COPY dist/ /usr/share/nginx/html

#EXPOSE 8080

#CMD ["nginx", "-g", "daemon off;"]

### STAGE 1: Build ###

# We label our stage as ‘builder’
#FROM node:10-alpine as builder

#COPY package.json package-lock.json ./

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build

#RUN npm ci && mkdir /ng-app && mv ./node_modules ./ng-app

#WORKDIR /ng-app

#COPY . .

## Build the angular app in production mode and store the artifacts in dist folder

#RUN npm run ng build -- --prod --output-path=dist


### STAGE 2: Setup ###

#FROM nginx:1.13.3-alpine

## Copy our default nginx config
#COPY nginx/default.conf /etc/nginx/conf.d/

## Remove default nginx website
#RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
#COPY --from=builder /ng-app/dist /usr/share/nginx/html

#EXPOSE 8080

#CMD ["nginx", "-g", "daemon off;"]

