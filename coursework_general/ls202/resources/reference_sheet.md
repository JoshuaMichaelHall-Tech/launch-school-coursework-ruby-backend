# LS202: HTML and CSS - Reference Sheet

## HTML Document Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Content goes here -->
</body>
</html>
```

## Common HTML Elements

### Text Elements

```html
<!-- Headings -->
<h1>Main Heading</h1>
<h2>Subheading</h2>
<h3>Sub-subheading</h3>
<!-- h4, h5, h6 also available -->

<!-- Paragraph -->
<p>This is a paragraph of text.</p>

<!-- Text formatting -->
<strong>Bold text</strong>
<em>Italic text</em>
<mark>Highlighted text</mark>
<code>Inline code</code>
<pre>Preformatted text
  with whitespace preserved</pre>
<small>Smaller text</small>
<sub>Subscript</sub>
<sup>Superscript</sup>
<br> <!-- Line break -->
<hr> <!-- Horizontal rule -->

<!-- Lists -->
<ul>
  <li>Unordered list item</li>
  <li>Another item</li>
</ul>

<ol>
  <li>Ordered list item</li>
  <li>Another item</li>
</ol>

<dl>
  <dt>Definition term</dt>
  <dd>Definition description</dd>
</dl>
```

### Links and Media

```html
<!-- Links -->
<a href="https://example.com">Link text</a>
<a href="page.html">Relative link</a>
<a href="#section-id">Link to page section</a>
<a href="mailto:example@example.com">Email link</a>
<a href="tel:+1234567890">Phone link</a>

<!-- Images -->
<img src="image.jpg" alt="Image description">
<img src="image.jpg" alt="Image description" width="300" height="200">

<!-- Figure with caption -->
<figure>
  <img src="image.jpg" alt="Image description">
  <figcaption>Caption text</figcaption>
</figure>

<!-- Audio -->
<audio controls>
  <source src="audio.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>

<!-- Video -->
<video width="320" height="240" controls>
  <source src="video.mp4" type="video/mp4">
  Your browser does not support the video element.
</video>
```

### Semantic Structure Elements

```html
<header>
  <!-- Site or section header -->
</header>

<nav>
  <!-- Navigation links -->
</nav>

<main>
  <!-- Main content -->
  
  <section>
    <!-- Thematic grouping of content -->
  </section>
  
  <article>
    <!-- Self-contained content -->
  </article>
  
  <aside>
    <!-- Tangentially related content -->
  </aside>
</main>

<footer>
  <!-- Site or section footer -->
</footer>
```

### Tables

```html
<table>
  <caption>Table caption</caption>
  <thead>
    <tr>
      <th>Header 1</th>
      <th>Header 2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Row 1, Cell 1</td>
      <td>Row 1, Cell 2</td>
    </tr>
    <tr>
      <td>Row 2, Cell 1</td>
      <td>Row 2, Cell 2</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Footer 1</td>
      <td>Footer 2</td>
    </tr>
  </tfoot>
</table>
```

### Forms

```html
<form action="/submit" method="post">
  <!-- Text input -->
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" placeholder="Your name">
  
  <!-- Email input -->
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  
  <!-- Password input -->
  <label for="password">Password:</label>
  <input type="password" id="password" name="password">
  
  <!-- Checkbox -->
  <input type="checkbox" id="subscribe" name="subscribe" value="yes">
  <label for="subscribe">Subscribe to newsletter</label>
  
  <!-- Radio buttons -->
  <fieldset>
    <legend>Choose an option:</legend>
    <input type="radio" id="option1" name="option" value="option1">
    <label for="option1">Option 1</label>
    <input type="radio" id="option2" name="option" value="option2">
    <label for="option2">Option 2</label>
  </fieldset>
  
  <!-- Select dropdown -->
  <label for="country">Country:</label>
  <select id="country" name="country">
    <option value="">Select a country</option>
    <option value="us">United States</option>
    <option value="ca">Canada</option>
  </select>
  
  <!-- Textarea -->
  <label for="message">Message:</label>
  <textarea id="message" name="message" rows="4" cols="50"></textarea>
  
  <!-- Buttons -->
  <button type="submit">Submit</button>
  <button type="reset">Reset</button>
</form>
```

## CSS Selectors

```css
/* Type selector */
p {
  color: blue;
}

/* Class selector */
.container {
  width: 80%;
}

/* ID selector */
#header {
  background-color: #333;
}

/* Descendant selector */
article p {
  font-size: 16px;
}

/* Child selector */
ul > li {
  list-style-type: square;
}

/* Adjacent sibling selector */
h1 + p {
  font-weight: bold;
}

/* Attribute selector */
input[type="text"] {
  border: 1px solid #999;
}

/* Pseudo-class */
a:hover {
  text-decoration: none;
}

/* Pseudo-element */
p::first-line {
  font-weight: bold;
}

