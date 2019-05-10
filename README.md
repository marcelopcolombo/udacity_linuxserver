# Marcelo's Ubuntu Server Configuration Project

This project was to configure linux server with some specifications.
The Ubuntu version is 16.04.
I used amazon lightsail to create server instance
Some of the steps are in the file commands.sh, althought this was not made for execution.

to connect via ssh use ssh -i (the key passed on comment) -p 2200 grader@3.214.129.242

senha: graderudacity

Visit the address http://3.214.129.242.xip.io/  to see the project.

## the server configurations

- updated packages
- added grader user
- added sudo permissions
- genereted ssh key gen
- added ssh key to authorized keys
- changed ssh port to 2200
- changed timezone to UTC
- installed apache2 package
- installed wsgi mod
- installed postgres sql
- created user catalog
- created db udacity_catalog
- created tables
- installed git
- updated firewall ports to accept 2200, 80 and 123.
- updated firewall ports to deny other incoming calls.
- enabled ufw
- installed python2 and pip
- cloned udacity_catalog_items project on https://github.com/marcelopcolombo/udacity_catalog_items
- installed priject requirements
- created catalog.wsgi file
- changed application.py to __init__.py
- changed permissions for /var/www
- restarted apache2, ssh

## some useful links and tutorials I used to build this project

- https://www.digitalocean.com/community/tutorials/how-to-deploy-a-flask-application-on-an-ubuntu-vps
- http://flask.pocoo.org/docs/1.0/deploying/mod_wsgi/
- https://www.a2hosting.com/kb/getting-started-guide/accessing-your-account/changing-the-ssh-server-port-number