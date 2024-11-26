-- Insert an instructor
INSERT INTO instructor (
    can_teach_ensemble, 
    is_available, 
    first_name, 
    last_name, 
    person_number
) VALUES (
    true, 
    true, 
    'Maria', 
    'Andersson', 
    '198501152345'
) RETURNING instructor_id;

-- Insert the instructor's instruments
INSERT INTO instructor_taught_instruments (
    instructor_id, 
    instrument_type
) VALUES 
    ((SELECT instructor_id FROM instructor WHERE person_number = '198501152345'), 'Piano'),
    ((SELECT instructor_id FROM instructor WHERE person_number = '198501152345'), 'Guitar');

-- Insert students
INSERT INTO student (
    street, 
    city, 
    zip, 
    first_name, 
    last_name, 
    person_number
) VALUES 
    ('Storgatan 10', 'Stockholm', '11230', 'Erik', 'Larsson', '200101101234'),
    ('Kungsgatan 5', 'Gothenburg', '41118', 'Sofia', 'Nilsson', '200205202345'),
    ('Drottninggatan 15', 'Malmö', '21120', 'Lucas', 'Gustafsson', '200307303456');

-- Individual Lesson
WITH new_lesson AS (
    INSERT INTO lesson (
        lesson_date, 
        instructor_id, 
        lesson_type
    ) VALUES (
        CURRENT_DATE, 
        (SELECT instructor_id FROM instructor WHERE person_number = '198501152345'), 
        'individual'
    ) RETURNING lesson_id
)
INSERT INTO individual_lesson (
    lesson_id, 
    appointment_time, 
    instrument_type
) SELECT 
    lesson_id, 
    '14:00', 
    'Piano'
FROM new_lesson;

-- Add students to individual lesson
INSERT INTO lesson_student (
    lesson_id, 
    student_id
) VALUES (
    (SELECT lesson_id FROM lesson WHERE lesson_type = 'individual' ORDER BY lesson_id DESC LIMIT 1),
    (SELECT student_id FROM student WHERE person_number = '200101101234')
);