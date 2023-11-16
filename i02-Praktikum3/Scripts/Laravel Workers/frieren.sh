apt-get update
apt-get install apt-transport-https lsb-release ca-certificates wget ntpdate
ntpdate time.google.com
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install php8.2 composer php8.2-{bz2,curl,intl,mysql,readline,xml}
git clone https://github.com/martuafernando/laravel-praktikum-jarkom.git
cd laravel-praktikum-jarkom
composer install
