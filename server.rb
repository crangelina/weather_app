require 'sinatra'
require 'rest-client'
require 'json'
require 'pp'



API_KEY = "db851b03376ab405ffe7718a7d199828"

get '/' do 
  erb :index
end

post '/search' do 
  pp params
  @zip = params[:zip]
  # api query with restclient
  resp = RestClient.get("http://api.openweathermap.org/data/2.5/weather?zip=#{@zip},us&appid=#{API_KEY}&units=imperial")
  # pass results into json
  data = JSON.parse(resp)
  # set instance var
  p "-" * 30 + "\n"
  pp data
  p "-" * 30 + "\n"

  @weather = data["main"]["temp"]
  @weather_class = data["weather"][0]["main"].downcase
  @id = data["weather"][0]["main"]
  erb :index
end