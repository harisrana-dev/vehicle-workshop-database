# Vehicle Service Workshop Database Project

## Overview
This project implements a **database system for a Vehicle Service Workshop**, tracking customers, vehicles, mechanics, services, service orders, payments, and related operations. It demonstrates core SQL concepts including table creation, data insertion, joins, views, aggregate functions, indexing, and query optimization.

---

## Database Structure

### Tables
- **customers** – Stores customer information.
- **vehicles** – Tracks vehicles owned by customers.
- **mechanics** – Contains mechanic details.
- **services** – Details of available services.
- **service_orders** – Records service orders linked to vehicles and mechanics.
- **service_items** – Items/services included in each order.
- **payments** – Payment details for each order.

### Views
- **customer_vehicle_view** – Shows customer and their vehicle information.
- **service_order_details** – Simplifies service order information.
- **order_total_bill** – Calculates total bill per service order.

### Indexes
- Optimized queries using indexes on `vehicles.customer_id`, `service_orders.vehicle_id`, `service_orders.mechanic_id`, `service_items.order_id`, and `payments.order_id`.

---

## Project Files

| File | Description |
|------|-------------|
| `schema.sql` | Contains all `CREATE DATABASE`, `CREATE TABLE`, `ALTER TABLE`, and index statements. |
| `data.sql` | Contains `INSERT` statements for sample data in all tables. |
| `queries.sql` | Contains all `SELECT`, `UPDATE`, `DELETE`, view creation, and aggregate queries. |
| `README.md` | This file – project overview and usage instructions. |

---

## How to Use

1. Make sure you have **MySQL** or **MariaDB** installed and running.
2. Open your SQL environment (MySQL CLI, Workbench, or any GUI).
3. Import the schema first to create the database and tables:
   ```sql
   source schema.sql;
4. Load the sample data:
   ```sql
   source data.sql;
5. Run queries and views to test functionality:
   ```sql
   source queries.sql;

---

## Features
- Track customers, vehicles, mechanics, and service orders.
- Maintain service items and calculate total bills per order.
- Store payment information and generate reports.
- Use views to simplify complex queries.
- Aggregate functions and grouping for summary reports.
- Indexing for faster query execution
   
