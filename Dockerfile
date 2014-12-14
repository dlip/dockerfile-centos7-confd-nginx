FROM dlip/centos7-confd

RUN yum -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD files/nginx-start.sh /usr/bin/nginx-start.sh
RUN chmod u+x /usr/bin/nginx-start.sh
RUN mkdir -p /etc/nginx/sites-enabled

ADD files/nginx-supervisord.conf /etc/supervisord.d/nginx.conf

ADD files/nginx.toml /etc/confd/conf.d/nginx.toml
ADD files/nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl
