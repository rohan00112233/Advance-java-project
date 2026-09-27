
# FoodFlow - Food Ordering Management System

FoodFlow is a Java-based web application for managing food ordering operations. 
The application provides separate functionality for customers and administrators 
using JSP, Servlets, JDBC, MySQL, HTTP Sessions, and Servlet Filters.

The project follows a simple MVC architecture with the DAO design pattern and 
is developed as a learning project to understand Java web application development.

---

## Features

### Customer Features

- User registration
- User login
- Personalized user interface with logged-in username
- View available food items
- View food category and price
- Check food availability
- Add available food items to cart
- View shopping cart
- Session-based cart management
- User-specific session management
- Protected user pages using Servlet Filters

### Admin Features

- Admin login
- View all food items
- Add new food items
- Update existing food items
- Delete food items
- Manage food availability
- Admin-only access using role-based authorization

### Authentication & Authorization

- Username and password authentication
- User registration with unique username
- USER and ADMIN roles
- HTTP Session-based authentication
- Role-based authorization
- Servlet Filters for protecting application pages
- Unauthorized users are redirected to the login page

---

## Technologies Used

| Technology | Purpose |
|---|---|
| Java 25 | Backend programming |
| JSP | User interface |
| Servlets | Request handling and controller logic |
| JDBC | Database connectivity |
| MySQL | Database management |
| Apache Tomcat 10.1 | Web server |
| HTML5 | Page structure |
| CSS3 | User interface styling |
| Eclipse Enterprise | Development environment |
| Git | Version control |
| GitHub | Source code hosting |

---

## Architecture

The project follows a **3-Tier MVC Architecture** with the **DAO Pattern**.

```text
                         USER / ADMIN
                              |
                              | HTTP Request
                              v
                    +----------------------+
                    |      JSP Pages       |
                    |   Presentation Layer |
                    +----------+-----------+
                               |
                               v
                    +----------------------+
                    |   Servlet Filters    |
                    | Authentication and   |
                    | Role Authorization    |
                    +----------+-----------+
                               |
                    +----------+----------+
                    |                     |
                USER ROLE              ADMIN ROLE
                    |                     |
                    v                     v
          +----------------+    +-------------------+
          | User Servlets  |    |  Admin Servlets   |
          |                |    |                   |
          | Login          |    | AdminFood         |
          | UserFood       |    | AddFood           |
          | AddToCart      |    | EditFood          |
          | Cart           |    | DeleteFood        |
          +-------+--------+    +---------+---------+
                  |                       |
                  +-----------+-----------+
                              |
                              v
                    +----------------------+
                    |       DAO Layer      |
                    |                      |
                    | FoodDAO              |
                    | UserDAO              |
                    +----------+-----------+
                               |
                               | JDBC
                               v
                    +----------------------+
                    |    DBConnection      |
                    +----------+-----------+
                               |
                               v
                    +----------------------+
                    |    MySQL Database    |
                    |                      |
                    | food                 |
                    | users                |
                    +----------------------+
````

---

## MVC Architecture

```text
+--------------------------------------------------+
|                    VIEW                          |
|                                                  |
| index.jsp                                        |
| login.jsp                                        |
| register.jsp                                     |
| user-menu.jsp                                    |
| cart.jsp                                         |
| admin-food.jsp                                   |
| add-food.jsp                                     |
| edit-food.jsp                                    |
+-------------------------+------------------------+
                          |
                          v
+--------------------------------------------------+
|                  CONTROLLER                      |
|                                                  |
| LoginServlet                                     |
| RegisterServlet                                  |
| UserFoodServlet                                  |
| AddToCartServlet                                 |
| CartServlet                                      |
| AdminFoodServlet                                 |
| AddFoodServlet                                   |
| EditFoodServlet                                  |
| DeleteFoodServlet                                |
+-------------------------+------------------------+
                          |
                          v
+--------------------------------------------------+
|                     DAO                          |
|                                                  |
| FoodDAO                                          |
| UserDAO                                          |
+-------------------------+------------------------+
                          |
                          v
+--------------------------------------------------+
|                   DATABASE                       |
|                                                  |
|                   MySQL                          |
|                                                  |
|       +-----------------------------+            |
|       | food        | users         |            |
|       +-----------------------------+            |
+--------------------------------------------------+
```

---

## Authentication Flow

```text
                    Login / Registration
                            |
                            v
                 LoginServlet / RegisterServlet
                            |
                            v
                         UserDAO
                            |
                            v
                     MySQL users
                            |
                            v
                       User Object
                            |
                            v
                      HTTP Session
                            |
                  +---------+---------+
                  |                   |
              USER Role           ADMIN Role
                  |                   |
                  v                   v
          UserRoleFilter       AdminRoleFilter
                  |                   |
                  v                   v
            User Features       Admin Features
```

---

## Shopping Cart Flow

The shopping cart is maintained using the user's HTTP Session.

```text
User Menu
    |
    | Add to Cart
    v
AddToCartServlet
    |
    v
FoodDAO
    |
    v
Food Object
    |
    v
CartItem
    |
    v
HTTP Session
    |
    v
CartServlet
    |
    v
