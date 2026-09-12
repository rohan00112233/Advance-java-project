# Food Ordering Management System

A simple web-based Food Ordering Management System developed using Java, JSP, Servlets, JDBC and MySQL.

The system provides separate functionality for Users and Admins. Users can view food items and manage their cart, while Admins can manage food items through add, update and delete operations.

---

## Features

### User Features

- User login
- View available food items
- Add food items to cart
- View cart
- Session-based cart management
- User-only access to user pages

### Admin Features

- Admin login
- View all food items
- Add new food items
- Update food items
- Delete food items
- Admin-only access to admin pages

### Authentication and Authorization

- Login authentication using username and password
- User and Admin roles
- Session-based authentication
- Role-based authorization
- Servlet Filters for protecting User and Admin pages
- Unauthorized users are redirected to the login page

---

## Technologies Used

| Technology | Purpose |

|---|---|

| Java 25 | Programming language |

| JSP | User interface |

| Servlets | Request handling and controller logic |

| JDBC | Database connectivity |

| MySQL | Database |

| Apache Tomcat 10.1 | Web server |

| Eclipse | Development IDE |

| HTML/CSS | Front-end design |

| Git/GitHub | Version control |

---

## Architecture

The project follows a **3-Tier MVC architecture** with the **DAO pattern**.

The application is divided into the following layers:

- **Presentation Layer** – JSP pages for the user interface
- **Controller Layer** – Servlets for handling HTTP requests
- **Model Layer** – Java classes representing application data
- **DAO Layer** – Database access operations
- **Database Layer** – MySQL for persistent data storage
- **Security Layer** – Servlet Filters and HTTP Sessions for authentication and authorization

### Overall System Architecture

```text
                         USER / ADMIN
                              |
                              | HTTP Request
                              v
                    +----------------------+
                    |     JSP / Browser    |
                    |   Presentation Layer |
                    +----------+-----------+
                               |
                               v
                    +----------------------+
                    |    Servlet Filters   |
                    | Authentication &     |
                    | Role Authorization   |
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
          | UserFood       |    | AdminFood         |
          | FoodDetails    |    | AddFood           |
          | AddToCart      |    | EditFood          |
          | Cart           |    | DeleteFood        |
          | Login          |    |                   |
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
                    |    JDBC Utility      |
                    +----------+-----------+
                               |
                               v
                    +----------------------+
                    |    MySQL Database    |
                    |                      |
                    | food table           |
                    | users table          |
                    +----------------------+