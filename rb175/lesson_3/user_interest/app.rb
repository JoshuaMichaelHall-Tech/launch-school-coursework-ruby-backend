require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"
require "yaml"
require "Psych"

before do
  @user_arr = Psych.load_file("users.yaml")
  @names = @user_arr.keys
  @total_interests = count_interests
end

def count_interests
  total = 0
  @user_arr.each do |username, user_data|
    total += user_data[:interests].count
  end
  total
end

get "/" do
  redirect "/list"
end

get "/list" do
  @title = "Current Users"
  erb :list
end

get "/:name" do
  name_sym = params[:name].to_sym
  @user = @user_arr[name_sym]
  
  if @user
    @title = "Profile for #{params[:name]}"
    erb :user
  else
    status 404
    "User not found"
  end
end