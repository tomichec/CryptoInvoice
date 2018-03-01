CREATE DATABASE ci;
USE ci;

CREATE TABLE cryptos (
      crypto_id     int NOT NULL AUTO_INCREMENT,
      fk_uid     int NOT NULL,
      curr_name     varchar(3),
      xpub     varchar(256),
      PRIMARY KEY (crypto_id)
);

CREATE TABLE users (
      uid     int NOT NULL AUTO_INCREMENT,
      email     varchar(256),
      PRIMARY KEY (uid)
);

CREATE TABLE invoices (
      invoice_id     int NOT NULL AUTO_INCREMENT,
      fk_uid     int NOT NULL,
      create_time     datetime,
      currrency     varchar(8),
      amount     float,
      settled_amount     float,
      status     varchar(8),
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

CREATE TABLE reference (
      ref_id     int NOT NULL AUTO_INCREMENT,
      fk_invoice_id     int NOT NULL,
      email     varchar(256),
      notify_url     varchar(256),
      order_id     varchar(32),
      lang     varchar(8),
      PRIMARY KEY (ref_id)
);


ALTER TABLE cryptos ADD FOREIGN KEY (fk_uid) REFERENCES users (uid);
ALTER TABLE invoices ADD FOREIGN KEY (fk_uid) REFERENCES users (uid);
ALTER TABLE payments ADD FOREIGN KEY (fk_crypto_id) REFERENCES cryptos (crypto_id);
ALTER TABLE payments ADD FOREIGN KEY (fk_invoice_id) REFERENCES invoices (invoice_id);
ALTER TABLE reference ADD FOREIGN KEY (fk_invoice_id) REFERENCES invoices (invoice_id);

-- GRANT ALL PRIVILEGES ON ci.* TO 'myuser'@'%' WITH GRANT OPTION;
