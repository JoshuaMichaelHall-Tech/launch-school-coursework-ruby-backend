## Core Concepts

### The Box Model
Every HTML element is represented as a rectangular box with the following properties:
- Content width and height
- Padding (inner spacing)
- Border
- Margin (outer spacing)

### Visual Display Models
Elements can have different display behaviors:
- **Block**: Takes full width, starts on new line
- **Inline**: Takes only needed width, flows with text
- **Inline-block**: Combines features of both

### Box Sizing Models
Two ways browsers calculate element dimensions:
- **content-box**: Width/height applies to content only
- **border-box**: Width/height includes padding and border

## Detailed Properties

### Box Properties
1. **Width and Height**
   - Define the content dimensions
   - Can use various units (px, em, rem, %, auto)

2. **Padding**
   - Space between content and border
   - Individual properties: padding-top, padding-right, padding-bottom, padding-left
   - Shorthand: padding: 10px 20px 10px 20px (top, right, bottom, left)

3. **Border**
   - Line between padding and margin
   - Properties include width, style, and color
   - Example: border: 1px solid black

4. **Margin**
   - Space outside the border
   - Individual properties like padding
   - Use margin: auto for horizontal centering

### Dimensions

#### Absolute Units
- **px**: CSS reference pixels (not always same as physical pixels)
- Physical pixels: Actual screen pixels (varies by device)

#### Relative Units
- **em**: Relative to parent element's font size
- **rem**: Relative to root element's font size
- **%**: Percentage of parent element's size
- **auto**: Browser determines appropriate size

## Important CSS Properties to Master

### display
Controls how an element is displayed in the document flow
```css
/* Common values */
display: block;        /* Takes full width, starts new line */
display: inline;       /* Flows with text, ignores width/height */
display: inline-block; /* Flows with text, respects width/height */
display: none;         /* Removes element from document flow */
```

### box-sizing
Determines how width and height are calculated
```css
/* Default - width/height only includes content */
box-sizing: content-box;

/* Width/height includes padding and border */
box-sizing: border-box;
```

### width & height
Define element dimensions
```css
/* Absolute units */
width: 300px;
height: 200px;

/* Relative units */
width: 50%;
height: 20rem;

/* Special values */
width: auto;
height: min-content;
```

### padding
Space between content and border
```css
/* Individual sides */
padding-top: 10px;
padding-right: 20px;
padding-bottom: 10px;
padding-left: 20px;

/* Shorthand - all sides */
padding: 10px;

/* Shorthand - vertical | horizontal */
padding: 10px 20px;

/* Shorthand - top | horizontal | bottom */
padding: 10px 20px 15px;

/* Shorthand - top | right | bottom | left */
padding: 10px 20px 15px 25px;
```

### border
Line between padding and margin
```css
/* Individual properties */
border-width: 2px;
border-style: solid;
border-color: #333;

/* Shorthand */
border: 2px solid #333;

/* Single side */
border-top: 1px dashed #999;

/* Rounded corners */
border-radius: 5px;
```

### margin
Space outside the border
```css
/* Individual sides */
margin-top: 10px;
margin-right: 20px;
margin-bottom: 10px;
margin-left: 20px;

/* Shorthand - same patterns as padding */
margin: 10px;
margin: 10px 20px;
margin: 10px auto; /* Center horizontally */

/* Negative margins */
margin-top: -10px; /* Pull element up */

/* Collapse adjacent margins */
margin: 20px 0; /* Vertical margins collapse */
```

## Key Points to Remember

### Display Models
- Containers typically use `block` display
- Non-containers typically use `inline` display
- Display property can override default behavior
- Reference MDN for specific element defaults

### Box Sizing Best Practices
- `border-box` often preferred for predictable sizing
- Can be set globally or per element
- Affects how width/height properties are calculated

### Working with Dimensions
- Consider device compatibility when using pixels
- Relative units provide better flexibility
- Use `auto` margins for horizontal centering
- Mix units appropriately for different scenarios

### HTML Considerations
- No need to memorize default display values
- Focus on understanding how to modify as needed
- Check documentation for specific elements

## Tips for Development
1. Use browser developer tools to inspect box model
2. Start with `border-box` sizing for consistency
3. Consider mobile devices when choosing units
4. Use shorthand properties for efficient coding
5. Remember margin collapsing between elements