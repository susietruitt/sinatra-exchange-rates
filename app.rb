require "sinatra"
require "sinatra/reloader"
require 'http'
require 'json'
@er_key = ENV.fetch("ERKEY")

#api_url = "https://api.exchangerate.host/list?access_key=#{ENV["ERKEY"]}"


get("/") do
  @er_key = ENV.fetch("ERKEY")
  @api_url = "https://api.exchangerate.host/list?access_key=#{@er_key}"
  @raw_er_data = HTTP.get(@api_url)
  @raw_er_data_string = @raw_er_data.to_s
  @parsed_er_data = JSON.parse(@raw_er_data_string)
  @currencies_array = @parsed_er_data.fetch("currencies")
  @currencies_keys = @currencies_array.keys
  erb(:currencies)

end
