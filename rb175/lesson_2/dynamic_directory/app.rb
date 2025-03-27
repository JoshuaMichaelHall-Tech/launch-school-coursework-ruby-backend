require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

get "/" do
  @files = Dir.glob("public/*").map { |path| path.split("/").last }.sort
  @files.reverse! if params[:sort] == "desc"    
  erb :directory
end
