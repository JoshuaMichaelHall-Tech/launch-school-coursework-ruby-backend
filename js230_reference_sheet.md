# JS230: DOM and Asynchronous Programming with JavaScript - Reference Sheet

## DOM Manipulation

```javascript
// Selecting Elements
const element = document.getElementById('myId');
const elements = document.getElementsByClassName('myClass');
const elementsByTag = document.getElementsByTagName('div');
const querySelector = document.querySelector('.myClass');
const querySelectorAll = document.querySelectorAll('div.myClass');

// Creating Elements
const newDiv = document.createElement('div');
const textNode = document.createTextNode('Hello, world!');
newDiv.appendChild(textNode);

// Manipulating Elements
element.textContent = 'New text content';
element.innerHTML = '<span>HTML content</span>';
element.innerText = 'Visible text';

// Element Properties
element.id = 'newId';
element.className = 'newClass';
element.classList.add('anotherClass');
element.classList.remove('oldClass');
element.classList.toggle('toggleClass');
element.classList.contains('checkClass');
element.style.color = 'red';
element.style.backgroundColor = 'blue';

// Attributes
element.getAttribute('data-id');
element.setAttribute('data-id', '123');
element.hasAttribute('disabled');
element.removeAttribute('disabled');
element.dataset.customAttr = 'value'; // For data-custom-attr

// DOM Tree Navigation
const parent = element.parentNode;
const children = element.children;
const firstChild = element.firstElementChild;
const lastChild = element.lastElementChild;
const nextSibling = element.nextElementSibling;
const prevSibling = element.previousElementSibling;

// DOM Tree Modification
parent.appendChild(newDiv);
parent.insertBefore(newDiv, referenceNode);
parent.replaceChild(newDiv, oldChild);
parent.removeChild(childElement);
element.remove(); // Remove self

// Element Dimensions and Position
const rect = element.getBoundingClientRect();
const offsetTop = element.offsetTop;
const offsetLeft = element.offsetLeft;
const offsetWidth = element.offsetWidth;
const offsetHeight = element.offsetHeight;
const clientWidth = element.clientWidth;
const clientHeight = element.clientHeight;
const scrollTop = element.scrollTop;
const scrollLeft = element.scrollLeft;
```

## Event Handling

```javascript
// Adding Event Listeners
element.addEventListener('click', handleClick);
element.addEventListener('mouseover', handleMouseOver, { capture: true });
element.addEventListener('submit', handleSubmit, { once: true });

// Removing Event Listeners
element.removeEventListener('click', handleClick);

// Event Handler Functions
function handleClick(event) {
  console.log('Element clicked!');
  console.log('Event type:', event.type);
  console.log('Target element:', event.target);
  console.log('Current target:', event.currentTarget);
}

// Event Object Properties
function handleEvent(event) {
  event.target;         // Element that triggered the event
  event.currentTarget;  // Element that the event listener is attached to
  event.type;           // Type of event (e.g., 'click', 'mouseover')
  event.clientX;        // Mouse X coordinate relative to viewport
  event.clientY;        // Mouse Y coordinate relative to viewport
  event.key;            // Key pressed (for keyboard events)
  event.code;           // Physical key code (for keyboard events)
  event.preventDefault(); // Prevent default action
  event.stopPropagation(); // Stop event propagation
  event.stopImmediatePropagation(); // Stop event and prevent other handlers
}

// Common Events
// Mouse Events
element.addEventListener('click', handler);
element.addEventListener('dblclick', handler);
element.addEventListener('mousedown', handler);
element.addEventListener('mouseup', handler);
element.addEventListener('mouseover', handler);
element.addEventListener('mouseout', handler);
element.addEventListener('mousemove', handler);

// Keyboard Events
element.addEventListener('keydown', handler);
element.addEventListener('keyup', handler);
element.addEventListener('keypress', handler);

// Form Events
element.addEventListener('submit', handler);
element.addEventListener('reset', handler);
element.addEventListener('change', handler);
element.addEventListener('input', handler);
element.addEventListener('focus', handler);
element.addEventListener('blur', handler);

// Document/Window Events
window.addEventListener('load', handler);
window.addEventListener('DOMContentLoaded', handler);
window.addEventListener('resize', handler);
window.addEventListener('scroll', handler);
window.addEventListener('unload', handler);
window.addEventListener('hashchange', handler);

// Event Delegation
document.getElementById('parent-list').addEventListener('click', function(event) {
  if (event.target.matches('li')) {
    console.log('List item clicked:', event.target.textContent);
  }
});
```

## Asynchronous Programming

