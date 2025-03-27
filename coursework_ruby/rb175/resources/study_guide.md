# RB175: Networked Applications - Study Guide

## Core Web Development Concepts

### 1. HTTP and the Web
- **Request/Response Cycle**: Understanding how clients and servers communicate
- **HTTP Methods**: GET, POST, and their appropriate use cases
- **Status Codes**: Understanding and using appropriate response codes
- **Headers**: Common request and response headers
- **URL Components**: Structure and purpose of different URL parts

### 2. Server-Side Processing
- **Request Handling**: Reading and parsing HTTP requests
- **Response Generation**: Creating appropriate HTTP responses
- **Web Servers vs. Application Servers**: Differences and relationships
- **Server-Side Languages**: Role of Ruby in web development
- **Request Flow**: Tracing requests through the application stack

### 3. Routing
- **URL Patterns**: Mapping URLs to application code
- **Route Parameters**: Extracting information from URLs
- **Query Parameters**: Processing data from URLs
- **HTTP Method Routing**: Handling different request methods
- **Nested Resources**: Organizing related resources

### 4. Templates and Views
- **ERB Basics**: Embedding Ruby in HTML
- **Template Rendering**: Processing templates into responses
- **Layouts**: Creating consistent page structures
- **Partials**: Reusing view components
- **View Helpers**: Simplifying view logic

### 5. State Management
- **HTTP Statelessness**: Challenges and solutions
- **Sessions**: Server-side state storage
- **Cookies**: Client-side state storage
- **Flash Messages**: Temporary state for user feedback
- **Application State**: Managing data between requests

### 6. Security
- **Input Validation**: Ensuring valid data
- **Input Sanitization**: Preventing XSS and injection
- **Authentication**: User identity verification
- **Session Security**: Protecting user sessions
- **General Web Security**: Common vulnerabilities and protections

## Deep Dive Topics

### Rack
- **Rack Specification**: Understanding the interface
- **Middleware Concept**: How middleware intercepts requests
- **Rack Applications**: Structure and requirements
- **Rack Environment**: Request information in the env hash
- **Rack Response**: Format and requirements

### Project Structure
- **MVC Pattern**: Organizing code by responsibility
- **File Organization**: Conventional directory structure
- **Configuration Management**: Environment-specific settings
- **Dependencies**: Managing external libraries
- **Asset Organization**: Handling static files

### View Rendering
- **Template Languages**: ERB, Erubis
- **HTML Generation**: Creating valid markup
- **Dynamic Content**: Inserting variables into templates
- **Conditional Rendering**: Showing/hiding elements
- **Iteration in Views**: Rendering collections

### Form Processing
- **Form Structure**: HTML form elements
- **Data Submission**: GET vs. POST forms
- **File Uploads**: Handling uploaded files
- **Form Validation**: Checking submitted data
- **Error Handling**: Displaying validation errors

### Deployment
- **Environment Preparation**: Development vs. production
- **Server Configuration**: Setting up web servers
- **Hosting Options**: PaaS vs. IaaS
- **Deployment Process**: Getting code to production
- **Monitoring and Maintenance**: Keeping applications running

## Application Development Focus

### Building RESTful Web Applications
- **Resource Identification**: Modeling domain entities
- **URL Design**: Creating intuitive, consistent URLs
- **HTTP Method Selection**: Matching methods to actions
- **Response Formats**: Returning appropriate content
- **Status Code Usage**: Communicating outcomes

### Implementing Separation of Concerns
- **Route Handlers**: Directing requests
- **Business Logic**: Core application functionality
- **Data Access**: Reading and writing data
- **Presentation Logic**: Formatting output
- **Error Handling**: Graceful failure recovery

### Managing Data Persistence
- **File-Based Storage**: Reading and writing files
- **Database Integration**: Using databases with web apps
- **Data Serialization**: Converting objects to storable formats
- **Caching**: Improving performance
- **Data Integrity**: Ensuring consistent data

### Handling Validation and Errors
- **Input Validation**: Checking user input
- **Error Messages**: User-friendly notifications
- **Error Handling**: Graceful recovery from problems
- **Logging**: Recording application events
- **Debugging Techniques**: Solving application issues

### Creating User-Friendly Interfaces
- **Usability Principles**: Making intuitive interfaces
- **Feedback Mechanisms**: Informing users of actions
- **Navigation Design**: Helping users move through the app
- **Form Design**: Creating effective input methods
- **Accessibility**: Making applications usable by all

### Securing Applications
- **Authentication Systems**: User login/logout
- **Authorization**: Controlling access to features
- **CSRF Protection**: Preventing cross-site request forgery
- **XSS Prevention**: Escaping user-generated content
- **Secure Coding Practices**: Writing secure code
