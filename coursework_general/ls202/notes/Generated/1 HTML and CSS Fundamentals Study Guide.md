## Core Concepts and Terminology

### HTML Basics
- **Tag**: Basic building block of HTML that defines elements (e.g., `<p>`, `</p>`, `<div>`, `</div>`)
- **Self-closing Tag**: Elements that don't need a closing tag (e.g., `<img>`, `<br>`)
- **DOCTYPE**: Declaration at the beginning of HTML documents that specifies the HTML version (`<!DOCTYPE html>`)
- **Attribute**: Additional information added to HTML elements (e.g., class, id, src)

### CSS Fundamentals
- **Selector**: Pattern used to select elements to style (e.g., tag names, classes, IDs)
- **Property**: Styling characteristic that can be modified (e.g., color, font-size)
- **Identifiers**:
  - ID: Unique identifier for a single element (starts with #)
  - Class: Reusable identifier for multiple elements (starts with .)
  - Name: Used primarily for form elements

## Essential HTML Elements

### Foundational Elements
1. Text Structure
   - `<p>`: Paragraph element
   - `<h1>` through `<h6>`: Heading elements (hierarchical importance)
   - `<a>`: Anchor element for creating links

2. Text Emphasis
   - `<em>`: Emphasized text
   - `<strong>`: Strong importance

3. Document Structure
   - `<header>`: Introductory content or navigation
   - `<main>`: Main content area
   - `<article>`: Self-contained content
   - `<section>`: Thematic grouping of content
   - `<aside>`: Related but separate content

4. Generic Containers
   - `<div>`: Block-level container
   - `<span>`: Inline container

## Required Document Structure
```html
<!DOCTYPE html>
<html>
    <head>
        <!-- Document metadata -->
    </head>
    <body>
        <!-- Page content -->
    </body>
</html>
```

## Important CSS Properties
- `color`: Text color
- `background-color`: Background color
- `font-family`: Type of font
- `font-size`: Size of text

## Comments
- HTML: `<!-- Comment text -->`
- CSS: `/* Comment text */`

## CSS Selectors
- Element: `p { }` (selects all `<p>` elements)
- Class: `.class-name { }` (selects elements with class="class-name")
- ID: `#id-name { }` (selects element with id="id-name")

## Advanced Concepts

### Paths
- **Relative**: Path relative to current document location
- **Absolute**: Complete path from root directory or URL

### CSS Cascade and Specificity
1. Specificity Hierarchy (highest to lowest):
   - Inline styles
   - IDs
   - Classes, attributes, and pseudo-classes
   - Elements and pseudo-elements

2. Key Points:
   - More specific selectors take precedence
   - Later rules override earlier ones
   - Inheritance flows from parent to child elements

### Important Distinctions
- `<header>`: Container for introductory content
- `<head>`: Container for metadata
- `<h1>`-`<h6>`: Heading elements for content hierarchy
![[h5d-sectioning-flowchart.pdf]]


### Notes

open link in new tab: `target="_blank"`


# Summary
# HTML and CSS Fundamentals Study Guide

## HTML (HyperText Markup Language)

### Core Concepts
1. **Purpose**: HTML uses markup to organize content and provide semantic meaning
2. **Structure**: Built from elements represented by tags
3. **Elements**: Basic building blocks that may include attributes for additional details

### Required Document Structure
```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Page Title</title>
  </head>
  <body>
    <!-- Content goes here -->
  </body>
</html>
```

### Essential Elements to Memorize
- `<p>`: Paragraphs
- `<a>`: Links
- `<em>`: Emphasized text
- `<strong>`: Strong importance
- `<h1>` through `<h6>`: Heading levels

### Important Elements to Know
- `<header>`: Introductory content
- `<main>`: Main content
- `<article>`: Self-contained content
- `<section>`: Thematic grouping
- `<aside>`: Related content
- `<div>`: Generic block container
- `<span>`: Generic inline container

### HTML Attributes
- `id`: Unique identifier
- `class`: Reusable classifier
- `name`: Form element identifier

### Character Entities
Use these special codes instead of literal characters:
- `&lt;` for `<`
- `&gt;` for `>`
- `&amp;` for `&`

## CSS (Cascading Style Sheets)

### Purpose and Function
- Controls presentation and styling
- Handles spacing, colors, sizing, fonts, layout, etc.
- Works through rules combining selectors and properties

### Selector Types
```css
/* Tag Selector */
h1 { color: blue; }

/* Class Selector */
.highlight { background-color: yellow; }

/* ID Selector */
#intro { font-size: 24px; }

/* Combined Selector */
strong.highlight { color: red; }
```

### The Cascade
Determines which styles apply based on:
4. **Specificity**: More specific selectors take precedence
5. **Inheritance**: Some properties pass from parent to child elements
6. **Source Order**: Later rules override earlier ones

### CSS Implementation Methods
7. **Inline CSS**
   - Direct in HTML elements
   - Highest specificity
   - Hard to maintain
   ```html
   <p style="color: blue;">Text</p>
   ```

8. **Internal CSS**
   - In `<style>` tag in document head
   - Applies to single page
   ```html
   <style>
     p { color: blue; }
   </style>
   ```

9. **External CSS**
   - Separate .css file
   - Most maintainable
   - Reusable across pages
   ```html
   <link rel="stylesheet" href="styles.css">
   ```

### Typography
10. **Font Families**
   ```css
   /* Font Stack Example */
   font-family: "Helvetica Neue", Arial, sans-serif;
   ```

11. **Font Types**
   - Serif: Decorative strokes at letter ends
   - Sans-serif: Clean, modern appearance

12. **Text Styling**
   ```css
   /* Common Text Properties */
   color: #333333;
   background-color: #ffffff;
   font-size: 16px;
   font-weight: bold;
   ```

### Best Practices
13. Always include proper DOCTYPE
14. Use semantic HTML elements
15. Prefer external CSS
16. Include character encoding meta tag
17. Use meaningful class and ID names
18. Include fallback fonts in font stacks

### Tips for Development
19. Start with basic HTML structure
20. Add semantic elements for content
21. Style progressively with CSS
22. Test across different browsers
23. Validate HTML and CSS code