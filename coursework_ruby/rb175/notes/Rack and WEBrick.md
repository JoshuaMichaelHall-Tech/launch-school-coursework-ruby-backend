### WEBrick
Ruby web server.
To install add to `Gemfile`:  `gem 'webrick'` && `gem 'rackup'`
Replaces TCP server

### Rack
https://aumi9292.medium.com/rack-part-i-6bb268dde211
![[Pasted image 20250117134521.png]]
Rubygem that provides an interface for Ruby web application and the application server being used.
- Takes plain text from client and formats into Ruby data structures for use by Ruby program or framework
- Takes return value of Ruby program and formats it for HTML
![[Pasted image 20250117134756.png]]

- Rack uses a rackup `config.ru` file.
- Use rackup instead of rack.
- In ruby program at top: `require 'rackup'`
- In Ruby program call `Rack::Handler::WEBrick::run`
#### Rack specs for Application
- Must define a `call` method.
	- `call` must be defined to take one parameter, often called `env`.
	- `call` must return an `Array` object with three items: 1) a `String` or `Integer` object that represents a status code, 2) a `Hash` object that holds `key-value` pairs of content headers and their values, and 3) an object that responds to `Enumerable#each` and holds the body of the response.

#### Middleware
Rack allows you to chain Rack-based classes together. You can write your own Rack-based applications to chain to your primary application, or you can use some of the [many](https://github.com/rack/rack/wiki/List-of-Middleware) middleware applications that Rack includes in its library.
![[Pasted image 20250117135904.png]]
```ruby
#myapp.rb  
_#require 'rackup'
class MyApp  
  def call(env)  
    ['200', { "Content-Type" => "text/plain" }, ["hello world"]]  
  end  
end

class FriendlyGreeting  
  def initialize(app)  
    @app = app  
  end
  
  def call(env)  
    body = @app.call(env).last
    [  
      '200',   
      { "Content-Type" => "text/plain" },   
      body.prepend()"A warm welcome to you!\n")  
    ]  
  end  
end

class Wave  
  def initialize(app)  
    @app = app  
  end
  
  def call(env)  
    body = @app.call(env).last
    [  
       '200',   
       { "Content-Type" => "text/plain" },   
       body.prepend("Wave from afar!\n")  
    ]  
  end   
end
```

```ruby
#config.ru  
require_relative "myapp"
use Wave  
use FriendlyGreeting
run MyApp.new
```

From article:
**Rack …**

- **Abstracts low-level tasks** like parsing information from `HTTP` requests and formatting the return value of your application back into an `HTTP` response that the server can understand. Applications can then be fully focused on business logic .
- **Generalizes application-to-server communication**. Rack-based apps — whether they’re written using Ruby, Sinatra, Rails, or another framework — can establish socket connections using any Rack-supported servers, whether that’s WEBrick, Puma, Passenger, etc..
- **Provides an architecture for using modular pieces of functionality**. Rack middlewares give the web developer a low-level opportunity to implement all kinds of functionalities by creating a middleware stack of chained Rack-based applications as part of the their application.

