require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'
require 'json'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080


def get_transactions_data
  uri = 'https://quietstreamfinancial.github.io/eng-recruiting/transactions.json'
  response = RestClient.get(uri, headers={ 'Accept' => 'application/json' })
  JSON.parse(response.body)
end

def generate_summary_table(transactions)
  summary_data = {}

  transactions.each do |transaction|
      customer_name = transaction['customer_name']
      account_type = transaction['account_type']
      amount = transaction['transaction_amount'].delete('$').to_f

      summary_data[customer_name] ||= {
          'Checking' => 0,
          'Savings' => 0,
          'Total' => 0
      }

      case account_type
      when 'checking'
          summary_data[customer_name]['Checking'] += amount
      when 'savings'
          summary_data[customer_name]['Savings'] += amount
      end

      summary_data[customer_name]['Total'] += amount
  end
  
  summary_data
end

get '/' do
  transactions_data = get_transactions_data
    if transactions_data
        @summary_data = generate_summary_table(transactions_data)
        erb :table
    else
        "Failed to fetch data from the API."
    end
end
