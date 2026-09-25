# Day 8 - Laravel API and SQL Database

## Project Overview

This project demonstrates database design, SQL queries, and RESTful API development using Laravel.

## Technologies Used

- PHP
- Laravel
- SQLite
- SQL
- REST API

## Database Tables

The project contains the following tables:

- users
- departments
- employees
- facilities
- inspections
- complaints

## API Modules

### Facilities

CRUD operations are available for facilities.

Endpoints:

GET /api/facilities
POST /api/facilities
GET /api/facilities/{id}
PUT /api/facilities/{id}
DELETE /api/facilities/{id}

### Inspections

CRUD operations are available for inspections.

Endpoints:

GET /api/inspections
POST /api/inspections
GET /api/inspections/{id}
PUT /api/inspections/{id}
DELETE /api/inspections/{id}

### Complaints

CRUD operations are available for complaints.

Endpoints:

GET /api/complaints
POST /api/complaints
GET /api/complaints/{id}
PUT /api/complaints/{id}
DELETE /api/complaints/{id}

## Database Relationships

- Employees belong to Departments.
- Inspections belong to Facilities.
- Complaints belong to Facilities.

## SQL

The `sql/queries.sql` file contains SQL queries for:

- Retrieving facilities
- Filtering active facilities
- Joining inspections with facilities
- Joining complaints with facilities
- Counting complaints by status
- Calculating average cleanliness scores
- Counting inspections by facility

## Project Structure

day-08/

├── sql/

│   └── queries.sql

├── database/

│   └── database.sqlite

├── laravel-api/

│   ├── app/

│   ├── database/

│   ├── routes/

│   └── ...

└── README.md