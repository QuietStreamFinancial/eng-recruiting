require 'sinatra'
require 'sinatra/reloader'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080

get '/' do
  # Your implementation goes here
  erb :table
end