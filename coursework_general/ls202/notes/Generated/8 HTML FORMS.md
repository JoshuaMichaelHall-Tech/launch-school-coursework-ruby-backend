<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Forms Study Guide</title>
    <style>
        body {
            font-family: system-ui, -apple-system, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .example {
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 20px;
            margin: 20px 0;
        }
        code {
            background-color: #f0f0f0;
            padding: 2px 4px;
            border-radius: 3px;
            font-family: monospace;
        }
        h2 {
            color: #2c5282;
            margin-top: 2em;
        }
        dl {
            background-color: #fff;
            padding: 20px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        dt {
            font-weight: bold;
            color: #2c5282;
        }
        dd {
            margin-left: 20px;
            margin-bottom: 1em;
        }
    </style>
</head>
<body>
    <h1>HTML Forms Study Guide</h1>

    <h2>1. The Form Tag</h2>
    <p>The <code>&lt;form&gt;</code> tag is the container for all form elements. Key attributes include:</p>
    <dl>
        <dt>action</dt>
        <dd>Specifies where to send the form data when submitted</dd>
        <dt>method</dt>
        <dd>Defines how to send the data (GET or POST)</dd>
    </dl>

    <div class="example">
        <h4>Basic Form Structure:</h4>
        <pre><code>&lt;form action="/submit" method="post"&gt;
    &lt;!-- Form elements go here --&gt;
&lt;/form&gt;</code></pre>
    </div>

    <h2>2. Input Types</h2>
    <p>The <code>&lt;input&gt;</code> element is versatile and can create different form controls based on its type attribute:</p>

    <div class="example">
        <h4>Live Examples:</h4>
        <form>
            <dl>
                <dt>Text Input</dt>
                <dd><input type="text" placeholder="Regular text input"></dd>

                <dt>Email Input</dt>
                <dd><input type="email" placeholder="email@example.com"></dd>

                <dt>Password Input</dt>
                <dd><input type="password" placeholder="Password"></dd>

                <dt>Tel Input</dt>
                <dd><input type="tel" placeholder="(123) 456-7890"></dd>

                <dt>Checkbox</dt>
                <dd>
                    <label>
                        <input type="checkbox"> Remember me
                    </label>
                </dd>

                <dt>Radio Buttons</dt>
                <dd>
                    <label>
                        <input type="radio" name="option" value="1"> Option 1
                    </label><br>
                    <label>
                        <input type="radio" name="option" value="2"> Option 2
                    </label>
                </dd>
            </dl>
        </form>
    </div>

    <h2>3. Text Areas</h2>
    <p>The <code>&lt;textarea&gt;</code> element creates a multi-line text input:</p>

    <div class="example">
        <textarea rows="4" cols="50" placeholder="Enter multiple lines of text here..."></textarea>
    </div>

    <h2>4. Selection Lists</h2>
    <p>The <code>&lt;select&gt;</code> element creates dropdown lists:</p>

    <div class="example">
        <h4>Single Selection:</h4>
        <select>
            <option value="">Choose an option</option>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
        </select>

        <h4>Multiple Selection:</h4>
        <select multiple>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
        </select>
    </div>

    <h2>5. Labels</h2>
    <p>Labels can be implemented in two ways:</p>

    <div class="example">
        <h4>Container Format:</h4>
        <label>
            Username:
            <input type="text">
        </label>

        <h4>For Attribute Format:</h4>
        <label for="password">Password:</label>
        <input type="password" id="password">
    </div>

    <h2>6. Description Lists in Forms</h2>
    <p>Description lists (<code>&lt;dl&gt;</code>) can help organize form elements:</p>

    <div class="example">
        <form>
            <dl>
                <dt>Username</dt>
                <dd><input type="text"></dd>

                <dt>Email</dt>
                <dd><input type="email"></dd>

                <dt>Comments</dt>
                <dd><textarea></textarea></dd>
            </dl>
        </form>
    </div>

    <h2>7. Form Buttons</h2>
    <div class="example">
        <button type="submit">Submit</button>
        <button type="reset">Reset</button>
    </div>

    <h2>Key Points to Remember</h2>
    <dl>
        <dt>Checkboxes vs Radio Buttons</dt>
        <dd>Checkboxes allow multiple selections, while radio buttons (with the same name) only allow one selection</dd>

        <dt>Hidden Inputs</dt>
        <dd>Used to pass data that shouldn't be visible or modified by users: <code>&lt;input type="hidden" name="user_id" value="123"&gt;</code></dd>

        <dt>Label Benefits</dt>
        <dd>Labels improve accessibility and usability by increasing the clickable area for form controls</dd>

        <dt>Form Validation</dt>
        <dd>Many input types (email, tel, etc.) provide built-in validation on modern browsers</dd>
    </dl>
</body>
</html>