/* Multiple selectors */
h1, h2, h3 {
  font-family: Arial, sans-serif;
}
```

## CSS Box Model

```css
.box {
  /* Content dimensions */
  width: 300px;
  height: 200px;
  
  /* Padding (inner spacing) */
  padding-top: 10px;
  padding-right: 20px;
  padding-bottom: 10px;
  padding-left: 20px;
  /* Shorthand: */
  padding: 10px 20px; /* top/bottom, left/right */
  padding: 10px 20px 15px 25px; /* top, right, bottom, left */
  
  /* Border */
  border-width: 1px;
  border-style: solid;
  border-color: #333;
  /* Shorthand: */
  border: 1px solid #333;
  border-radius: 5px; /* rounded corners */
  
  /* Margin (outer spacing) */
  margin-top: 10px;
  margin-right: 20px;
  margin-bottom: 10px;
  margin-left: 20px;
  /* Shorthand: */
  margin: 10px 20px; /* top/bottom, left/right */
  margin: 10px 20px 15px 25px; /* top, right, bottom, left */
  margin: 0 auto; /* center horizontally */
  
  /* Box-sizing */
  box-sizing: border-box; /* width and height include padding and border */
}
```

## CSS Layout

```css
/* Display property */
.element {
  display: block; /* default for div, p, h1, etc. */
  display: inline; /* default for span, a, etc. */
  display: inline-block; /* behaves like inline but accepts width/height */
  display: none; /* hides the element */
  display: flex; /* creates a flex container */
  display: grid; /* creates a grid container */
}

/* Position property */
.element {
  position: static; /* default - normal flow */
  position: relative; /* positioned relative to normal position */
  position: absolute; /* positioned relative to nearest positioned ancestor */
  position: fixed; /* positioned relative to viewport */
  position: sticky; /* positioned based on scroll position */
  
  top: 10px;
  right: 20px;
  bottom: 30px;
  left: 40px;
  z-index: 10; /* controls stacking order */
}

/* Float property */
.element {
  float: left; /* floats to the left */
  float: right; /* floats to the right */
  float: none; /* default */
}

/* Clear property */
.element {
  clear: left; /* no floating elements allowed on the left side */
  clear: right; /* no floating elements allowed on the right side */
  clear: both; /* no floating elements allowed on either side */
}

/* Flexbox */
.container {
  display: flex;
  flex-direction: row; /* horizontal (default) */
  flex-direction: column; /* vertical */
  flex-wrap: wrap; /* allows items to wrap onto multiple lines */
  justify-content: space-between; /* horizontal alignment */
  align-items: center; /* vertical alignment */
  gap: 20px; /* spacing between items */
}

.item {
  flex: 1; /* flex-grow, flex-shrink, and flex-basis combined */
  align-self: flex-start; /* override alignment for specific item */
}

/* Grid */
.container {
  display: grid;
  grid-template-columns: 200px 1fr 2fr; /* three columns */
  grid-template-rows: 100px auto; /* two rows */
  grid-gap: 20px; /* spacing between grid cells */
}

.item {
  grid-column: 1 / 3; /* span from column line 1 to line 3 */
  grid-row: 2 / 3; /* span from row line 2 to line 3 */
}
```

## Responsive Design

```css
/* Media queries */
@media screen and (max-width: 768px) {
  /* Styles for screens up to 768px wide */
  .container {
    width: 100%;
  }
}

@media screen and (min-width: 769px) and (max-width: 1200px) {
  /* Styles for screens between 769px and 1200px wide */
  .container {
    width: 80%;
  }
}

@media screen and (min-width: 1201px) {
  /* Styles for screens wider than 1200px */
  .container {
    width: 1200px;
  }
}

/* Responsive typography */
html {
  font-size: 16px; /* Base font size */
}

h1 {
  font-size: 2rem; /* 32px */
}

@media screen and (max-width: 768px) {
  html {
    font-size: 14px; /* Smaller base font size on mobile */
  }
}

/* Responsive images */
img {
  max-width: 100%;
  height: auto;
}
```

## Typography and Colors

```css
/* Font properties */
body {
  font-family: Arial, Helvetica, sans-serif; /* font stack */
  font-size: 16px;
  font-weight: normal; /* or bold, 400, 700, etc. */
  font-style: normal; /* or italic, oblique */
  line-height: 1.5;
  text-align: left; /* or center, right, justify */
  text-decoration: none; /* or underline, line-through */
  text-transform: none; /* or uppercase, lowercase, capitalize */
  letter-spacing: normal; /* or specific value like 0.1em */
  word-spacing: normal; /* or specific value like 0.2em */
}

/* Color values */
.element {
  /* Named colors */
  color: black;
  background-color: white;
  
  /* Hexadecimal */
  color: #000000; /* black */
  color: #000; /* shorthand */
  
  /* RGB */
  color: rgb(0, 0, 0); /* black */
  color: rgba(0, 0, 0, 0.5); /* black with 50% opacity */
  
  /* HSL */
  color: hsl(0, 0%, 0%); /* black */
  color: hsla(0, 0%, 0%, 0.5); /* black with 50% opacity */
}
```

## CSS Units

```css
.element {
  /* Absolute units */
  width: 100px;
  height: 2in;
  margin: 1cm;
  padding: 10pt;
  
  /* Relative units */
  width: 50%; /* relative to parent */
  font-size: 1.5em; /* relative to parent font-size */
  margin: 2rem; /* relative to root font-size */
  padding: 2vh; /* 2% of viewport height */
  width: 80vw; /* 80% of viewport width */
}
```
