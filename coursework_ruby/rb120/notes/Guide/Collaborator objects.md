### Definition
Use of one object within another.

### Implementation


### Benefits


### Code Snippets

```ruby
class Missouri_Properties
  def initialize
    @portfolio = []
  end
end

class House
  # Some code
end

hall_properties = Missouri_properties.new
eureka_gardens = House.new
hall_properties.portfolio << eureka_gardens 
# eureka_gardens is now a collaborator object in hall_properties
```