import { React, useEffect, useState } from "react";
import './index.css';

export const Bank = () => {

  const [accounts, setAccounts] = useState([]);

  function processAccountData(resData) {
    let account_details = {};
    let data = resData.map(
      (transaction) => {
        let key = transaction['customer_name'];
        account_details[key] ||= {
          name: transaction['customer_name'],
          total_balance: 0.0,
          savings_balance: 0.0,
          checking_balance: 0.0,
        };
        if(transaction.account_type == 'savings'){
          account_details[key].savings_balance += Number(transaction['transaction_amount'].replace(/[$,]/, ''));
        }
        if(transaction.account_type == 'checking') {
          account_details[key].checking_balance += Number(transaction['transaction_amount'].replace(/[$,]/, ''));
        }
        account_details[key].total_balance += Number(transaction['transaction_amount'].replace(/[$,]/, ''));
    });

    return Object.values(account_details);
  }


 useEffect(() => {
    fetch('https://quietstreamfinancial.github.io/eng-recruiting/transactions.json')
      .then((response) => {
        return response.json();
      })
      .then((resData) => {
        setAccounts(processAccountData(resData));
      });
  }, []);


  return <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Saving Account Balance</th>
              <th>Checking Account Balance</th>
              <th>Total Balance</th>
            </tr>
          </thead>
          <tbody>
            { accounts.length > 0 && (
                accounts.map((account) => (
                  <tr key = {account.name}>
                    <td>{account.name}</td>
                    <td>{account.savings_balance.toFixed(2)}</td>
                    <td>{account.checking_balance.toFixed(2)}</td>
                    <td>{account.total_balance.toFixed(2)}</td>
                  </tr>
                ))
            )}
          </tbody>
        </table>;
};
