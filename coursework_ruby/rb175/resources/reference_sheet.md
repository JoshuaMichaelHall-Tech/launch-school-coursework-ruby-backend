# RB175: Networked Applications - Reference Sheet

## Basic Rack Application

```ruby
# config.ru
require_relative 'app'
run App.new

# app.rb
class App
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello World"]]
  end
end
```

```bash
# Running a Rack application
bundle exec rackup config.ru -p 9595

# Testing with curl
curl -X GET localhost:9595 -m 30 -v
```

## Basic TCP Server in Ruby

```ruby
# server.rb
require "socket"

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept
  request_line = client.gets
  puts request_line
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html><body><h1>Hello World</h1></body></html>"
  
  client.close
end
```

## HTTP Request Parsing

```ruby
def parse_request(request_line)
  http_method, path_and_params, http = request_line.split(" ")
  path, params = path_and_params.split("?")

  params = (params || '').split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

# Usage
request_line = "GET /path?name=value&another=param HTTP/1.1"
http_method, path, params = parse_request(request_line)
```

## Sinatra Application

```ruby
# app.rb
require "sinatra"
require "sinatra/reloader" if development?

# Basic route
get "/" do
  "Hello, World!"
end

# Route with parameters
get "/hello/:name" do
  "Hello, #{params['name']}!"
end

# Post route
post "/submit" do
  # Process form submission
  redirect "/"
end

# Using templates
get "/about" do
  @title = "About Page"
  erb :about
end

# Error handling
not_found do
  status 404
  erb :not_found
end
```

## ERB Templates

```erb
<!-- views/layout.erb -->
<!DOCTYPE html>
<html>
  <head>
    <title><%= @title || "My App" %></title>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

<!-- views/about.erb -->
<h1>About Us</h1>
<p>This is a simple Sinatra application.</p>

<!-- Conditional in ERB -->
<% if @user %>
  <p>Welcome, <%= @user %>!</p>
<% else %>
  <p>Please log in.</p>
<% end %>

<!-- Loop in ERB -->
<ul>
  <% @items.each do |item| %>
    <li><%= item %></li>
  <% end %>
</ul>
```

## Session and State Management

```ruby
# Enable sessions in Sinatra
configure do
  enable :sessions
  set :session_secret, 'secret'
end

# Using sessions
get "/login" do
  session[:user_id] = params[:id]
  redirect "/"
end

get "/profile" do
  if session[:user_id]
    @user = find_user(session[:user_id])
    erb :profile
  else
    redirect "/login"
  end
end

# Using flash messages
get "/new" do
  erb :new
end

post "/create" do
  # Process form
  session[:message] = "Item created successfully."
  redirect "/"
end

get "/" do
  @message = session.delete(:message)
  erb :index
end
```

## Form Handling

```erb
<!-- GET form -->
<form action="/search" method="get">
  <input type="text" name="query">
  <button type="submit">Search</button>
</form>

<!-- POST form -->
<form action="/users" method="post">
  <input type="text" name="username">
  <input type="password" name="password">
  <button type="submit">Register</button>
</form>
```

```ruby
# Handling form submission
post "/users" do
  username = params[:username]
  password = params[:password]
  
  # Validate input
  if username.empty? || password.empty?
    session[:message] = "Username and password are required."
    redirect "/users/new"
  else
    # Create user and redirect
    create_user(username, password)
    session[:message] = "User created successfully."
    redirect "/"
  end
end
```

## File Handling

```ruby
# Reading file content
get "/document/:name" do
  file_path = File.join(data_path, params[:name])
  
  if File.exist?(file_path)
    content = File.read(file_path)
    case File.extname(file_path)
    when ".txt"
      content_type 'text/plain'
    when ".md"
      content_type 'text/html'
      content = render_markdown(content)
    else
      content_type 'text/plain'
    end
    content
  else
    session[:message] = "#{params[:name]} does not exist."
    redirect "/"
  end
end

# File upload handling
post "/upload" do
  if params[:file] && params[:file][:filename]
    filename = params[:file][:filename]
    file = params[:file][:tempfile]
    
    File.open(File.join(data_path, filename), 'wb') do |f|
      f.write(file.read)
    end
    
    session[:message] = "#{filename} was uploaded."
    redirect "/"
  else
    session[:message] = "No file selected."
    redirect "/upload"
  end
end
```

## Security - Input Sanitization

```ruby
# Helper method for HTML escaping
helpers do
  def h(content)
    Rack::Utils.escape_html(content)
  end
end

# In template
<h1><%=h @user_provided_content %></h1>

# Automatic HTML escaping in Sinatra
configure do
  set :erb, :escape_html => true
end
```

## Deployment to Heroku

```ruby
# Gemfile
source "https://rubygems.org"
ruby "3.0.0"

gem "sinatra"
gem "sinatra-contrib"
gem "erubis"

group :production do
  gem "puma"
end
```

```bash
# Procfile
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
```

```bash
# Terminal commands
heroku create app_name
bundle lock --add-platform x86_64-linux  # For Mac/Windows users
git push heroku main
```
