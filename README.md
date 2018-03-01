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


(TODO: write more detailed description)

#### Database

(INCOMPLETE)

If you are using a mariadb (mysql fork) than create a new database "ci" and then run
```
mysql -u USER -p < db/cryptoinvoice_tables.sql
```
for your database USER (independent of your system's user name), in order to create the database table structure.

You can also insert some example entries for testing purposes by
```
mysql -u USER -p ci < db/testing_data.sql
```


### Installation

To setup the backend go to the backend directory in your local git repository `cd CryptoInvoice/backend` and run

```
composer install
```

Configure your environment by `cp .env.example .env` and edit the file `.env` to achieve your desired configuration, particularly to point to the correct database name in your.

Synchronise your development directory with your http server, e.g.

```
rsync -avzu ../backend/ /var/www/CryptoInvoice/ --delete
```

and change the file ownership to grant your webserver the necessary rights to write the log files

```
sudo chown apache -R /var/www/CryptoInvoice/
```

<
