FROM nginx:latest as nginx-with-curl

RUN apt-get update && apt-get install -y --no-install-recommends curl
RUN apt-get install -y ca-certificates
RUN apt-get clean

FROM nginx-with-curl as nginx-with-ssl-configs

RUN mkdir /etc/letsencrypt
# Download and save best practice configurations from certbot
# Can't be done in final image stage or else it will be ignored by the volume
RUN curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > /etc/letsencrypt/options-ssl-nginx.conf
RUN curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > /etc/letsencrypt/ssl-dhparams.pem

FROM nginx-with-ssl-configs as nginx-with-ssl-and-configuration

COPY ./nginx_config/*.conf /etc/nginx/conf.d/
COPY ./includes/ /etc/nginx/includes/
COPY ./backend-not-found.html /var/www/html/backend-not-found.html