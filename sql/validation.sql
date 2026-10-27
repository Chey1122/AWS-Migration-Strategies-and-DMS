
USE migration_project;

-- Check migrated record count
SELECT COUNT(*) AS total_students
FROM students;

-- Verify all records
SELECT *
FROM students
ORDER BY student_id;

-- Verify unique student IDs
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT student_id) AS unique_ids
FROM students;

-- Verify department-wise data
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department;
