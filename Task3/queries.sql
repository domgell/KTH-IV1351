-- 1. Number of lessons given per month during a specific year
SELECT
    TO_CHAR(lesson_date, 'Month') AS lesson_month,
    COUNT(*) AS total_lessons,
    SUM(CASE WHEN lesson_type = 'ensemble' THEN 1 ELSE 0 END) AS ensemble_lessons,
    SUM(CASE WHEN lesson_type = 'group' THEN 1 ELSE 0 END) AS group_lessons,
    SUM(CASE WHEN lesson_type = 'individual' THEN 1 ELSE 0 END) AS individual_lessons
FROM
    lesson
WHERE
    EXTRACT(YEAR FROM lesson_date) = 2024 -- Set specific year
GROUP BY
    lesson_month
ORDER BY
    MIN(lesson_date);


-- 2. Number of students with 0, 1 and 2 siblings
SELECT
    sibling_count - 1 AS "No. of Siblings",
    COUNT(*) AS "No. of Students"
FROM (
    SELECT
        s.student_id,
        COALESCE(g.sibling_group_size, 1) AS sibling_count
    FROM
        student s
    LEFT JOIN (
        SELECT
            sibling_id,
            COUNT(*) AS sibling_group_size
        FROM
            student
        WHERE sibling_id IS NOT NULL
        GROUP BY sibling_id
    ) g
    ON s.sibling_id = g.sibling_id
)
GROUP BY 
    "No. of Siblings"
ORDER BY 
    "No. of Siblings";


-- 3. Instructors who have given more than a specific number of lessons
SELECT 
    i.first_name, 
    i.last_name, 
    i.instructor_id,
    COUNT(l.lesson_id) AS num_lessons
FROM 
    instructor i
JOIN 
    lesson l ON i.instructor_id = l.instructor_id
WHERE 
    EXTRACT(MONTH FROM l.lesson_date) = 11 -- Set specific month (ex. 11 = November)
    AND EXTRACT(YEAR FROM l.lesson_date) = 2024 -- Set specific year
GROUP BY 
    i.instructor_id, i.first_name, i.last_name
HAVING 
    COUNT(l.lesson_id) > 2; -- Set minimum number of lessons


-- 4. All ensembles next week with number of free slots
SELECT 
    TO_CHAR(l.lesson_date, 'Day') as "Day",
	el.genre,
	CASE
        WHEN el.max_participants - COUNT(la.student_id) = 0 THEN 'No Seats'
        WHEN el.max_participants - COUNT(la.student_id) IN (1, 2) THEN '1 or 2 Seats'
        ELSE 'Many seats'
    END AS "No. of Free Seats"
FROM
    ensemble_lesson el
JOIN 
    lesson l ON el.lesson_id = l.lesson_id
LEFT JOIN 
    lesson_attendance la ON el.lesson_id = la.lesson_id
WHERE 
    l.lesson_date BETWEEN '2024-11-23' AND '2024-11-30'  -- Specify date range
GROUP BY 
    el.lesson_id, el.genre, el.max_participants, l.lesson_date, el.scheduled_time
ORDER BY 
    l.lesson_date, el.scheduled_time;