`px`
One pixel. For screen displays, it traditionally represents one device pixel (dot). However, for _printers_ and _high-resolution screens_, one CSS pixel implies multiple device pixels. `1px` = `1in / 96`. Only **absolute** unit of significance.

`rem`
Represents the [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size) of the root element (typically [`<html>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/html)). When used within the root element [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size), it represents its initial value. A common browser default is `16px`, but user-defined preferences may modify this.

`em` 
Represents the calculated [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size) of the element. If used on the [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size) property itself, it represents the _inherited_ font-size of the element.

`%`
The **`<percentage>`** [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) [data type](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Values_and_Units/CSS_data_types) represents a percentage value. It is often used to define a size as relative to an element's parent object. Numerous properties can use percentages, such as [`width`](https://developer.mozilla.org/en-US/docs/Web/CSS/width), [`height`](https://developer.mozilla.org/en-US/docs/Web/CSS/height), [`margin`](https://developer.mozilla.org/en-US/docs/Web/CSS/margin), [`padding`](https://developer.mozilla.org/en-US/docs/Web/CSS/padding), and [`font-size`](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size).