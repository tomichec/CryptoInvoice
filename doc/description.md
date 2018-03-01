# CRYPTOINVOICE

The goal is to create open source software under the MIT license, which will help people who want to receive cryptocurrencies as part of their business or other activity without having to exchange them to FIAT (hereinafter referred to as the **"User"**).

Parallel Polis is interested to ensure the operation of a server through which Users will have the possibility to use the created SW. Users should therefore be able to use the SW through the Parallel Polis server (without extensive technical knowledge for symbolic or no fee at all) or their own server.

## BASIC FEATURES AND FUNCTIONS

The basic features and functions that the SW should meet are as follows:

1. **User Account**

The User can create its own account through which he will send payment requests to its customers. Within the User's account, the following data is provided in particular:

* email address of the User,
* the identifier used to generate the addresses (e.g., xpub), or specific cryptocurrency addresses to which the payments should be made,
* other optional information, such as the user name and its identification information.

2. **Creation of payment request (FIAT through cryptocurrency)**

When creating a payment request, the User states in particular the following:

* description of the invoiced activity (subject and optional detailed description),
* amount in FIAT currency (in CZK, alternatively in EUR),
* a choice between the exchange rate fixation at the time of the payment request creation or at the time of payment by the person to whom the payment request is sent (hereinafter referred to as the **"Payer"**),
* a variable symbol corresponding to an invoice created by the User separately in its billing system,
* Payer's email address,
* In addition to the above data, the User can insert an invoice in the UI in pdf form, i.e. the tax document, which is to be paid by the payment in the form of cryptocurrency.

3. **Payment realization according to the payment request.**

The Payer receives to his email (which the User stated when making a payment request) a payment request as follows:

* an email requesting a payment stating the name of the User, the subject of the invoice, the invoiced amount in the FIAT currency and the variable symbol,
* to the e-mail will be attached the tax document, the invoice, which the User has uploaded when creating the payment request,
* there will be included a link in the email that redirects the Payer to the corresponding server (where the payment will be made),
* the payment website will include a payment option including BTC, XMR and LTC,
* after selecting the cryptocurrency, a QR code containing information about the paid amount (in the selected cryptocurrency) and the address to which the amount is to be sent will be generated (these data will be also displayed separately from the QR code so that the Payer can manually copy it),
* the generated payment information including the exchange rate will be fixed for 15 minutes (according to the invoiced amount in the FIAT currency); after this period, the website will show information that the payment wasn’t done in time and has to be done repeatedly (i.e. the User has to re-open the emailed link); within 15 minutes the transaction must be sent to the network (though it does not have to be included in the blockchain);
* if the User chose to fix the exchange rate at the time the payment request was made, the previous point does not apply and the Payer sees on the relevant website an amount equal to the pre-fixed exchange rate,
* once the payment has been received, the website will show that the payment was made in time; subsequently, both the User and the Payer will receive an email with payment information including, in particular, information on the amount paid in the cryptocurrency, the link to the transaction in question in one of the blockchain explorers, and the link to the payment request that has been realized,
* after receipt of a confirmation of payment, i.e. its inclusion in the blockchain, the Payer will receive an email informing him that his payment according to the payment request in question has been properly executed; the User will be in the copy of the email. This confirmation should meet the documentation requirements of the transaction in question for accounting purposes (i.e., it should include a reference to the invoice, the FIAT and the corresponding cryptocurrency amount and the link to the transaction and the corresponding block in blockchain).

## OPTIONAL FEATURES AND FUNCTIONS

Optional features to further improve the SW:

* the possibility of repeated and automatic submission of payment requests (e.g. regular monthly payments)
* Use of lightning network for repeated payments
* PGP encrypted email communication between the User, the server, and the Payer

## THE TECHNICAL REQUIREMENTS

Technical requirements that the solution should meet:

* 



