-- Day 8 Database Schema

CREATE TABLE departments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_id INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

CREATE TABLE facilities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(150) NOT NULL,
    location VARCHAR(150) NOT NULL,
    type VARCHAR(100) NOT NULL,
    status VARCHAR(50) DEFAULT 'Active'
);

CREATE TABLE inspections (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    facility_id INTEGER NOT NULL,
    inspection_date DATE NOT NULL,
    cleanliness_score DECIMAL(5,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    remarks TEXT,
    FOREIGN KEY (facility_id) REFERENCES facilities(id)
);

CREATE TABLE complaints (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    facility_id INTEGER NOT NULL,
    complaint_type VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'Open',
    complaint_date DATE NOT NULL,
    FOREIGN KEY (facility_id) REFERENCES facilities(id)
);

CREATE INDEX idx_employees_department
ON employees(department_id);

CREATE INDEX idx_inspections_facility
ON inspections(facility_id);

CREATE INDEX idx_complaints_facility
ON complaints(facility_id);
-- Sample Data

INSERT INTO departments (name) VALUES
('Human Resources'),
('Information Technology'),
('Operations');

INSERT INTO employees (department_id, name, email, salary) VALUES
(1, 'Aarav Sharma', 'aarav@example.com', 45000),
(2, 'Priya Patil', 'priya@example.com', 60000),
(2, 'Rahul Deshmukh', 'rahul@example.com', 55000),
(3, 'Sneha Joshi', 'sneha@example.com', 50000);

INSERT INTO facilities (name, location, type, status) VALUES
('Central Facility', 'Amravati', 'Public Facility', 'Active'),
('North Facility', 'Nagpur', 'Healthcare Facility', 'Active'),
('South Facility', 'Yavatmal', 'Educational Facility', 'Inactive');

INSERT INTO inspections
(facility_id, inspection_date, cleanliness_score, status, remarks)
VALUES
(1, '2026-09-20', 8.5, 'Passed', 'Good overall cleanliness'),
(2, '2026-09-21', 6.0, 'Needs Improvement', 'Waste management needs attention'),
(3, '2026-09-22', 4.5, 'Failed', 'Poor cleanliness observed');

INSERT INTO complaints
(facility_id, complaint_type, description, status, complaint_date)
VALUES
(1, 'Cleanliness', 'Dust and waste found in common area', 'Open', '2026-09-20'),
(2, 'Maintenance', 'Water facility requires repair', 'Resolved', '2026-09-21'),
(2, 'Cleanliness', 'Waste bins were overflowing', 'Open', '2026-09-22'),
(3, 'Sanitation', 'Washroom requires cleaning', 'Open', '2026-09-23');