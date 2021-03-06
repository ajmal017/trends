#   Building the image
#       docker build -f node.dockerfile -t gokusayon/trends-dashboard . 
#   Running container after linking with existing container
#       docker run -p 80:80 --name dash -d --link trends:trends-app gokusayon/trends-dashboard    
#   Go to container shell
#       docker exec -i -t dash /bin/sh

#   Create an isolated network.
#       docker network create --driver bridge isolated_network 
#       docker run -d --net=isolated_network -p 5000:5000 --name trends gokusayon/trends-app
#       docker run -d --net=isolated_network -p 80:80 --name dash gokusayon/trends-dashboard

### STAGE 1: Setup ###
FROM        nginx:alpine

# RUN         apk add --no-cache tzdata
# ENV         TZ Asia/Kolkata

COPY        default.conf /etc/nginx/conf.d/default.conf
RUN         rm -rf /usr/share/nginx/html/*
COPY        ./dist /usr/share/nginx/html
CMD         ["nginx", "-g", "daemon off;"]