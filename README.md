# CryptoInvoice

CryptoInvoice is an electronic cryptocurrency invoicing system released as a free software.

[General description](./doc/description.md)
[Technical description](./doc/doc.md)

## Clone the repository

To obtain the current version of the CryptoInvoice, run the following command

```
git clone https://github.com/pavelurbaczka/CryptoInvoice
```

## Backend

### Prerequisites

For the CryptoInvoice you need to have a http[d] server (e.g. apache) with a PHP (>= 7.1.3) and SQL database (e.g. mariadb).

#### Webserver

Configure your webserver (for apache edit `/etc/httpd/conf/httpd.conf`) to point to the CryptoInvoice installation
```
DocumentRoot "/var/www/CryptoInvoice/public"
```
and allow access by including the following lines
```
<Directory "/var/www/CryptoInvoice">
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
</Directory>
```
Then create the project server directory `sudo mkdir /var/www/CryptoInvoice/public` and optionaly change the ownership to your user `sudo chown SYSTEM_USER -R  /var/www/CryptoInvoice/`.


(TODO: write more detailed description)

#### Database

If you are using a mariadb (mysql fork) than run the following command in order to create the database table structure.
```
mysql -u USER -p < db/cryptoinvoice_tables.sql
```
for your database USER (independent of your system's user name). This will also create a database ci. 

You can also insert some example entries for testing purposes by
```
mysql -u USER -p ci < db/testing_data.sql
```

### Installation

To setup the backend go to the backend directory in your local git repository `cd CryptoInvoice/backend` and run

```
composer install
```

Configure your environment by `cp .env.example .env` and editing the file `.env` to achieve your desired configuration, particularly to change your database user and password.

Synchronise your development directory with your http server, e.g.

```
rsync -avzu backend/ /var/www/CryptoInvoice/ --delete
```
You will need to run this command each time your source has been updated (unless you clone the repo directly to your web server).

Change the file ownership to grant your webserver the necessary rights to write the log files

```
sudo chown apache -R /var/www/CryptoInvoice/storage/logs
```
which also enables in-browser backtrace in case of errors. 

### Development

The backend is based on [Lumen Laravel framework](https://lumen.laravel.com/). The [router file](./backend/routes/web.php). This uses is controled by source located in [controllers directory](app/Http/Controllers/).

