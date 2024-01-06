require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/transaction_detail'


set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  @account_details = TransactionDetail.call

  erb :table
end
