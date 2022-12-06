# Moodle Docker testing environment (including moosh)
## How to start
1.) Download and extract your moodle code from  [moodle.org](https://download.moodle.org/releases/latest/) and place it inside the *moodle* folder.
2.) Download and extract moosh from  [moodle.org](https://moodle.org/plugins/view.php?id=522) and place it inside the *moosh* folder.
3.) Run traefik as explained [here](https://github.com/Dmfama20/traefik_example) 
OR
comment out the *labels* option included in the phpMyAdmin service and the nginx service and enter a port there instead and modify conf/nginx.conf accordingly.
4.) Run ``docker-compose up -d`` to build the necessary containers and start them.
5.) Install moodle via browser 
OR
via CLI:
``docker exec -it moodle-moosh-docker-app php admin/cli/install.php --lang=de --wwwroot=http://docker-moosh.localhost --dataroot=/var/www/moodledata --dbtype=mariadb --dbhost= moodle-moosh-docker-db  --dbname=moodle --dbuser=moodleuser --dbpass=mysqlpassword --prefix=mdl_ --fullname=moodle-moosh --shortname=moodle-moosh --adminpass=test --adminemail=admin@moodle.invalid --agree-license --non-interactive``

6.) Check if moosh is running properly:
``docker exec -it -u www-data moodle-moosh-docker-moosh bash``
and then
``moosh user-list``
There you should the at least two moodle users listed.
7.) Create some dummy content via
``docker exec -i -u www-data moodle-moosh-docker-moosh bash < create-content.sh``


