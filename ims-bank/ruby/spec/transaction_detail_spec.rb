require 'rspec'
require 'json'
require_relative '../lib/transaction_detail'

describe TransactionDetail do
 describe '#some_method' do
   it 'returns the expected result' do
     result = TransactionDetail.call
     expect(result.first.keys).to eq([:name, :account_type, :balance])
     expect(result.first.values).to eq(["Maribelle Rillett", "savings", -93.99])
   end
 end
end
