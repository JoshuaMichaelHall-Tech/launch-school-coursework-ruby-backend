Sinatra makes it easy to write Ruby code that runs when a user visits a particular URL.

```Ruby
require "sinatra"
require "sinatra/reloader"
```

`reloader` causes the application to reload every time we load a page.

In Sinatra, the `get` command takes an argument and a block and returns the block when that argument is matched:
```Ruby
get "/" do 
  File.read "public/template.html" 
end
```

NOTE:
The `::read` method is a class method of the `IO` class, and is available to `File` since it inherits from `IO`. Calling `File.read` opens the specified file and returns its contents as a string.

You don't need to know too much about the `IO` and `File` classes for the purposes of this course, but you may find it useful to briefly refer to the documentation for the [IO::read](https://docs.ruby-lang.org/en/3.2/IO.html#method-c-read) and [IO::readlines](https://docs.ruby-lang.org/en/3.2/IO.html#method-c-readlines) methods at certain points during this lesson. If you would like to learn more about the `File` class, you can do so [here](https://launchschool.com/gists/630c1024).


