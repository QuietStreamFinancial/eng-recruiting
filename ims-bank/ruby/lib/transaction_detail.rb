require 'net/http'

class TransactionDetail
	attr_accessor :transactions
	ACCOUNT_DETAILS_URL = 'https://quietstreamfinancial.github.io/eng-recruiting/transactions.json'

	def initialize
	  @transactions = JSON.parse(Net::HTTP.get_response(URI(ACCOUNT_DETAILS_URL)).body)
	end

	def self.call
	  new.process
	end


  def process
    sort_by_name_and_account_type = transactions.group_by{ |transaction| "#{transaction['customer_name']}:#{transaction['account_type']}" }

    sort_by_name_and_account_type.values.map do|v|
      v.inject({}){ |new_hash, record|
        new_hash[:name] = record['customer_name'];
        new_hash[:account_type] = record['account_type'];
        new_hash[:balance] = v.inject(0){|sum, rec| sum += rec['transaction_amount'].gsub(/[$,]/, '').to_f}.round(2);
        new_hash
      }
    end
  end
end