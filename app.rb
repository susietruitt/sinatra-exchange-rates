require "sinatra"
require "sinatra/reloader"
@er_key = ENV.fetch("ERKEY")

#api_url = "https://api.exchangerate.host/list?access_key=#{ENV["ERKEY"]}"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