```javascript
// setTimeout & setInterval
const timeoutId = setTimeout(() => {
  console.log('This runs after 2 seconds');
}, 2000);

const intervalId = setInterval(() => {
  console.log('This runs every 1 second');
}, 1000);

// Clear timeout/interval
clearTimeout(timeoutId);
clearInterval(intervalId);

// Promises
const promise = new Promise((resolve, reject) => {
  // Asynchronous operation
  if (/* operation successful */) {
    resolve('Success!');
  } else {
    reject('Error!');
  }
});

promise
  .then(result => {
    console.log(result); // 'Success!'
    return 'Next value';
  })
  .then(result => {
    console.log(result); // 'Next value'
  })
  .catch(error => {
    console.error(error); // 'Error!'
  })
  .finally(() => {
    console.log('Promise completed (success or failure)');
  });

// Promise.all, Promise.race, Promise.allSettled
Promise.all([promise1, promise2, promise3])
  .then(results => {
    console.log('All promises resolved:', results);
  })
  .catch(error => {
    console.error('At least one promise rejected:', error);
  });

Promise.race([promise1, promise2, promise3])
  .then(result => {
    console.log('First promise resolved:', result);
  })
  .catch(error => {
    console.error('First promise rejected:', error);
  });

Promise.allSettled([promise1, promise2, promise3])
  .then(results => {
    results.forEach(result => {
      if (result.status === 'fulfilled') {
        console.log('Fulfilled:', result.value);
      } else {
        console.log('Rejected:', result.reason);
      }
    });
  });

// Async/Await
async function fetchData() {
  try {
    const response = await fetch('https://api.example.com/data');
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    return data;
  } catch (error) {
    console.error('Fetch error:', error);
    throw error;
  }
}

// Using async function
fetchData()
  .then(data => console.log('Data:', data))
  .catch(error => console.error('Error:', error));

// Or with async/await
(async () => {
  try {
    const data = await fetchData();
    console.log('Data:', data);
  } catch (error) {
    console.error('Error:', error);
  }
})();
```

## HTTP Requests

```javascript
// XMLHttpRequest
function makeRequest(method, url, data = null) {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.setRequestHeader('Content-Type', 'application/json');
    
    xhr.onload = function() {
      if (xhr.status >= 200 && xhr.status < 300) {
        resolve(JSON.parse(xhr.response));
      } else {
        reject({
          status: xhr.status,
          statusText: xhr.statusText
        });
      }
    };
    
    xhr.onerror = function() {
      reject({
        status: xhr.status,
        statusText: xhr.statusText
      });
    };
    
    if (data) {
      xhr.send(JSON.stringify(data));
    } else {
      xhr.send();
    }
  });
}

// GET request
makeRequest('GET', 'https://api.example.com/data')
  .then(data => console.log(data))
  .catch(error => console.error(error));

// POST request
makeRequest('POST', 'https://api.example.com/data', { name: 'John', age: 30 })
  .then(response => console.log(response))
  .catch(error => console.error(error));

// Fetch API
// GET request
fetch('https://api.example.com/data')
  .then(response => {
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return response.json();
  })
  .then(data => console.log(data))
  .catch(error => console.error('Fetch error:', error));

// POST request
fetch('https://api.example.com/data', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({ name: 'John', age: 30 })
})
  .then(response => {
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return response.json();
  })
  .then(data => console.log(data))
  .catch(error => console.error('Fetch error:', error));

// Async/Await with Fetch
async function fetchData(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    console.error('Fetch error:', error);
    throw error;
  }
}

// Data Serialization
// JSON
const jsonString = JSON.stringify({ name: 'John', age: 30 });
const jsonObject = JSON.parse(jsonString);

// FormData
const formData = new FormData();
formData.append('name', 'John');
formData.append('age', 30);
formData.append('file', fileInput.files[0]);

fetch('https://api.example.com/upload', {
  method: 'POST',
  body: formData
});

// URL Parameters
const params = new URLSearchParams();
params.append('name', 'John');
params.append('age', 30);

fetch(`https://api.example.com/search?${params.toString()}`);
```

## jQuery

```javascript
// Selecting Elements
const $element = $('#myId');
const $elements = $('.myClass');
const $elementsByTag = $('div');
const $complex = $('div.myClass:first-child');

// DOM Traversal
const $parent = $element.parent();
const $children = $element.children();
const $siblings = $element.siblings();
const $next = $element.next();
const $prev = $element.prev();
const $first = $elements.first();
const $last = $elements.last();
const $filtered = $elements.filter('.active');
const $found = $elements.find('.child');

// Manipulating Elements
$element.text('New text content');
$element.html('<span>HTML content</span>');
$element.addClass('newClass');
$element.removeClass('oldClass');
$element.toggleClass('toggleClass');
$element.hasClass('checkClass');
$element.attr('data-id', '123');
$element.removeAttr('disabled');
$element.css('color', 'red');
$element.css({ color: 'red', backgroundColor: 'blue' });
$element.hide();
$element.show();
$element.toggle();
$element.fadeIn();
$element.fadeOut();
$element.slideDown();
$element.slideUp();

