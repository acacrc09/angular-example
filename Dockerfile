#FROM nginx:1.13.3-alpine
FROM jachri21/angular-example:latest

## Copy our nginx config
#COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## copy over the artifacts in dist folder to default nginx public folder
#COPY dist/ /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]