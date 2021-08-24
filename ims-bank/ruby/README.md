# IMS Bank Exercise

## Scenario

A financial processing system exposes an API for transactions. The result of a
GET request to this API is a JSON array of records with information about the
user, bank account and transaction:

```json
[
  {
    "id": 2,
    "transaction_amount": "$-179.62",
    "date": "2021-05-23T22:53:17Z",
    "account_id": "21",
    "account_number": 5048373234301855,
    "account_type": "savings",
    "customer_id": 9129,
    "customer_name": "Felipe Vigus",
    "customer_email": "fvigus1@bbc.co.uk"
  }
]

```

## Coding challenge

Your challenge is to consume the transactions from this API and use the
information to build a summary table for a bank manager.

1. Call the API to retrieve the list of transactions:
    * Make a GET request to: [https://quietstreamfinancial.github.io/eng-recruiting/transactions.json](https://quietstreamfinancial.github.io/eng-recruiting/transactions.json)
2. Use the results to display a table that contains columns for a customer's
   name, the total balance of their checking accounts, the total balance of
   their savings accounts, and the total balance of all of their accounts.
    * Update `main.rb` and `views/table.erb`

To complete the challenge, fork this sandbox and complete
the tasks above. Submit the link to your fork to your recruiter contact.

### Expectations
* Your solution executes without crashing
* We don't expect you to spend more than two hours on this exercise.

