# LS202: HTML and CSS - Glossary

## HTML Fundamentals

**HTML**
: HyperText Markup Language, the standard markup language for creating web pages

**Element**
: Basic building block of HTML that usually consists of a start tag, content, and an end tag

**Tag**
: Markup that defines the start and end of an HTML element (e.g., `<p>`, `</p>`)

**Attribute**
: Additional information about an element provided in the start tag (e.g., `class`, `id`, `src`)

**DOCTYPE**
: Declaration at the beginning of HTML documents that specifies the HTML version

**Semantic HTML**
: Using HTML elements that clearly describe their meaning to both browser and developer

**Block Element**
: Element that starts on a new line and takes up the full width available (e.g., `<div>`, `<p>`, `<h1>`)

**Inline Element**
: Element that only takes up as much width as necessary and does not start on a new line (e.g., `<span>`, `<a>`, `<img>`)

**Self-closing Tag**
: Element that doesn't need a closing tag (e.g., `<img>`, `<br>`, `<input>`)

**Nesting**
: Placing elements inside other elements

**Entity**
: Special code used to display reserved characters in HTML (e.g., `&lt;` for <, `&gt;` for >)

## CSS Basics

**CSS**
: Cascading Style Sheets, a language used to describe the presentation of HTML documents

**Selector**
: Pattern that identifies which HTML elements to style

**Property**
: Styling characteristic that can be modified (e.g., `color`, `font-size`)

**Value**
: Setting for a property (e.g., `red`, `16px`)

**Declaration**
: Property-value pair in CSS (e.g., `color: blue;`)

**Rule Set**
: Selector and its declarations (e.g., `p { color: blue; }`)

**Cascade**
: Algorithm determining which styles apply when multiple rules match

**Specificity**
: Weight given to different selectors that determines which styles take precedence

**Inheritance**
: Process by which some CSS properties are passed from parent elements to their children

**Box Model**
: CSS layout model that treats each element as a box with content, padding, border, and margin

## CSS Selectors

**Type Selector**
: Selects elements by their HTML tag name (e.g., `p`, `div`)

**Class Selector**
: Selects elements with a specific class attribute (e.g., `.container`, `.btn`)

**ID Selector**
: Selects an element with a specific ID attribute (e.g., `#header`, `#nav`)

**Descendant Selector**
: Selects elements that are descendants of another element (e.g., `div p`)

**Child Selector**
: Selects elements that are direct children of another element (e.g., `ul > li`)

**Adjacent Sibling Selector**
: Selects an element that directly follows another element (e.g., `h1 + p`)

**Attribute Selector**
: Selects elements based on attribute value (e.g., `input[type="text"]`)

**Pseudo-class**
: Selector that specifies a special state of an element (e.g., `:hover`, `:focus`)

**Pseudo-element**
: Selector that targets a specific part of an element (e.g., `::first-line`, `::after`)

## Box Model and Layout

**Content**
: The actual content of the element (text, images, etc.)

**Padding**
: Space between the content and the border

**Border**
: Line that surrounds the padding

**Margin**
: Space outside the border

**Width**
: Horizontal dimension of an element's content box (by default)

**Height**
: Vertical dimension of an element's content box (by default)

**Box-sizing**
: Property that determines how width and height are calculated

**Display**
: Property that determines how an element is rendered (e.g., `block`, `inline`, `flex`)

**Position**
: Property that specifies the positioning method (e.g., `static`, `relative`, `absolute`)

**Float**
: Property that moves an element to the left or right of its container

**Flexbox**
: CSS layout module that provides a more efficient way to arrange, align, and distribute space among items

**Grid**
: Two-dimensional CSS layout system for creating complex layouts

## Units and Values

**Pixel (px)**
: Fixed unit of measurement (1/96th of an inch)

**Em (em)**
: Relative unit based on the font-size of the parent element

**Rem (rem)**
: Relative unit based on the font-size of the root element

**Percentage (%)**
: Relative unit based on the parent element's size

**Viewport Width (vw)**
: Relative unit based on 1% of the viewport width

**Viewport Height (vh)**
: Relative unit based on 1% of the viewport height

**RGB**
: Color model using red, green, and blue values (e.g., `rgb(255, 0, 0)`)

**Hexadecimal**
: Color notation using six-digit codes (e.g., `#ff0000`)

**HSL**
: Color model using hue, saturation, and lightness (e.g., `hsl(0, 100%, 50%)`)

## Responsive Design

**Media Query**
: CSS technique to apply styles based on device characteristics (e.g., screen width)

**Breakpoint**
: Point at which a media query is triggered and layout changes

**Viewport**
: Visible area of a web page in the browser window

**Mobile-first**
: Design approach that prioritizes mobile design before desktop

**Responsive Image**
: Image that adjusts its size based on screen size

**Fluid Layout**
: Layout that uses percentage-based widths to adapt to screen size

## Forms and Interactive Elements

**Form**
: Element used to collect user input

**Input**
: Form control that allows various types of user input

**Label**
: Element that identifies a form control

**Fieldset**
: Element used to group related form controls

**Legend**
: Caption for a fieldset element

**Submit**
: Button that sends form data to the server

**Validation**
: Process of checking form data for correctness

**Placeholder**
: Hint text displayed in a form control before user input

## Accessibility

**ARIA**
: Accessible Rich Internet Applications, a set of attributes for accessibility

**Alt Text**
: Description of an image for screen readers

**Focus**
: Interface state when an element is selected via keyboard

**Tab Index**
: Attribute that controls the order of elements when navigating with the tab key

**Screen Reader**
: Assistive technology that reads web content aloud

**Semantic Elements**
: HTML elements that clearly describe their meaning in the document structure
