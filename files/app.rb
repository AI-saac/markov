require 'bundler/setup'
require 'sinatra'

require 'haml'
require 'sass'
require 'coffee-script'

set :bind, '0.0.0.0'

get '/' do
  @mes = 'Hello!'
  haml :index
end
