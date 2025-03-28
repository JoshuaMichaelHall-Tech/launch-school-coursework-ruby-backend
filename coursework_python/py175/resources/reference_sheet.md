# PY175: Networked Applications with Python - Reference Sheet

## Basic HTTP Server

```python
# Simple HTTP server with Python's standard library
import socket

def parse_request(request):
    # Parse the HTTP request (simplified)
    request_line = request.split('\r\n')[0]
    method, path, version = request_line.split(' ')
    return method, path

def generate_response(status_code, body):
    # Generate an HTTP response
    response = f"HTTP/1.1 {status_code}\r\n"
    response += "Content-Type: text/html\r\n"
    response += f"Content-Length: {len(body)}\r\n"
    response += "\r\n"
    response += body
    return response

# Create a socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind(('localhost', 8080))
server_socket.listen(1)

print('Server is running on http://localhost:8080')

while True:
    client_socket, address = server_socket.accept()
    request = client_socket.recv(1024).decode('utf-8')
    
    try:
        method, path = parse_request(request)
        
        if method == 'GET':
            if path == '/':
                response = generate_response("200 OK", "<html><body><h1>Hello, World!</h1></body></html>")
            else:
                response = generate_response("404 Not Found", "<html><body><h1>404 Not Found</h1></body></html>")
        else:
            response = generate_response("405 Method Not Allowed", "<html><body><h1>Method Not Allowed</h1></body></html>")
        
        client_socket.sendall(response.encode('utf-8'))
    except Exception as e:
        print(f"Error: {e}")
    
    client_socket.close()
```

## Flask Basics

```python
# Basic Flask application
from flask import Flask, render_template, request, redirect, url_for, session, flash

# Create Flask application
app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Required for sessions and flash messages

# Basic route
@app.route('/')
def index():
    return 'Hello, World!'

# Route with variable
@app.route('/user/<username>')
def show_user(username):
    return f'User: {username}'

# Route with type conversion
@app.route('/post/<int:post_id>')
def show_post(post_id):
    return f'Post: {post_id}'

# Multiple HTTP methods
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        # Simplified authentication
        if username == 'admin' and password == 'password':
            session['username'] = username
            flash('You were successfully logged in')
            return redirect(url_for('index'))
        else:
            flash('Invalid credentials')
            
    return render_template('login.html')

# Template rendering
@app.route('/hello/<name>')
def hello(name):
    return render_template('hello.html', name=name)

# URL generation
@app.route('/redirect')
def redirect_example():
    return redirect(url_for('show_user', username='admin'))

# File upload handling
@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            flash('No file part')
            return redirect(request.url)
        
        file = request.files['file']
        
        if file.filename == '':
            flash('No selected file')
            return redirect(request.url)
        
        if file:
            # Save the file
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            return redirect(url_for('index'))
            
    return render_template('upload.html')

# Run the application
if __name__ == '__main__':
    app.run(debug=True)
```

## HTML Templates with Jinja2

```html
<!-- Base template (base.html) -->
<!DOCTYPE html>
<html>
<head>
    <title>{% block title %}Default Title{% endblock %}</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="{{ url_for('index') }}">Home</a></li>
                <li><a href="{{ url_for('about') }}">About</a></li>
                <li><a href="{{ url_for('contact') }}">Contact</a></li>
            </ul>
        </nav>
    </header>
    
    <div class="container">
        {% block content %}{% endblock %}
    </div>
    
    <footer>
        <p>&copy; {{ current_year }} My Website</p>
    </footer>
    
    <script src="{{ url_for('static', filename='script.js') }}"></script>
</body>
</html>

<!-- Child template (page.html) -->
{% extends "base.html" %}

{% block title %}Page Title{% endblock %}

{% block content %}
    <h1>Welcome to the page</h1>
    
    <p>This is a paragraph of text.</p>
    
    {% if user %}
        <p>Hello, {{ user.name }}!</p>
    {% else %}
        <p>Hello, Guest!</p>
    {% endif %}
    
    <h2>Item List</h2>
    <ul>
        {% for item in items %}
            <li>{{ item }}</li>
        {% else %}
            <li>No items found</li>
        {% endfor %}
    </ul>
    
    {% include "partials/sidebar.html" %}
{% endblock %}

<!-- Include partial (partials/sidebar.html) -->
<div class="sidebar">
    <h3>Sidebar</h3>
    <ul>
        <li><a href="#">Link 1</a></li>
        <li><a href="#">Link 2</a></li>
        <li><a href="#">Link 3</a></li>
    </ul>
</div>
```

