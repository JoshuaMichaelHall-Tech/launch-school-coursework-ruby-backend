## HTML Input Sanitation
#### Manual
In Rack a method called `Rack::Utils.escape_html` allows us to sanitize form input.

It can sometimes be useful to create a nice view helper for it:

```ruby
helpers do
  def h(content)
    Rack::Utils.escape_html(content)
  end
end
```

This can be used in a view template like so:

```markup
<h3><%=h todo[:name] %></h3>
```

#### Automatic
To enable this in your Sinatra application, add the following code to `todo.rb`:

```ruby
configure do
  set :erb, :escape_html => true
end
```

Now all the code in our site is being escaped! We must replace the use of
```html
"&#60;&#37;&#61; with &#60;&#37;&#61;&#61;"
angle_percent_equal with angle_percent_equal_equal
```
