-- Day 8 SQL Queries

-- 1. Display all facilities
SELECT * FROM facilities;

-- 2. Display active facilities
SELECT * FROM facilities
WHERE status = 'Active';

-- 3. Display inspections with facility names
SELECT
    inspections.id,
    facilities.name AS facility_name,
    inspections.inspection_date,
    inspections.cleanliness_score,
    inspections.status,
    inspections.remarks
FROM inspections
JOIN facilities
    ON inspections.facility_id = facilities.id;

-- 4. Display complaints with facility names
SELECT
    complaints.id,
    facilities.name AS facility_name,
    complaints.complaint_type,
    complaints.description,
    complaints.status,
    complaints.complaint_date
FROM complaints
JOIN facilities
    ON complaints.facility_id = facilities.id;

-- 5. Count complaints by status
SELECT
    status,
    COUNT(*) AS total_complaints
FROM complaints
GROUP BY status;

-- 6. Average cleanliness score by facility
SELECT
    facilities.name AS facility_name,
    AVG(inspections.cleanliness_score) AS average_cleanliness_score
FROM inspections
JOIN facilities
    ON inspections.facility_id = facilities.id
GROUP BY facilities.id, facilities.name;

-- 7. Count inspections by facility
SELECT
    facilities.name AS facility_name,
    COUNT(inspections.id) AS total_inspections
FROM facilities
LEFT JOIN inspections
    ON facilities.id = inspections.facility_id
GROUP BY facilities.id, facilities.name;