## Forms and Validation

```python
# Flask form handling with validation
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField
from wtforms.validators import DataRequired, Email, Length, EqualTo

app = Flask(__name__)
app.config['SECRET_KEY'] = 'your_secret_key'

# Form class using Flask-WTF
class RegistrationForm(FlaskForm):
    username = StringField('Username', validators=[DataRequired(), Length(min=4, max=20)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(), Length(min=6)])
    confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Sign Up')

@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    
    if form.validate_on_submit():
        # Process valid form data
        username = form.username.data
        email = form.email.data
        password = form.password.data
        
        # Here you would typically save the user to a database
        flash(f'Account created for {username}!', 'success')
        return redirect(url_for('login'))
        
    return render_template('register.html', form=form)

# Manual form handling without Flask-WTF
@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        message = request.form.get('message')
        
        errors = {}
        
        if not name:
            errors['name'] = 'Name is required'
        
        if not email:
            errors['email'] = 'Email is required'
        elif '@' not in email:
            errors['email'] = 'Invalid email format'
            
        if not message:
            errors['message'] = 'Message is required'
        elif len(message) < 10:
            errors['message'] = 'Message must be at least 10 characters'
            
        if errors:
            return render_template('contact.html', errors=errors, name=name, email=email, message=message)
        else:
            # Process the form data
            flash('Your message has been sent!', 'success')
            return redirect(url_for('index'))
            
    return render_template('contact.html')
```

```html
<!-- Registration form template (register.html) with Flask-WTF -->
{% extends "base.html" %}

{% block content %}
    <h1>Register</h1>
    <form method="POST" action="">
        {{ form.hidden_tag() }}
        <div class="form-group">
            {{ form.username.label }}
            {{ form.username(class="form-control") }}
            {% if form.username.errors %}
                <div class="errors">
                    {% for error in form.username.errors %}
                        <span>{{ error }}</span>
                    {% endfor %}
                </div>
            {% endif %}
        </div>
        <div class="form-group">
            {{ form.email.label }}
            {{ form.email(class="form-control") }}
            {% if form.email.errors %}
                <div class="errors">
                    {% for error in form.email.errors %}
                        <span>{{ error }}</span>
                    {% endfor %}
                </div>
            {% endif %}
        </div>
        <div class="form-group">
            {{ form.password.label }}
            {{ form.password(class="form-control") }}
            {% if form.password.errors %}
                <div class="errors">
                    {% for error in form.password.errors %}
                        <span>{{ error }}</span>
                    {% endfor %}
                </div>
            {% endif %}
        </div>
        <div class="form-group">
            {{ form.confirm_password.label }}
            {{ form.confirm_password(class="form-control") }}
            {% if form.confirm_password.errors %}
                <div class="errors">
                    {% for error in form.confirm_password.errors %}
                        <span>{{ error }}</span>
                    {% endfor %}
                </div>
            {% endif %}
        </div>
        <div class="form-group">
            {{ form.submit(class="btn") }}
        </div>
    </form>
{% endblock %}

<!-- Manual form template (contact.html) -->
{% extends "base.html" %}

{% block content %}
    <h1>Contact Us</h1>
    <form method="POST" action="">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="{{ name or '' }}" class="form-control">
            {% if errors and errors.name %}
                <div class="error">{{ errors.name }}</div>
            {% endif %}
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" value="{{ email or '' }}" class="form-control">
            {% if errors and errors.email %}
                <div class="error">{{ errors.email }}</div>
            {% endif %}
        </div>
        <div class="form-group">
            <label for="message">Message</label>
            <textarea name="message" id="message" class="form-control">{{ message or '' }}</textarea>
            {% if errors and errors.message %}
                <div class="error">{{ errors.message }}</div>
            {% endif %}
        </div>
        <div class="form-group">
            <button type="submit" class="btn">Send Message</button>
        </div>
    </form>
{% endblock %}
```

