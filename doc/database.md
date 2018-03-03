# CryptoInvoice -- database design

## Table relations

|----------|           1:N       |----------|
|  Users   |---------------------| Cryptos  |
|----------|                     |----------|
      \                              |
       \                             |1:1
    1:M \                            |
         \  |----------|   1:M   |----------|
          \-|Invoices  |---------| Payments |
            |----------|         |----------|


## Detailed description of the tables

### Users

The table of the users of the system. This will be extended by the authentication methods in the later stage (include passwd hash for those purposes).

|----------|--------------|-----------------------------------|
| variable | value        | comment                           |
|----------|--------------|-----------------------------------|
| uid      | int          | autoincrementing primary key      |
| email    | varchar(256) | user email serving as a user name |
|----------|--------------|-----------------------------------|

### Cryptos

Table of accepted cryptocurrencies. In the first stage we will develop for the Bitcoin testnet, so no actual funds are running the risk. There is a possible security issue with this table, if the xpub key is replace by a malicious actor, hence some sort of second factor authorization should be invented. The types of accepted cryptocurrencies can be configured for each user.

|-----------|--------------|-------------------------------------------------|
| variable  | value        | comment                                         |
|-----------|--------------|-------------------------------------------------|
| crypto_id | int          | autoincrementing primary key                    |
| fk_uid    | int          | forigner key to reference the user              |
| xpub      | varchar(256) | master public key to generate payment addresses |
| name_cur  | varchar(3)   | name of the cryptocurrency                      |
|-----------|--------------|-------------------------------------------------|


### Invoices

The table of invoices created by the users.

|---------------|--------------|--------------------------------------------|
| variable      | value        | comment                                    |
|---------------|--------------|--------------------------------------------|
| invoice_id    | int          | autoincrementing primary key               |
| fk_uid        | varchar(256) | foreigner key to reference the user        |
| currency      | varchar(3)   | specifies the fiat currency of the invoice |
| amount        | float        | amount to be paid                          |
| settled_amt   | float        | already payed amount                       |
| creation_time | datetime     | time of invoice creation                   |
| status        | varchar(8)   | status of the payment                      |
| payer_email   | varchar(256) | payer email address                        |
| notify_url    | varchar(256) | url for a notification post request        |
| order_id      | varchar(256) | order id for reference purposes            |
|---------------|--------------|--------------------------------------------|

### Payments

Payments for the invoices in the cryptocurrency. Each user will have specific cryptocurrencies, which are the only ones allowed for the payment of the invoices of that user. A multiple payments are allowed for a single invoice (e.g. in case that the invoice has expired or has been payed only partialy).

|---------------|--------------|----------------------------------------------------|
| variable      | value        | comment                                            |
|---------------|--------------|----------------------------------------------------|
| fk_crypto_id  | int          | foreigner key to reference the crypto              |
| fk_invoice_id | int          | foreigner key to reference the invoice to be payed |
| exchange_rate | float        | exchange rate crypto-to-fiat                       |
| amount_crypto | float        | amount of cryptocurrency to be paid                |
| address       | varchar(256) | payment address                                    |
| expiry        | datatime     | expiry of the payment request                      |
| status        | varchar(8)   | status of the payment                              |
| txid          | varchar(256) | txid of the made payment                           |
| confirmations | int          | number of confirmations in the blockchain          |
|---------------|--------------|----------------------------------------------------|


*txid could be possibly multiple, if the user made a payment several times to the same address
