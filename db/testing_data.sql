INSERT INTO `users` (`uid`, `email`) VALUES
(1, 'test@example.org');

INSERT INTO `cryptos` (`crypto_id`, `fk_uid`, `curr_name`, `xpub`) VALUES
(1, 1, 'BTC', 'xpub661MyMwAqRbcFrA7bzkNa1jFVdqHqNTuaeE9XPaZhGVTVukWWpVrbFJimMQjGx1KTdjq5RMYYaVNcBqFrZ9FSoSn35f6J3bq5vpRaaseA8L');

INSERT INTO `invoices` (`invoice_id`, `fk_uid`, `create_time`, `currency`, `amount`, `settled_amount`, `status`, `payer_email`, `notify_url`, `order_id`, `lang`) VALUES
(1, 1, '2018-03-01 05:18:29', 'CZK', 12.8, 0, 'pending', 'payer@example.org', 'http://post.me', 'boots4321', 'czech');

INSERT INTO `payments` (`payment_id`, `fk_crypto_id`, `fk_invoice_id`, `amount_crypto`, `pament_address`, `expiry`, `status`, `txid`, `confirmations`, `exchange_rate`) VALUES
(1, 1, 1, 0, 'mtfuEXaiQAT3bAuQFqjfZkBymCXY6ypd', '2018-03-31 00:00:00', NULL, NULL, NULL, 10000);

