require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# get '/' do # <- Router part
#   erb :index
#   # [...]   #
#   # [...]   # <- Controller part
#   # [...]   #
# end

get '/about' do
  erb :about
end

get '/team/:username' do
  # binding.pry <= code would stop here for HTTP request localhost:4567/team/someone
  puts params[:username]
  "The username is #{params[:username]}"
end

# Information:
# params can be filled from 3 places:
  # Routing parameters (like /team/:username)
  # Query string parameters (if the URL is like /search?keyword=lewagon)
  # Body from HTTP POST queries (coming from <form action="post" />)

get '/' do
  @usernames = [ 'ssaunier', 'Papillard' ]
  erb :index
end

# IP-Adress: 127.0.0.1/8
# http://127.0.0.1/8:4567
# http://172.27.139.141:4567/
# Using ngroc (sharable), run: ngrok http 4567
# starts server and returns link that can be shared