cart.jsp
```

The cart currently supports:

* Adding food items
* Maintaining quantity
* Calculating item total
* Calculating grand total
* Session-based cart storage

---

## Project Structure

```text
FoodOrderingManagementSystem
|
├── src/main/java
|   |
|   ├── controller
|   |   ├── AddFoodServlet.java
|   |   ├── AddToCartServlet.java
|   |   ├── AdminFoodServlet.java
|   |   ├── CartServlet.java
|   |   ├── DeleteFoodServlet.java
|   |   ├── EditFoodServlet.java
|   |   ├── FoodDetailsServlet.java
|   |   ├── LoginServlet.java
|   |   ├── RegisterServlet.java
|   |   └── UserFoodServlet.java
|   |
|   ├── dao
|   |   ├── FoodDAO.java
|   |   └── UserDAO.java
|   |
|   ├── filter
|   |   ├── AdminRoleFilter.java
|   |   └── UserRoleFilter.java
|   |
|   ├── model
|   |   ├── CartItem.java
|   |   ├── Food.java
|   |   └── User.java
|   |
|   ├── test
|   |   └── DAO testing classes
|   |
|   └── util
|       └── DBConnection.java
|
└── src/main/webapp
    ├── index.jsp
    ├── login.jsp
    ├── register.jsp
    ├── user-menu.jsp
    ├── food-details.jsp
    ├── cart.jsp
    ├── admin-food.jsp
    ├── add-food.jsp
    └── edit-food.jsp
```

---

## Database Setup

The application uses MySQL.

### Create Database

```sql
CREATE DATABASE food_ordering_db;

USE food_ordering_db;
```

### Food Table

```sql
CREATE TABLE food (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    availability VARCHAR(20) NOT NULL
);
```

### Users Table

```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);
```

---

## Sample Admin Account

For local development/testing, an administrator account can be created with:

```text
Username: admin
Password: admin123
Role: ADMIN
```

A normal customer account can be created through the registration page.

> These credentials are for local development/testing only.

---

## How to Run the Project

### 1. Clone the Repository

Clone the GitHub repository and import the project into Eclipse Enterprise.

### 2. Configure MySQL

Make sure MySQL Server is running.

Create the database:

```sql
CREATE DATABASE food_ordering_db;
```

Create the required `food` and `users` tables using the SQL commands above.

### 3. Configure Database Connection

Open:

```text
src/main/java/util/DBConnection.java
```

Configure the MySQL username and password according to your local environment.

Example:

```java
private static final String URL =
        "jdbc:mysql://localhost:3306/food_ordering_db";

private static final String USERNAME =
        "root";

private static final String PASSWORD =
        "your_mysql_password";
```

> Do not commit your actual MySQL password to a public GitHub repository.

### 4. Add MySQL Connector

Make sure MySQL Connector/J is available in:

```text
src/main/webapp/WEB-INF/lib
```

### 5. Configure Apache Tomcat

Use:

```text
Apache Tomcat 10.1
```

with Jakarta Servlet support.

### 6. Start the Application

Start Tomcat from Eclipse.

Open:

```text
http://localhost:8080/FoodOrderingManagementSystem/
```

---

## Application Flow

### New User

```text
Home
  |
  v
Login
  |
  v
Create New Account
  |
  v
Registration
  |
  v
User stored in MySQL
  |
  v
Login
  |
  v
User Food Menu
```

### Existing User

```text
Login
  |
  v
UserDAO
  |
  v
MySQL
  |
  v
HTTP Session
  |
  v
Personalized Food Menu
  |
  v
Add Food to Cart
  |
  v
Shopping Cart
```

### Admin

```text
Login
  |
  v
Admin Authentication
  |
  v
Admin Food Management
  |
  +--> Add Food
  |
  +--> View Food
  |
  +--> Update Food
  |
  +--> Delete Food
```

---

## Session Management

The application uses `HttpSession` for maintaining logged-in user information.

After successful login:

```java
HttpSession session = request.getSession();

session.setAttribute("user", user);
session.setAttribute("role", user.getRole());
```

The logged-in user's information can then be accessed by protected pages.

The shopping cart is also maintained using the HTTP session.

Tomcat normally identifies the session using a `JSESSIONID` cookie. The cookie contains the session identifier rather than the user's password or complete user information.

---

## Security

The project implements basic web application security concepts:

* Session-based authentication
* Role-based authorization
* Servlet Filters
* PreparedStatement for SQL queries
* Protected user pages
* Protected admin pages
* Unique usernames
* Session-based cart

### Production Improvements

The current project is designed for learning purposes.

For a production application, additional security should be implemented, including:

* Password hashing using BCrypt or Argon2
* Secure session configuration
* HTTPS
* CSRF protection
* Input validation
* Secure cookie configuration
* Environment variables for database credentials

---

## UI Features

FoodFlow includes a responsive user interface with:

* Personalized welcome message
* Food cards
* Food categories
* Food prices
* Availability status
* Add to Cart buttons
* Shopping cart summary
* Grand total
* Responsive layout
* Admin management pages
* Login and registration pages

---

## Learning Objectives

This project was developed to gain practical experience with:

* Core Java
* Advanced Java
* JSP
* Servlets
* JDBC
* MySQL
* MVC Architecture
* DAO Pattern
* HTTP Sessions
* Servlet Filters
* Authentication
* Authorization
* CRUD Operations
* Session-based Shopping Cart
* HTML and CSS
* Git and GitHub
* Apache Tomcat

---

## Future Enhancements

Possible future improvements include:

* Logout functionality
* Remove item from cart
* Update cart quantity
* Place order
* Order history
* Payment integration
* Password hashing
* Email notifications
* Admin dashboard
* Order management
* Food images
* Search and filter functionality
* Food category filtering
* Improved responsive design

---

## Project Status

The core FoodFlow application is implemented with:

* User registration
* User login
* Admin login
* Role-based authorization
* Food CRUD operations
* Session-based cart
* Personalized user interface
* Shopping cart interface
* MySQL database integration

---

## Author

**Rohan Shinde**

Java Web Development Project using JSP, Servlets, JDBC, MySQL and Apache Tomcat.

````
