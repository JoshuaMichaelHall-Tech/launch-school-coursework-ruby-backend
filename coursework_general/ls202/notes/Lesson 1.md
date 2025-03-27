### Where to find help:
- search engine with `mdn` or `w3c`
- [Mozilla Developer Network](https://developer.mozilla.org/), or **MDN**
- [W3C](http://www.w3.org/), the World Wide Web Consortium
- Web Hypertext Application Technology Working Group, [WHATWG](https://whatwg.org/)
	- [HTML Standard](https://html.spec.whatwg.org/multipage/) 
	- [DOM Standard](https://dom.spec.whatwg.org/)

HTML(HyperText Markup Language): provides the structure and content of a web page
CSS(Cascading Style Sheets): describes the appearance, or presentation, of the page

CSS: 
- 3 ways to use: inline, internal, external
- 3 basic selectors: tag, id, and class
- 4 basic properties: `color`, `background-color`, `font-family`, and `font-size`

Inspector: part of browser used to inspect html/css

Validators:
-  [W3C's HTML Validator](https://validator.w3.org/#validate_by_input)
- [W3C's CSS Validator](https://jigsaw.w3.org/css-validator/#validate_by_input)

Linters: detect poor indentation and formatting as well as failures to follow best practices.

  
![HTML Syntax Outline](https://learn.shayhowe.com/assets/images/courses/html-css/building-your-first-web-page/html-syntax-outline.png)

Tags: opening and closing angle brackets surrounding an element name. Opening tags begin an element (e.g. `<a>`), while closing tags end an element (e.g. </a>)

	Elements: designators that define the structure and content of objects within a page. Most elements require both an opening and a closing element E.G. `<h1>` `</h1>`, `<p>` `</l>`, `<div>` `</div>`. However, some are self-closing E.G. `<br>`, `<img>`, `<source>`

Attributes: properties used to provide additional information about an element. E.G. the `href="http://shayhowe.com/"` in `<a href="http://shayhowe.com/">Shay Howe</a>`

#### HTML Required Elements
`<!DOCTYPE html>`, `<html>`, `<head>`, and `<body>`

```HTML
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Hello World</title>
  </head>
  <body>
    <h1>Hello World</h1>
    <p>This is a web page.</p>
  </body>
</html>
```

#### CSS Terms
Selectors: designates element(s) within html to target and apply styles.
```CSS
p { ... }
```

Properties: determines the styles that will be applied to a selected element.
```CSS
p {
  color: ...;
  font-size: ...;
}
```

Values: used to determine the behavior of a corresponding property to a selected element.
```CSS
p {
  color: orange;
  font-size: 16px;
}
```
![CSS Syntax Outline](https://learn.shayhowe.com/assets/images/courses/html-css/building-your-first-web-page/css-syntax-outline.png)


#### Types of Selectors
Type: target elements by their type.
```CSS
div { ... }
```

```HTML
<div>...</div>          
<div>...</div>
```

Class: target elements by their class. More precise than type selectors.
```CSS
.awesome { ... }
```

```HTML
<div class="awesome">...</div>
<p class="awesome">...</p>
```

ID: target selectors by their id. More precise than class selectors.
```CSS
#shayhowe { ... }
```

```HTML
<div id="shayhowe">...</div>
```

See additional selectors here: [advanced selectors](https://learn.shayhowe.com/advanced-html-css/complex-selectors/)

#### Using external CSS
1. Create `.css` file.
2. Reference the file from within the `.html` file:

```HTML
<head>
  <link rel="stylesheet" href="main.css">
</head>
```

`link` defines relationship between HTML doc and CSS file.
`rel="stylesheet"` specifies the relationship.
`href="main.css"` identifies the location of the file.

#### CSS Resets
Since all browsers have their own native styles, we use CSS resets to make our sites render the same in all browsers.

Resets must be at the top of the CSS style sheet since sheets are cascading, that is, they are read top to bottom with later settings overriding earlier conflicting settings.

One popular reset:  [Eric Meyer’s reset](http://meyerweb.com/eric/tools/css/reset/)
A more advanced reset: [Normalize.css](http://necolas.github.io/normalize.css/)

#### Semantics
Semantics within HTML is the practice of giving content on the page meaning and structure by using the proper element. Semantic code describes value.

<div> and <span> have no semantic value.

#### Block vs. Inline Elements
Block begin on a new line, stack on top of each other.
Inline fall in normal flow of a document, only maintain width of their content.

#### Div vs. Span
<div>
- block level
- large groupings of text

<span>
- inline level
- small groupings of text

#### Comments
HTML: <!-- comment -->
CSS: /* comment */*

#### Tags
<h1> to <h6> are headings
<p> is paragraph
<strong> semantically strong importance, generally rendered as bold
<b> subtle semantic meaning, rendered as bold
<em> semantically stressed emphasis, generally rendered as italic
<i> subtle semantic meaning, rendered as italic
<a> anchor, used with hyperlinks

<head> not displayed on page, outlines metadata, including doc title and links, falls directly in HTML element.

##### Structure
<header> identify top of page, article, section, etc.; may include heading, introductory text, navigation.
<nav> section of major navigational links
<article> section of independent, self-contained content
<section> thematic grouping of content, generally including a heading
<aside> tangentially related content such as sidebars, inserts, brief explanations
<footer> closing or end of page, article, or section

#### Encoding
Special characters must be encoded. For reference, a long list of character encodings may be found at [Copy Paste Character](http://copypastecharacter.com/).

#### Attributes
```html
<a href="another_page.html">Next page</a>
```
In this code, `href` is an attribute of the `<a>` tag, and it has the value `another_page.html`.

#### Hyperlinks
<a href="http://shayhowe.com">Shay</a>
Can wrap images, text, etc. 
To link to email address, <a href="mailto:shay@awesome.com?subject=Reaching%20Out&body=How%20are%20you">Email Me</a>
To open in new window use `target="_blank"`: <a href="http://shayhowe.com/" target="_blank">Shay Howe</a>
To link to part of same page: 
```
<body id="top">

  <a href="#top">Back to top</a>

</body>
```

### CSS
Because it cascades, later settings override earlier settings when weights are the same.

#### Weight
The type selector has the lowest specificity weight and holds a point value of `0-0-1`. The class selector has a medium specificity weight and holds a point value of `0-1-0`. Lastly, the ID selector has a high specificity weight and holds a point value of `1-0-0`.

By combining selectors we can be more specific about which element or group of elements we’d like to select. 

###### HTML

```
<div class="hotdog">
  <p>...</p>
  <p>...</p>
  <p class="mustard">...</p>
</div>

```

###### CSS

```
.hotdog p {
  background: brown;
}
.hotdog p.mustard {
  background: yellow;
}
```

Prefer modularity over layered specificity. The more complicated the weight calcs, the greater chance of breaking the code.

#### Common CSS Properties
Colors
- Four ways to represent sRGB colors within CSS: keywords, hexadecimal notation, and RGB and HSL values.
- Names: http://www.w3.org/TR/css3-color/
|  Color     |  Name     |  Hex Values   |  RGB Values.    |  HSL Values           |
        |  `black`  |  `#000000`  |  `rgb(0, 0, 0)`  |  `hsl(0, 0%, 0%)`  |

Lengths
- Absolute 
	- Pixels: 1/96 inch; `font-size: 14px;`
- Relative
	- Percentages; `width: 50%;`
	- Em: 1 = element font size; `font-size: 14px; width: 5em;`

### Classes, IDs, Names
<input type="submit" name="save" id="save-button" class="default-button">

#### Classes
- Assign class(es) to element
- Many elements can belong to the same class
- When assigning multiple classes to the same element, separate with a space: `class="executive management full-time"`
- Class names should have semantic meaning
- Use CSS class selectors to select elements by class (.classname)
- Lower specificity than ID

#### IDs
- Must be unique to page
- Use `id` attribute to assign
- Elements can have 1 or more
- Use semantic names
- CSS ID selectors: ` #idname`
- Override class selectors

#### Names
- Tie form elements to data on server
- Use `name` attribute to assign a name to a form data element the server can use to obtain the value
- Should be unique or assigned to a single group
- Do NOT use semantic names, but rather descriptive names
- Not selectable in CSS

