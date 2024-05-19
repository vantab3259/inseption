FROM debian:11

RUN apt-get update -y \
    && apt-get install -y nginx vim curl openssl\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /usr/share/nginx/logs
    
    
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/CN=mudoh.42.fr/UID=mudoh"
     
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginxlast.conf
#RUN mkdir /var/www/yolo

COPY ./conf/localhost.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/localhost.conf /etc/nginx/sites-enabled/localhost.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./tools/index.html /var/www/yolo
# RUN chown -R www-data:www-data /var/www/yolo

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]

