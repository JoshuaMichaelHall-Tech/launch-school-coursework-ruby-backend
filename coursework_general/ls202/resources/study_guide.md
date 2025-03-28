# LS202: HTML and CSS - Study Guide

## HTML Fundamentals

### 1. Document Structure
- **Required Elements**: DOCTYPE, html, head, body
- **Metadata**: title, meta tags, character encoding
- **Content Organization**: proper nesting and hierarchy
- **Semantic Structure**: choosing appropriate elements
- **Validation**: using validators to ensure proper HTML

### 2. Semantic HTML
- **Structural Elements**: header, nav, main, section, article, aside, footer
- **Text Elements**: h1-h6, p, ul/ol/li, dl/dt/dd
- **Emphasis Elements**: strong, em
- **Media Elements**: img, audio, video, figure, figcaption
- **Benefits**: accessibility, SEO, maintainability

### 3. Forms and User Input
- **Form Structure**: form, fieldset, legend
- **Input Types**: text, email, password, checkbox, radio, etc.
- **Form Controls**: textarea, select, button
- **Labels and Accessibility**: label elements and for attributes
- **Validation**: required, pattern, min/max attributes

### 4. Tables
- **Basic Structure**: table, tr, td
- **Header and Footer**: thead, tbody, tfoot
- **Cell Headers**: th with scope attribute
- **Spanning Cells**: colspan and rowspan attributes
- **Accessible Tables**: caption and summary attributes

### 5. Links and Navigation
- **Link Types**: internal, external, anchor, email
- **Link Attributes**: href, target, rel
- **Navigation Structures**: nav element, menus, breadcrumbs
- **Creating Navigation Menus**: lists of links
- **Styling Navigation**: horizontal and vertical menus

## CSS Fundamentals

### 1. Selectors and Specificity
- **Basic Selectors**: type, class, ID
- **Combinators**: descendant, child, adjacent sibling
- **Attribute Selectors**: exact, partial, prefix, suffix
- **Pseudo-classes**: :hover, :focus, :nth-child
- **Pseudo-elements**: ::before, ::after, ::first-line
- **Specificity Rules**: ID > class > type

### 2. The Box Model
- **Content, Padding, Border, Margin**: understanding the four parts
- **Box-sizing**: content-box vs. border-box
- **Width and Height**: fixed vs. fluid dimensions
- **Margin Collapsing**: behaviors and solutions
- **Box Model Debugging**: using browser developer tools

### 3. Layout Techniques
- **Display Property**: block, inline, inline-block
- **Positioning**: static, relative, absolute, fixed, sticky
- **Floats**: floating elements and clearing
- **Flexbox**: flexible box layout
- **CSS Grid**: two-dimensional grid layout
- **Multi-column Layout**: column-count and column-width

### 4. Typography and Colors
- **Font Properties**: family, size, weight, style
- **Text Properties**: alignment, decoration, spacing
- **Web Fonts**: using @font-face and web font services
- **Color Systems**: named colors, hex, RGB, HSL
- **Text Readability**: contrast, line-height, letter-spacing

### 5. Responsive Design
- **Media Queries**: targeting different viewport sizes
- **Fluid Layouts**: percentage-based widths
- **Flexible Images**: max-width and height auto
- **Mobile-first Design**: starting with mobile layouts
- **Breakpoints**: choosing appropriate screen widths
- **Viewport Meta Tag**: controlling the viewport

## Advanced Concepts

### 1. CSS Methodologies
- **BEM (Block Element Modifier)**: naming convention
- **OOCSS (Object-Oriented CSS)**: separation of structure and skin
- **SMACSS (Scalable and Modular Architecture for CSS)**: categorizing CSS rules
- **Atomic CSS**: small, single-purpose classes
- **CSS-in-JS**: styling components with JavaScript

### 2. Transformations and Animations
- **Transforms**: translate, rotate, scale, skew
- **Transitions**: property, duration, timing-function, delay
- **Keyframe Animations**: defining complex animations
- **Performance Considerations**: what properties to animate
- **Accessibility Concerns**: respecting user preferences

### 3. CSS Preprocessors
- **Variables**: defining and using reusable values
- **Nesting**: organizing selectors hierarchically
- **Mixins**: reusable chunks of styles
- **Functions**: performing operations in CSS
- **Popular Preprocessors**: Sass, Less, Stylus

### 4. Cross-Browser Compatibility
- **Vendor Prefixes**: -webkit-, -moz-, -ms-
- **Feature Detection**: using @supports
- **Polyfills and Fallbacks**: ensuring functionality
- **CSS Resets and Normalizers**: consistent starting point
- **Testing Across Browsers**: tools and techniques

### 5. CSS Frameworks
- **Grid Systems**: column-based layouts
- **Component Libraries**: pre-built UI elements
- **Utility Frameworks**: function-based classes
- **Customization**: adapting frameworks to your needs
- **Popular Frameworks**: Bootstrap, Foundation, Tailwind

## Design Implementation

### 1. From Design to Code
- **Analyzing Design Files**: extracting information
- **Style Guides**: documenting design decisions
- **Asset Preparation**: optimizing images and fonts
- **Pixel-Perfect Implementation**: matching designs precisely
- **Designer-Developer Collaboration**: effective communication

### 2. Image Optimization
- **Image Formats**: choosing between JPEG, PNG, SVG, WebP
- **Responsive Images**: srcset and sizes attributes
- **Image Compression**: reducing file sizes
- **CSS Sprites**: combining multiple images
- **Background Images**: responsive techniques

### 3. Forms and User Experience
- **Form Layout**: organizing form controls
- **Feedback Mechanisms**: validation messages
- **Styling Form Elements**: consistent appearance
- **Custom Form Controls**: styling checkboxes and radios
- **Mobile-friendly Forms**: touch-friendly inputs

### 4. Accessibility
- **Semantic HTML**: proper structure
- **ARIA Attributes**: enhancing accessibility
- **Keyboard Navigation**: focus styles and tabindex
- **Color Contrast**: ensuring readability
- **Screen Reader Compatibility**: alternative text

### 5. Performance Optimization
- **CSS File Size**: minimizing and compressing
- **Critical CSS**: inline critical styles
- **Loading Strategies**: async and defer
- **Reducing Repaints and Reflows**: efficient CSS
- **Measuring Performance**: tools and metrics

## Practical Application

### 1. Development Workflow
- **CSS Organization**: file structure and naming
- **Browser Developer Tools**: inspection and debugging
- **Version Control**: tracking changes
- **Code Review**: best practices
- **Documentation**: commenting and style guides

### 2. Progressive Enhancement
- **Core Functionality**: ensuring basic usability
- **Feature Detection**: graceful degradation
- **CSS Feature Queries**: @supports rule
- **JavaScript Enhancement**: non-essential features
- **Accessibility Baseline**: ensuring core functionality

### 3. Common UI Patterns
- **Navigation**: menus, dropdowns, breadcrumbs
- **Cards and Panels**: content containers
- **Modal Dialogs**: overlays and pop-ups
- **Form Patterns**: inline validation, multi-step forms
- **Responsive Patterns**: navigation, tables, images

### 4. Web Typography
- **Font Loading**: performance optimization
- **Variable Fonts**: flexibility and efficiency
- **Typographic Hierarchy**: guiding the eye
- **Responsive Typography**: fluid type scaling
- **Vertical Rhythm**: consistent spacing

### 5. Project Structure
- **File Organization**: logical grouping
- **Naming Conventions**: consistent patterns
- **CSS Architecture**: scalable organization
- **Modular Components**: reusable blocks
- **Documentation**: style guides and comments
