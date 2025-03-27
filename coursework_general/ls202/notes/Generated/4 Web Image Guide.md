## Image File Formats

### JPEG (Joint Photographic Experts Group)
- Best for photographs and complex images with many colors and gradients
- Lossy compression that reduces file size by slightly degrading image quality
- Does not support transparency
- Use when: 
  - Displaying photographs
  - Showing realistic images with many colors
  - File size needs to be small and some quality loss is acceptable

### PNG (Portable Network Graphics)
- Lossless compression that maintains image quality
- Supports transparency (alpha channel)
- Better for images with text, lines, and sharp edges
- Use when:
  - You need transparency
  - Working with logos, icons, or screenshots
  - Image quality must be preserved
  - Text is present in the image

### GIF (Graphics Interchange Format)
- Limited to 256 colors
- Supports animation and transparency (binary - fully transparent or fully opaque)
- Use when:
  - Creating simple animations
  - Working with simple graphics or icons
  - File size needs to be very small
  - You need animation but don't want to use video

## HTML Implementation

### Basic Image Insertion
```html
<!-- Basic image -->
<img src="path/to/image.jpg" alt="Descriptive text">

<!-- Setting dimensions -->
<img src="image.png" alt="Description" width="300" height="200">
```

### Background Images in CSS
```css
/* Full background image */
body {
    background-image: url('background.jpg');
    background-size: cover;
    background-position: center;
}

/* Element background */
.container {
    background-image: url('pattern.png');
    background-repeat: no-repeat;
}
```

### Figures and Captions
```html
<figure>
    <img src="diagram.png" alt="Process diagram">
    <figcaption>Figure 1: System process flow</figcaption>
</figure>
```

### Images as Links
```html
<a href="destination.html">
    <img src="button.png" alt="Click here">
</a>
```

## Best Practices
1. Always include meaningful alt text for accessibility
2. Optimize images for web use by choosing appropriate formats and sizes
3. Consider responsive design by using relative dimensions or max-width
4. Use descriptive filenames for better organization
5. Consider loading time and page performance when selecting image formats