// DOM Modification
$element.append('<div>Appended content</div>');
$element.prepend('<div>Prepended content</div>');
$element.after('<div>After content</div>');
$element.before('<div>Before content</div>');
$element.remove();
$element.empty();
$element.replaceWith('<div>Replacement</div>');

// Event Handling
$element.on('click', function(event) {
  console.log('Element clicked!');
  console.log('Event:', event);
  console.log('This element:', $(this));
});

$element.off('click'); // Remove event handler

// Common Event Shortcuts
$element.click(handler);
$element.dblclick(handler);
$element.hover(handlerIn, handlerOut);
$element.focus(handler);
$element.blur(handler);
$element.change(handler);
$element.submit(handler);
$element.ready(handler);

// Event Delegation
$('#parent-list').on('click', 'li', function(event) {
  console.log('List item clicked:', $(this).text());
});

// AJAX
$.ajax({
  url: 'https://api.example.com/data',
  method: 'GET',
  dataType: 'json',
  success: function(data) {
    console.log('Data:', data);
  },
  error: function(xhr, status, error) {
    console.error('AJAX error:', error);
  }
});

// AJAX Shortcuts
$.get('https://api.example.com/data', function(data) {
  console.log('Data:', data);
});

$.post('https://api.example.com/data', { name: 'John', age: 30 }, function(response) {
  console.log('Response:', response);
});

$.getJSON('https://api.example.com/data.json', function(data) {
  console.log('JSON data:', data);
});
```

## HTML Templates

```javascript
// Basic Template String
const name = 'John';
const age = 30;
const html = `<div class="user">
  <h2>${name}</h2>
  <p>Age: ${age}</p>
</div>`;

// Handlebars
// Template in HTML
// <script id="user-template" type="text/x-handlebars-template">
//   <div class="user">
//     <h2>{{name}}</h2>
//     <p>Age: {{age}}</p>
//     {{#if isAdmin}}
//       <p>Admin User</p>
//     {{else}}
//       <p>Regular User</p>
//     {{/if}}
//   </div>
// </script>

// Compiling and Using Template
const source = document.getElementById('user-template').innerHTML;
const template = Handlebars.compile(source);
const context = { name: 'John', age: 30, isAdmin: true };
const html = template(context);
document.getElementById('output').innerHTML = html;

// Handlebars Helpers
Handlebars.registerHelper('formatDate', function(date) {
  return new Date(date).toLocaleDateString();
});

// Using Helpers
// {{formatDate createdAt}}

// Handlebars Partials
Handlebars.registerPartial('userDetails', `
  <div class="details">
    <p>Email: {{email}}</p>
    <p>Joined: {{formatDate joinDate}}</p>
  </div>
`);

// Using Partials
// {{> userDetails}}

// Handlebars Iteration
// {{#each users}}
//   <div class="user">
//     <h3>{{name}}</h3>
//     <p>Age: {{age}}</p>
//   </div>
// {{/each}}

// Handlebars Conditionals
// {{#if condition}}
//   <p>True condition</p>
// {{else}}
//   <p>False condition</p>
// {{/if}}

// {{#unless condition}}
//   <p>False condition</p>
// {{/unless}}
```

## Browser APIs and Tools

```javascript
// Browser Object Model (BOM)
window.innerWidth;  // Window width
window.innerHeight; // Window height
window.location.href; // Current URL
window.location.hostname; // Domain name
window.location.pathname; // Path
window.location.search; // Query string
window.history.back(); // Navigate back
window.history.forward(); // Navigate forward
window.navigator.userAgent; // Browser info
window.open('https://example.com'); // Open new window/tab
window.close(); // Close current window
window.print(); // Print page
window.scrollTo(0, 0); // Scroll to top
window.localStorage.setItem('key', 'value'); // Store data
window.localStorage.getItem('key'); // Retrieve data
window.sessionStorage.setItem('key', 'value'); // Session storage

// Console Methods
console.log('General message');
console.info('Informational message');
console.warn('Warning message');
console.error('Error message');
console.debug('Debug message');
console.table([{ name: 'John', age: 30 }, { name: 'Jane', age: 25 }]);
console.group('Group name');
console.log('Grouped message');
console.groupEnd();
console.time('Timer');
console.timeEnd('Timer');
console.count('Counter');
console.trace();
console.assert(condition, 'Error message if false');

// Debugging with breakpoints
// In code
debugger;

// Performance Measurement
performance.now(); // High-resolution timestamp
performance.mark('start');
// Code to measure
performance.mark('end');
performance.measure('operation', 'start', 'end');
const measures = performance.getEntriesByType('measure');
```
