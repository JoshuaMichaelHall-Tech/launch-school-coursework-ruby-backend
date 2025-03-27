Need:
1. Gemfile with:
	1. source "https://rubygems.org"
	2. gem 'rack', '~> 2.0.1'
2. Run bundle install
3. Create rackup_file (config.ru)
	1. Application must be Ruby object responding to `call(env)`
	2. `call` must return array of 3 elements
		1. Status Code responding to .to_i
		2. Headers (key-value pairs in hash)
		3. Response Body, must respond to each yielding a string value

To start a Rack application:
```term
$ bundle exec rackup config.ru -p 9595
```
- (p is for port)
- Application defaults to port 9292

To ping the server from another terminal:
```term
curl -X GET localhost:9595 -m 30 -v
```

In browser use: [http://localhost:9595/](http://localhost:9595/)

### Routing
This is how we add additional pages to our application.

Need a new `.rb` file to store dynamic content. It does not need a `call` method.
Example:
```Ruby
# advice.rb
class Advice  
  def initialize  
    @advice_list = [  
      "Look deep into nature, and then you will understand everything better.",  
      "I have found the paradox, that if you love until it hurts, there can be no more hurt, only more love.",  
      "What we think, we become.",  
      "Love all, trust a few, do wrong to none.",  
      "Oh, my friend, it's not what they take away from you that counts. It's what you do with what you have left.",  
      "Lost time is never found again.",  
      "Nothing will work unless you do."  
    ]  
  end
  
  def generate  
    @advice_list.sample  
  end  
end
```

We use the env variable `REQUEST_PATH` and add logic to our program through a `case` method to display different content based on the path.
Example:
```Ruby
# hello_world.rbrequire_relative 'advice'     # loads advice.rb
class HelloWorld  
  def call(env)  
    case env['REQUEST_PATH']  
    when '/'  
      ['200', {"Content-Type" => 'text/plain'}, ["Hello World!"]]  
    when '/advice'  
      piece_of_advice = Advice.new.generate    # random piece of advice  
      ['200', {"Content-Type" => 'text/plain'}, [piece_of_advice]]  
    else  
      [  
        '404',  
        {"Content-Type" => 'text/plain', "Content-Length" => '13'},  
        ["404 Not Found"]  
      ]  
    end  
  end  
end
```

### Adding HTML
We can add HTML directly into our program:
```Ruby
require_relative 'advice'

class HelloWorld  
  def call(env)  
    case env['REQUEST_PATH']  
    when '/'  
      [  
        '200',  
        {"Content-Type" => 'text/html'},  
        ["<html><body><h2>Hello World!</h2></body></html>"]  
      ]  
    when '/advice'  
      piece_of_advice = Advice.new.generate  
      [  
        '200',  
        {"Content-Type" => 'text/html'},  
        ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]  
      ]  
    else  
      [  
        '404',  
        {"Content-Type" => 'text/html', "Content-Length" => '48'},  
        ["<html><body><h4>404 Not Found</h4></body></html>"]  
      ]  
    end  
  end  
end
```
Note the change in Content-Type as well as the string interpolation for `piece_of_advice`.

### View Templates
We can store and maintain code related to what we want to display in View Templates, separate files that allows us to do some pre-processing on the server side in a programming language (Ruby, Python, JavaScript, etc) and then translate programming code into a string to return to the client (usually HTML). Files end in `.erb`.

##### ERB
AKA Embedded Ruby, allows us to embed Ruby directly into HTML.
- `require 'erb'`
- Create an ERB template object and pass in a string using the special syntax that mixes Ruby with HTML.
- Invoke the ERB instance method `result`, which will give us a 100% HTML string.

ERB tags
- `<%= %>` - will evaluate the embedded Ruby code, and include its return value in the HTML output. A method invocation, for example, would be a good candidate for this tag.
- `<% %>` - will only evaluate the Ruby code, but not include the return value in the HTML output. You'd use this tag for evaluating Ruby but don't want to include its return value in the final string. A method definition, for example, would be a good use case for this tag.

Example:
```ERB
# example.erb

<% names = ['bob', 'joe', 'kim', 'jill'] %><html>  
  <body>  
    <h4>Hello, my name is <%= names.sample %></h4>  
  </body>  
</html>
```

Can be used by:
```Ruby
# example.rb

require 'erb'
template_file = File.read('example.erb')  
erb = ERB.new(template_file)  
erb.result
```

### Creating View Templates
add: views/index.erb
```ERB
<html>  
  <body>  
    <h2>Hello World!</h2>  
  </body>  
</html>
```

Now we must pass this into an `ERB` object. Here is the updated code:
```Ruby
# hello_world.rb
class HelloWorld  
  def call(env)  
    case env['REQUEST_PATH']  
    when '/'  
      template = File.read("views/index.erb")  
      content = ERB.new(template)  
      ['200', {"Content-Type" => "text/html"}, [content.result]]  
    when '/advice'  
      piece_of_advice = Advice.new.generate  
      [  
        '200',  
        {"Content-Type" => 'text/html'},  
        ["<html><body><b><em>#{piece_of_advice}</em></b></body></html>"]  
      ]  
    else  
      [  
        '404',  
        {"Content-Type" => 'text/html', "Content-Length" => '48'},  
        ["<html><body><h4>404 Not Found</h4></body></html>"]  
      ]  
    end  
  end  
end
```

### Cleaning Up
1. Move processing out of `call` into its own method.
2. Create view templates for all branches of `case`.
3. Extract reusable code to a separate framework.

Framework
```Ruby
# monroe.rb
class Monroe  
  def erb(filename, local = {})  
    b = binding  
    message = local[:message]  
    content = File.read("views/#{filename}.erb")  
    ERB.new(content).result(b)  
  end
  
  def response(status, headers, body = '')  
    body = yield if block_given?  
    [status, headers, [body]]  
  end  
end
```

Here is the final project:
```
my_framework/  
 ├── Gemfile  
 ├── Gemfile.lock  
 ├── config.ru  
 ├── app.rb  
 ├── advice.rb  
 ├── monroe.rb  
 └── views/  
        ├── index.erb  
        ├── advice.erb  
        └── not_found.erb
        
#config.ru
require_relative 'app'
run App.new
        
# advice.rb
        
class Advice  
  def initialize  
    @advice_list = [  
      "Look deep into nature, and then you will understand everything better.",  
      "I have found the paradox, that if you love until it hurts, there can be no more hurt, only more love.",  
      "What we think, we become.",  
      "Love all, trust a few, do wrong to none.",  
      "Oh, my friend, it's not what they take away from you that counts. It's what you do with what you have left.",  
      "Lost time is never found again.",  
      "Nothing will work unless you do."  
    ]  
  end
  
  def generate  
    @advice_list.sample  
  end  
end

# app.rb
require_relative 'monroe'  
require_relative 'advice'

class App < Monroe  
  def call(env)  
    case env['REQUEST_PATH']  
    when '/'  
      status = '200'  
      headers = {"Content-Type" => 'text/html'}  
      response(status, headers) do  
        erb :index  
      end  
    when '/advice'  
      status = '200'  
      headers = {"Content-Type" => 'text/html'}  
      piece_of_advice = Advice.new.generate  
      response(status, headers) do  
        erb :advice, message: piece_of_advice  
      end  
    else  
      status = '404'  
      headers = {"Content-Type" => 'text/html', "Content-Length" => '61'}  
      response(status, headers) do  
        erb :not_found  
      end  
    end  
  end  
end

# monroe.rb

class Monroe  
  def erb(filename, local = {})  
    b = binding  
    message = local[:message]  
    content = File.read("views/#{filename}.erb")  
    ERB.new(content).result(b)  
  end
  
  def response(status, headers, body = '')  
    body = yield if block_given?  
    [status, headers, [body]]  
  end  
end
```
#### The View Templates

`views/index.erb`

```
<html>  
  <body>  
    <h2> Hello World!</h2>  
  </body>  
</html>
```

`views/advice.erb`

```
<html>  
  <body>  
    <p><em><%= message %></em></p>  
  </body>  
</html>
```

`views/not_found.erb`

```
<html>  
  <body>  
    <h2>404 Not Found</h2>  
  </body>  
</html>
```
