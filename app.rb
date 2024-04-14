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

get("/dynamic/:currency_one") do
  @er_key = ENV.fetch("ERKEY")
  @api_url = "https://api.exchangerate.host/list?access_key=#{@er_key}"
  @raw_er_data = HTTP.get(@api_url)
  @raw_er_data_string = @raw_er_data.to_s
  @parsed_er_data = JSON.parse(@raw_er_data_string)
  @currencies_array = @parsed_er_data.fetch("currencies")
  @currencies_keys = @currencies_array.keys
  @currency_one = params.fetch("currency_one")
  erb(:c_one)
end

get("/dynamic/:currency_one/:currency_two") do
  @er_key = ENV.fetch("ERKEY")
  @api_url = "https://api.exchangerate.host/list?access_key=#{@er_key}"
  @raw_er_data = HTTP.get(@api_url)
  @raw_er_data_string = @raw_er_data.to_s
  @parsed_er_data = JSON.parse(@raw_er_data_string)
  @currencies_array = @parsed_er_data.fetch("currencies")
  @currencies_keys = @currencies_array.keys
  @currency_one = params.fetch("currency_one")
  @currency_two = params.fetch("currency_two")

  @conversion_url="https://api.exchangerate.host/convert?access_key=#{@er_key}&from=#{@currency_one}&to=#{@currency_two}&amount=1"
  @raw_convert_data = HTTP.get(@conversion_url)
  @raw_convert_data_string = @raw_convert_data.to_s
  @parsed_convert_data = JSON.parse(@raw_convert_data_string)
  @result = @parsed_convert_data["result"]
  erb(:c_two)
end
