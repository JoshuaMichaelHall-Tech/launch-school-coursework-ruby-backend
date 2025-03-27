Developers frequently use unordered lists to construct navigation menus, both vertical and horizontal. Commonly, you start out with HTML and CSS that looks something like this:

```html
<nav>
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">Projects</a></li>
    <li><a href="#">Team</a></li>
    <li><a href="#">Help</a></li>
  </ul>
</nav>
```


```css
nav ul {
 background-color: powderblue;
 list-style-type: none;
 padding-left: 0;
 width: 200px;
}

nav li {
 font-size: 1.25rem;
}

nav a {
 box-sizing: border-box;
 color: blue;
 display: inline-block;
 line-height: 2.5;
 padding: 0 10px;
 text-decoration: none;
 width: 100%;
}

nav a:hover,
nav a:focus {
 background-color: blue;
 color: white;
}
```

- [Home](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)
- [Projects](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)
- [Team](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)
- [Help](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)

Our CSS removes the list bullets with the `list-style-type` property, and uses the `:hover` and `:focus` **pseudo-classes** to draw a highlight bar on the menu at appropriate times.

If you want a horizontal list, you need a few more changes:

- Reset the width of the menu (`ul`).
- Set the font size for the list (`ul`) to 0, then restore it for the list items (`li`).
- Set the list items to `inline-block`.
- Set the width of the list items to a value that will distribute the values the way you want them distributed (typically, you want a percentage width).
- Center the list items horizontally.


```css
nav ul {
  font-size: 0;
  width: 100%;
}

nav li {
  display: inline-block;
  font-size: 1.25rem;
  text-align: center;
  width: 25%;
}
```

- [Home](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)
 - [Projects](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)
 - [Team](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)
 - [Help](https://launchschool.com/lessons/8c6e03e3/assignments/c0a144c6#)

You will see this pattern of creating navigation lists often; learn it well.