-- Insert instructors
INSERT INTO instructor (can_teach_ensemble, is_available, first_name, last_name, person_number) VALUES
    (TRUE, TRUE, 'Alice', 'Johnson', '123456789012'),
    (FALSE, TRUE, 'Bob', 'Smith', '234567890123'),
    (TRUE, FALSE, 'Carla', 'Davis', '345678901234'),
    (FALSE, FALSE, 'David', 'Wilson', '456789012345'),
    (TRUE, TRUE, 'Emma', 'Brown', '567890123456');

-- Set instructor taught instruments
INSERT INTO instructor_taught_instruments (instructor_id, instrument_type)
VALUES 
    (1, 'Piano'),
    (1, 'Violin'),
    (2, 'Guitar'),
    (3, 'Drums'),
    (3, 'Percussion'),
    (4, 'Trumpet'),
    (5, 'Cello'),
    (5, 'Viola');


-- Insert students
INSERT INTO student (street, city, zip, first_name, last_name, person_number, sibling_id)
VALUES 
    -- No siblings
    ('123 Maple Street', 'Springfield', '12345', 'Ethan', 'Walker', '101112131415', NULL),
    ('456 Oak Avenue', 'Greendale', '67890', 'Sophia', 'Johnson', '202122232425', NULL),
    ('789 Pine Lane', 'Hillside', '54321', 'Olivia', 'Smith', '303132333435', NULL),
    -- Sibling group 1
    ('123 Maple Street', 'Springfield', '12345', 'Ella', 'Walker', '404142434445', 1),
    ('999 Birch Road', 'Sunnyvale', '98765', 'Liam', 'Brown', '505152535455', 1),
    -- Sibling group 2
    ('Storgatan 10', 'Stockholm', '11230', 'Erik', 'Larsson', '200101101234', 2),
    ('Kungsgatan 5', 'Gothenburg', '41118', 'Sofia', 'Nilsson', '200205202345', 2),
    ('Drottninggatan 15', 'Malmö', '21120', 'Lucas', 'Gustafsson', '200307303456', 2);

-- 3 students with 0 siblings, 2 students with 1 sibling, 3 students with 2 siblings

-- Insert lessons
INSERT INTO lesson (lesson_date, instructor_id, lesson_type)
VALUES
-- November lessons
('2024-11-29', 1, 'ensemble'),
('2024-11-12', 2, 'group'),
('2024-11-15', 3, 'individual'),
('2024-11-20', 4, 'group'),
('2024-11-27', 5, 'ensemble'),
('2024-11-28', 1, 'ensemble'),
('2024-11-08', 2, 'group'),
('2024-11-11', 3, 'individual'),
('2024-11-18', 3, 'group'),
('2024-11-25', 3, 'individual'),
('2024-11-02', 2, 'ensemble'),
('2024-11-07', 2, 'group'),
('2024-11-10', 2, 'individual'),
('2024-11-27', 2, 'ensemble'),
('2024-11-20', 2, 'group'),
('2024-11-01', 1, 'group'),
('2024-11-04', 2, 'ensemble'),
('2024-11-09', 3, 'individual'),
('2024-11-13', 4, 'group'),
('2024-11-18', 5, 'individual'),
-- December lessons
('2024-12-10', 2, 'individual'),
('2024-12-27', 2, 'ensemble'),
('2024-12-20', 2, 'group'),
('2024-12-01', 1, 'group'),
('2024-12-04', 2, 'ensemble'),
('2024-12-09', 3, 'individual'),
('2024-12-13', 4, 'group'),
('2024-12-18', 5, 'individual'),
-- January lessons
('2025-01-10', 2, 'individual'),
('2025-01-20', 2, 'group'),
('2025-01-01', 1, 'group'),
('2025-01-09', 3, 'individual'),
('2025-01-13', 4, 'group'),
('2025-01-18', 5, 'individual');

-- Insert ensemble lessons
INSERT INTO ensemble_lesson (lesson_id, genre, max_participants, min_participants, scheduled_time)
VALUES
    (1, 'Classical', 20, 5, '10:00:00'),
    (5, 'Jazz', 15, 5, '14:00:00'),       
    (6, 'Rock', 8, 2, '16:00:00'),
    (11, 'Jazz', 15, 5, '17:00:00'),
    (14, 'Classical', 20, 10, '8:00:00'),
    (17, 'Rock', 15, 5, '12:00:00');

-- Insert students to attend ensemble lessons
INSERT INTO lesson_attendance (lesson_id, student_id)
VALUES
    -- Lesson 1
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    -- Lesson 5
    (5, 1),
    (5, 2),
    (5, 3),
    (5, 4),
    (5, 5),
    (5, 6),
    (5, 7),
    (5, 8),
    -- Lesson 6
    (6, 1),
    (6, 2),
    (6, 3),
    (6, 4),
    (6, 5),
    (6, 6),
    (6, 7),
    (6, 8),
    -- Lesson 11
    (11, 1),
    (11, 2),
    (11, 3),
    (11, 4),
    (11, 5),
    (11, 6),
    (11, 7),
    (11, 8);
