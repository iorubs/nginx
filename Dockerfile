FROM nginx:latest
MAINTAINER Ruben Vasconcelos "ruben.vasconcelos2@mail.dcu.ie"

RUN apt-get update

COPY resources/ /etc/nginx/
COPY start-app.sh /root/

EXPOSE 80 443
CMD ["sh", "/root/start-app.sh"]
