# iiiPlay Online Shop

A full-stack e-commerce web application built with Java Spring MVC, featuring product browsing, shopping cart, order management, and payment integration.

## Tech Stack

- **Backend**: Java, Spring MVC, JDBC, JavaMail API
- **Frontend**: JSP, JSTL, HTML, CSS, JavaScript, jQuery, AJAX
- **Database**: SQL Server
- **Payment**: ECPay payment integration

## Features

### User
- Member registration, login, and session management
- User profile with avatar display
- Logout functionality

### Product
- Product listing with images loaded from database
- Category and brand filtering
- Price range filter (AJAX)
- Stock status checking — "Add to Cart" disabled when sold out
- Hot products and new arrivals display

### Shopping Cart
- Add products to cart
- Real-time cart item count update via AJAX
- Prevent adding out-of-stock products

### Wishlist
- Add / remove products from wishlist
- Real-time wishlist icon status update via AJAX

### Order System
- Checkout form with auto-fill address fields
- Address and email format validation
- Save and display order history
- Order details: order number, recipient, date, address, total amount, payment status

### Email Notification
- Automatic order confirmation email after checkout
- Implemented with JavaMail API and Gmail App Password

## Database Schema

SQL schema files are included in the root directory:

| File | Description |
|------|-------------|
| `dbo.products.Table.sql` | Products table |
| `dbo.orders.Table.sql` | Orders table |
| `dbo.orderitem.Table.sql` | Order items table |
| `dbo.pdcollect.Table.sql` | Wishlist table |
| `dbo.Click.Table.sql` | Product click tracking |
| `dbo.Reply.Table.sql` | Product reviews |
| `member0531.sql` | Member table |

## Architecture

MVC architecture with Spring MVC framework, DAO pattern for database access, and Service layer for business logic separation.

## Project Summary

This project demonstrates a complete full-stack online shop built with Java Spring MVC and JSP. It integrates AJAX for dynamic page updates, JavaMail for email confirmation, ECPay for payment processing, and SQL Server for data persistence.