## Session and State Management

```python
# Session management in Flask
from flask import Flask, session, redirect, url_for, request, render_template

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Required for session

@app.route('/')
def index():
    # Access session data
    visits = session.get('visits', 0)
    session['visits'] = visits + 1
    
    return f'You have visited this page {visits} times'

# Setting session data
@app.route('/set_session/<key>/<value>')
def set_session(key, value):
    session[key] = value
    return f'Session variable {key} set to {value}'

# Getting session data
@app.route('/get_session/<key>')
def get_session(key):
    return f'Session variable {key} is {session.get(key, "not set")}'

# Clearing session data
@app.route('/clear_session')
def clear_session():
    session.clear()
    return 'Session cleared'

# Flash messages
from flask import flash

@app.route('/flash_message')
def flash_message():
    flash('This is a flash message', 'info')
    flash('This is an error message', 'error')
    return redirect(url_for('show_flash_messages'))

@app.route('/show_flash_messages')
def show_flash_messages():
    return render_template('flash.html')

# Cookies
@app.route('/set_cookie/<name>/<value>')
def set_cookie(name, value):
    response = redirect(url_for('index'))
    response.set_cookie(name, value)
    return response

@app.route('/get_cookie/<name>')
def get_cookie(name):
    value = request.cookies.get(name)
    return f'Cookie {name} is {value}'

@app.route('/delete_cookie/<name>')
def delete_cookie(name):
    response = redirect(url_for('index'))
    response.delete_cookie(name)
    return response
```

```html
<!-- Flash messages template (flash.html) -->
{% extends "base.html" %}

{% block content %}
    <h1>Flash Messages</h1>
    
    {% with messages = get_flashed_messages(with_categories=true) %}
        {% if messages %}
            <ul class="flashes">
                {% for category, message in messages %}
                    <li class="{{ category }}">{{ message }}</li>
                {% endfor %}
            </ul>
        {% endif %}
    {% endwith %}
    
    <p><a href="{{ url_for('flash_message') }}">Generate new flash messages</a></p>
{% endblock %}
```

## Authentication and Security

```python
# Basic authentication system
import hashlib
import os
from flask import Flask, request, session, redirect, url_for, render_template, flash, g, abort

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Simulated user database
users = {
    'admin': {
        'password': '5f4dcc3b5aa765d61d8327deb882cf99',  # md5 hash of 'password'
        'salt': '',
        'name': 'Admin User'
    }
}

def hash_password(password, salt):
    # In production, use a more secure hashing algorithm with proper salting
    # This is simplified for demonstration
    return hashlib.md5((password + salt).encode()).hexdigest()

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        if username in users:
            user = users[username]
            hashed_password = hash_password(password, user['salt'])
            
            if hashed_password == user['password']:
                session['user_id'] = username
                flash('You have been logged in', 'success')
                return redirect(url_for('dashboard'))
        
        flash('Invalid username or password', 'error')
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    flash('You have been logged out', 'info')
    return redirect(url_for('index'))

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        flash('Please log in to access the dashboard', 'warning')
        return redirect(url_for('login'))
    
    user = users[session['user_id']]
    return render_template('dashboard.html', user=user)

# Decorator for requiring login
def login_required(view):
    def wrapped_view(**kwargs):
        if 'user_id' not in session:
            flash('Please log in to access this page', 'warning')
            return redirect(url_for('login'))
        return view(**kwargs)
    wrapped_view.__name__ = view.__name__
    return wrapped_view

@app.route('/profile')
@login_required
def profile():
    user = users[session['user_id']]
    return render_template('profile.html', user=user)

# CSRF Protection
@app.before_request
def csrf_protect():
    if request.method == "POST":
        token = session.pop('_csrf_token', None)
        if not token or token != request.form.get('_csrf_token'):
            abort(403)

def generate_csrf_token():
    if '_csrf_token' not in session:
        session['_csrf_token'] = os.urandom(24).hex()
    return session['_csrf_token']

app.jinja_env.globals['csrf_token'] = generate_csrf_token
```

