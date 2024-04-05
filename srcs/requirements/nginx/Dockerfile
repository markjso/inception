FROM	alpine:3.17

# NGINX
RUN		apk update && apk upgrade &&\
		apk add nginx &&\
		mkdir -p /var/www/html/
COPY	./conf/nginx.conf /etc/nginx/http.d/nginx.conf

# OPENSSL
RUN		apk add openssl &&\
		openssl req -x509 -nodes -days 365 -newkey rsa:2048\
			-keyout /etc/ssl/private/nginx-selfsigned.key\
			-out /etc/ssl/certs/nginx-selfsigned.crt\
			-subj "/C=AU/ST=South Australia/L=Adelaide/O=42Network/OU=student/CN=nginx_host_example"

RUN		adduser -D -g 'www' www &&\
		chown -R www:www /run/nginx/ &&\
		chown -R www:www /var/www/html/

EXPOSE	443

CMD			["nginx", "-g", "daemon off;"]
