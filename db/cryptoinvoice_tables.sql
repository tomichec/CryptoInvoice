CREATE DATABASE ci;
USE ci;

CREATE TABLE cryptos (
      crypto_id     int NOT NULL AUTO_INCREMENT,
      fk_uid     int NOT NULL,
      curr_name     varchar(3) NOT NULL,
      xpub     varchar(256),
      PRIMARY KEY (crypto_id)
);

CREATE TABLE users (
      uid     int NOT NULL AUTO_INCREMENT,
      email     varchar(256) NOT NULL,
      PRIMARY KEY (uid)
);

ALTER IGNORE TABLE users ADD UNIQUE (email);

CREATE TABLE invoices (
      invoice_id     int NOT NULL AUTO_INCREMENT,
      fk_uid     int NOT NULL,
      create_time     datetime,
      currency     varchar(8),
      amount     float,
      settled_amount     float,
      status     varchar(8),
      payer_email     varchar(256),
      notify_url     varchar(256),
      order_id     varchar(32),
      lang     varchar(8),
      PRIMARY KEY (invoice_id)
);

CREATE TABLE payments (
      payment_id     int NOT NULL AUTO_INCREMENT,
      fk_crypto_id     int NOT NULL,
      fk_invoice_id     int NOT NULL,
      amount_crypto     int,
      pament_address     varchar(32),
      expiry     datetime,
      status     varchar(8),
      txid     varchar(256),
      confirmations     int,
      exchange_rate     float,
      PRIMARY KEY (payment_id)
);

ALTER TABLE cryptos ADD FOREIGN KEY (fk_uid) REFERENCES users (uid);
ALTER TABLE invoices ADD FOREIGN KEY (fk_uid) REFERENCES users (uid);
ALTER TABLE payments ADD FOREIGN KEY (fk_crypto_id) REFERENCES cryptos (crypto_id);
ALTER TABLE payments ADD FOREIGN KEY (fk_invoice_id) REFERENCES invoices (invoice_id);

-- GRANT ALL PRIVILEGES ON ci.* TO 'myuser'@'%' WITH GRANT OPTION;
