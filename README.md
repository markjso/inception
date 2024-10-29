## Inception
A project that aims to broaden your knowledge of sys admin by using Docker.
### Steps
After a lot(and I mean a lot!) of trial and error these are the steps I took to complete the project.  

1. Set up virtual machine using latest Debian image (12.5 at time of writing)
2. Install required software - apt udpate<br>
                             - apt install -y sudo, ufw, docker, docker-compose, make, openbox, xinit, kitty, firefox-esr
3. Do the port forwarding - ufw enable<br>
                          - modify /etc/ssh/sshd.confit for Port 42<br>
                          - ufw allow 443, 80 & 42<br>
                          - shutdown the virtaul machine and add port forwarding rules in Settings<br>
                             - SSH 42<br>
                             - HTTP 80<br>
                             - HTTPS 443<br>
                         - restart the vm<br>
                         - open a terminal and ssh into the vm with ssh user@127.0.0.1 -p 42
4. Configure sudo - nano /etc/sudoers<br>
                  - add user ALL to user priveleges<br>
                  - add user to sudo and docker groups sudo usermod -aG docker username
5. Make directories and files for the project using the subject pdf structure
7. Modify /etc/hosts so that 127.0.0.1 points to user.42.fr
8. Create nginx container. There is lots of documentation on the internet about this.<br>
                 - image is the Dockerfile. Needs to contain the run commands for both nginx and openssl. We use openssl to generate a self-signed certificate in TLSv1.3<br>
                 - configuration goes in conf/nginx.conf<br>
                 - google what is required for an openssl certificate, there is a format to follow
10. Create worpress container. In the .env file that you would have created enter login details required for wordpress (there is an example included in my github).<br>
                - the Dockerfile needs to include the installalation of php-fpm and its dependicies<br>
                - in the /conf folder you will need a bash script to configure wordpress (I used wp-cli for this)<br>
                - at this point you will need the docker-compose.yml file (located at /srcs)
12. Create mariadb container - in the /conf folder you will need a bash script to configure the mysql database and store the login details in the .env file
13. Create Makefile with docker-compose commands to build, up, down, fclean etc

### Useful commands
docker-compose up -d - start container<br>
docker-compose down - stop container<br>
docker-compose up -d --build - build the container<br>  
docker ps -a - shows the list of running containers<br>
docker-compose down --volumes - stops the container and removes the volumes<br>
docker exec -it wordpress ps aux | grep 'php' - shows that wordpress and php have been installed<br>
docker exec -it mariadb mysql -u user -ppwd - log into the mariadb<br>
SHOW DATABASES - when in the mariadb will show a list of databases installed. Use this to check that a wordpress db exists.