```html
<!-- Login form with CSRF protection -->
{% extends "base.html" %}

{% block content %}
    <h1>Login</h1>
    <form method="POST" action="">
        <input type="hidden" name="_csrf_token" value="{{ csrf_token() }}">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" class="form-control">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control">
        </div>
        <div class="form-group">
            <button type="submit" class="btn">Login</button>
        </div>
    </form>
{% endblock %}
```

## File Operations and CMS

```python
# File-based Content Management System
import os
import markdown
from flask import Flask, render_template, request, redirect, url_for, flash, abort, session
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'your_secret_key'
app.config['DATA_FOLDER'] = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'data')
app.config['ALLOWED_EXTENSIONS'] = {'txt', 'md', 'html'}

def get_file_list():
    files = []
    for filename in os.listdir(app.config['DATA_FOLDER']):
        if os.path.isfile(os.path.join(app.config['DATA_FOLDER'], filename)):
            if filename.split('.')[-1] in app.config['ALLOWED_EXTENSIONS']:
                files.append(filename)
    return sorted(files)

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in app.config['ALLOWED_EXTENSIONS']

def render_file(filename):
    file_path = os.path.join(app.config['DATA_FOLDER'], filename)
    
    if not os.path.isfile(file_path):
        abort(404)
    
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Render markdown to HTML if it's a markdown file
    if filename.endswith('.md'):
        content = markdown.markdown(content)
    
    return content

@app.route('/')
def index():
    files = get_file_list()
    return render_template('index.html', files=files)

@app.route('/files/<filename>')
def view_file(filename):
    content = render_file(filename)
    return render_template('file.html', filename=filename, content=content)

@app.route('/edit/<filename>', methods=['GET', 'POST'])
def edit_file(filename):
    # In a real application, check user permissions here
    
    file_path = os.path.join(app.config['DATA_FOLDER'], filename)
    
    if not os.path.isfile(file_path):
        abort(404)
    
    if request.method == 'POST':
        content = request.form.get('content', '')
        
        with open(file_path, 'w') as file:
            file.write(content)
        
        flash(f'File {filename} has been updated', 'success')
        return redirect(url_for('view_file', filename=filename))
    
    with open(file_path, 'r') as file:
        content = file.read()
    
    return render_template('edit.html', filename=filename, content=content)

@app.route('/create', methods=['GET', 'POST'])
def create_file():
    # In a real application, check user permissions here
    
    if request.method == 'POST':
        filename = request.form.get('filename', '').strip()
        content = request.form.get('content', '')
        
        if not filename:
            flash('Filename is required', 'error')
            return render_template('create.html', content=content)
        
        if not allowed_file(filename):
            flash(f'File type not allowed. Allowed types: {", ".join(app.config["ALLOWED_EXTENSIONS"])}', 'error')
            return render_template('create.html', filename=filename, content=content)
        
        filename = secure_filename(filename)
        file_path = os.path.join(app.config['DATA_FOLDER'], filename)
        
        if os.path.exists(file_path):
            flash(f'File {filename} already exists', 'error')
            return render_template('create.html', filename=filename, content=content)
        
        with open(file_path, 'w') as file:
            file.write(content)
        
        flash(f'File {filename} has been created', 'success')
        return redirect(url_for('view_file', filename=filename))
    
    return render_template('create.html')

@app.route('/delete/<filename>', methods=['POST'])
def delete_file(filename):
    # In a real application, check user permissions here
    
    file_path = os.path.join(app.config['DATA_FOLDER'], filename)
    
    if not os.path.isfile(file_path):
        abort(404)
    
    os.remove(file_path)
    flash(f'File {filename} has been deleted', 'success')
    return redirect(url_for('index'))
```

## Testing Web Applications

