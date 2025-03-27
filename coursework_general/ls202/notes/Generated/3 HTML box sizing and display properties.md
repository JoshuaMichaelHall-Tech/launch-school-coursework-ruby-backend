Box Sizing:
The box-sizing property determines how the total width and height of an element is calculated. There are two main values:

1. content-box (default):
- Width/height only includes the content
- Padding and border are added EXTRA to the specified width/height
```css
.content-box {
    box-sizing: content-box;
    width: 100px; /* Only content is 100px */
    padding: 10px;
    /* Total width = 120px (100px + 10px padding on each side) */
}
```

2. border-box:
- Width/height includes content, padding, and border
- Often preferred as it's more intuitive
```css
.border-box {
    box-sizing: border-box;
    width: 100px; /* Total width is 100px */
    padding: 10px;
    /* Content width = 80px (100px - 10px padding on each side) */
}
```

Display Property:
The display property controls how an element is rendered in the layout. Here are the most common values:

1. block:
- Takes full width available
- Starts on a new line
- Can set width/height
- Examples: `<div>`, `<p>`, `<h1>`

```css
.block {
    display: block;
    width: 50%; /* Works */
    height: 100px; /* Works */
}
```

2. inline:
- Takes only necessary width
- Flows with text
- Cannot set width/height
- Examples: `<span>`, `<a>`
```css
.inline {
    display: inline;
    width: 100px; /* Won't work */
    height: 100px; /* Won't work */
}
```

1. inline-block:
- Flows with text
- Can set width/height
- Best of both worlds
```css
.inline-block {
    display: inline-block;
    width: 100px; /* Works */
    height: 100px; /* Works */
}
```

2. flex:
- Creates a flex container
- Enables powerful alignment and distribution of space
```css
.flex-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}
```

3. grid:
- Creates a grid container
- Enables layout in two dimensions
```css
.grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}
```

4. none:
- Removes the element from the layout
- Element becomes invisible and takes no space
```css
.hidden {
    display: none;
}
```
