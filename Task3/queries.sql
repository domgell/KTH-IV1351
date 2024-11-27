-- 1. Number of lessons given per month during a specific year
SELECT
    TO_CHAR(lesson_date, 'Month') AS "Month",
    COUNT(*) AS "Total",
    COUNT(*) FILTER (WHERE lesson_type = 'ensemble') AS "Ensemble",
    COUNT(*) FILTER (WHERE lesson_type = 'group') AS "Group",
    COUNT(*) FILTER (WHERE lesson_type = 'individual') AS "Individual"
FROM
    lesson
WHERE
    EXTRACT(YEAR FROM lesson_date) = 2024 -- Set specific year
GROUP BY
    "Month"
ORDER BY
    MIN(lesson_date);


-- 2. Number of students with 0, 1 and 2 siblings
WITH sibling_groups AS (
	SELECT 
		sibling_id, 
		COUNT(*) - 1 AS num_siblings
	FROM student
	GROUP BY sibling_id
)

SELECT 
    COALESCE(num_siblings, 0) AS "No. of siblings",
    COUNT(*) AS "No. of students"
FROM student LEFT JOIN sibling_groups USING (sibling_id)
GROUP BY "No. of siblings"
ORDER BY "No. of siblings";


-- 3. Instructors who have given more than a specific number of lessons
SELECT 
    instructor.instructor_id as "Instructor Id",
    first_name as "First Name", 
    last_name as "Last Name", 
    COUNT(lesson_id) AS "No. of Lessons"
FROM 
    instructor JOIN lesson USING (instructor_id)
WHERE 
    EXTRACT(MONTH FROM lesson_date) = 11 -- Set specific month (ex. 11 = November)
    AND EXTRACT(YEAR FROM lesson_date) = 2024 -- Set specific year
GROUP BY 
    instructor_id, first_name, last_name
HAVING 
    COUNT(lesson_id) > 2; -- Set minimum number of lessons

-- 4. All ensembles next week with number of free slots
SELECT 
    TO_CHAR(lesson_date, 'Day') as "Day",
	genre as "Genre",
	CASE
        WHEN max_participants - COUNT(student_id) = 0 THEN 'No Seats'
        WHEN max_participants - COUNT(student_id) IN (1, 2) THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No. of Free Seats"
FROM
    ensemble_lesson JOIN lesson USING (lesson_id)
	LEFT JOIN lesson_attendance USING (lesson_id)
WHERE 
    lesson_date BETWEEN '2024-11-23' AND '2024-11-30' -- Specify date range
GROUP BY 
    lesson_id, genre, max_participants, lesson_date, scheduled_time
ORDER BY 
    lesson_date, scheduled_time;