```python
# Testing a Flask application
import unittest
from flask import Flask
from app import app, db, User  # Import your Flask app and models

class FlaskTestCase(unittest.TestCase):
    def setUp(self):
        # Configure app for testing
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
        self.app = app.test_client()
        with app.app_context():
            db.create_all()
    
    def tearDown(self):
        with app.app_context():
            db.session.remove()
            db.drop_all()
    
    def test_index_page(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Welcome to the App', response.data)
    
    def test_login_page(self):
        response = self.app.get('/login')
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Login', response.data)
    
    def test_valid_login(self):
        # Create a test user
        with app.app_context():
            user = User(username='testuser', email='test@example.com')
            user.set_password('password123')
            db.session.add(user)
            db.session.commit()
        
        # Test login
        response = self.app.post('/login', data={
            'username': 'testuser',
            'password': 'password123'
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'You have been logged in', response.data)
    
    def test_invalid_login(self):
        response = self.app.post('/login', data={
            'username': 'testuser',
            'password': 'wrongpassword'
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Invalid username or password', response.data)
    
    def test_create_item(self):
        # First login
        with app.app_context():
            user = User(username='testuser', email='test@example.com')
            user.set_password('password123')
            db.session.add(user)
            db.session.commit()
        
        # Login
        self.app.post('/login', data={
            'username': 'testuser',
            'password': 'password123'
        })
        
        # Create item
        response = self.app.post('/items/create', data={
            'title': 'Test Item',
            'description': 'This is a test item'
        }, follow_redirects=True)
        
        self.assertEqual(response.status_code, 200)
        self.assertIn(b'Item created successfully', response.data)
        
        # Check if item exists in database
        with app.app_context():
            item = Item.query.filter_by(title='Test Item').first()
            self.assertIsNotNone(item)
            self.assertEqual(item.description, 'This is a test item')

if __name__ == '__main__':
    unittest.main()
```

## AJAX with Flask

```python
# Server-side code for AJAX
from flask import Flask, jsonify, request

app = Flask(__name__)

# API route that returns JSON
@app.route('/api/data')
def get_data():
    data = {
        'items': [
            {'id': 1, 'name': 'Item 1'},
            {'id': 2, 'name': 'Item 2'},
            {'id': 3, 'name': 'Item 3'}
        ]
    }
    return jsonify(data)

# API route that accepts JSON
@app.route('/api/submit', methods=['POST'])
def submit_data():
    data = request.get_json()
    
    # Process the data (e.g., save to database)
    
    return jsonify({'success': True, 'message': 'Data received successfully'})

# API route with parameters
@app.route('/api/items/<int:item_id>')
def get_item(item_id):
    # In a real app, fetch the item from a database
    item = {'id': item_id, 'name': f'Item {item_id}'}
    return jsonify(item)
```

```javascript
// Client-side code for AJAX (using vanilla JavaScript)
// Fetch data from API
function fetchData() {
    fetch('/api/data')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // Process the data
            const itemsList = document.getElementById('items-list');
            itemsList.innerHTML = '';
            
            data.items.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item.name;
                li.setAttribute('data-id', item.id);
                itemsList.appendChild(li);
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

// Submit data to API
function submitData(event) {
    event.preventDefault();
    
    const form = event.target;
    const formData = new FormData(form);
    const data = {};
    
    for (const [key, value] of formData.entries()) {
        data[key] = value;
    }
    
    fetch('/api/submit', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(result => {
        if (result.success) {
            showMessage(result.message, 'success');
            form.reset();
        } else {
            showMessage(result.message, 'error');
        }
    })
    .catch(error => {
        console.error('Error submitting data:', error);
        showMessage('An error occurred while submitting the form', 'error');
    });
}

// Show message to user
function showMessage(message, type) {
    const messageElement = document.getElementById('message');
    messageElement.textContent = message;
    messageElement.className = type;
    messageElement.style.display = 'block';
    
    setTimeout(() => {
        messageElement.style.display = 'none';
    }, 3000);
}

// Load data when page loads
document.addEventListener('DOMContentLoaded', fetchData);

// Add event listener to form
const form = document.getElementById('data-form');
if (form) {
    form.addEventListener('submit', submitData);
}
```
