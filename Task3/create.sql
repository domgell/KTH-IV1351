-- Instructor

CREATE TABLE instructor (
    instructor_id SERIAL PRIMARY KEY,
    can_teach_ensemble BOOLEAN NOT NULL,
    is_available BOOLEAN NOT NULL,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    person_number VARCHAR(12) UNIQUE NOT NULL
);

CREATE TABLE instructor_taught_instruments (
    instructor_id SERIAL NOT NULL,
    instrument_type VARCHAR(500) NOT NULL,
    
    FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id)
);

-- Instructor



-- Student

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    street VARCHAR(500) NOT NULL,
    city VARCHAR(500) NOT NULL,
    zip VARCHAR(500) NOT NULL,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    person_number VARCHAR(12) UNIQUE NOT NULL,
    sibling_id INT
);

CREATE TABLE student_email (
    student_id SERIAL NOT NULL,
    email VARCHAR(500),
    
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

CREATE TABLE student_phone_number (
    student_id SERIAL NOT NULL,
    phone_number VARCHAR(500),
    
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

CREATE TABLE contact_person_email (
    student_id SERIAL NOT NULL,
    contact_person_email VARCHAR(500),
    
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

CREATE TABLE contact_person_name (
    student_id SERIAL NOT NULL,
    contact_person_name VARCHAR(500),

    FOREIGN KEY (student_id) REFERENCES student (student_id)
);

-- Student



-- Lesson

CREATE TABLE lesson (
    lesson_id SERIAL NOT NULL,
    lesson_date DATE NOT NULL,
    instructor_id SERIAL NOT NULL,
    lesson_type VARCHAR(20) NOT NULL CHECK (lesson_type IN ('ensemble', 'group', 'individual')),

    CONSTRAINT PK_lesson PRIMARY KEY (lesson_id),
    CONSTRAINT FK_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id)
);

CREATE TABLE ensemble_lesson (
    ensemble_id SERIAL NOT NULL,
    lesson_id SERIAL NOT NULL UNIQUE,
    genre VARCHAR(500) NOT NULL,
    max_participants INT NOT NULL,
    min_participants INT NOT NULL,
    scheduled_time TIME NOT NULL,

    CONSTRAINT PK_ensemble_lesson PRIMARY KEY (ensemble_id),
    CONSTRAINT FK_ensemble_lesson_lesson FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id)
);

CREATE TABLE group_lesson (
    group_id SERIAL NOT NULL,
    lesson_id SERIAL NOT NULL UNIQUE,
    max_participants INT,
    min_participants INT,
    scheduled_time TIME NOT NULL,
    instrument_type VARCHAR(500),

    CONSTRAINT PK_group_lesson PRIMARY KEY (group_id),
    CONSTRAINT FK_group_lesson_lesson FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id)
);

CREATE TABLE individual_lesson (
    individual_id SERIAL NOT NULL,
    lesson_id SERIAL NOT NULL UNIQUE,
    appointment_time TIME NOT NULL,
    instrument_type VARCHAR(500) NOT NULL,
    
    CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_id),
    CONSTRAINT FK_individual_lesson_lesson FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id)
);


CREATE TABLE lesson_attendance (
    lesson_attendance_id SERIAL NOT NULL,
    lesson_id SERIAL NOT NULL,
    student_id SERIAL NOT NULL,
    
    CONSTRAINT PK_lesson_attendance PRIMARY KEY (lesson_attendance_id),
    CONSTRAINT FK_lesson_attendance_lesson FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id),
    CONSTRAINT FK_lesson_attendance_student FOREIGN KEY (student_id) REFERENCES student (student_id),
    
    UNIQUE (lesson_id, student_id)
);

CREATE TABLE price_scheme (
    price_scheme_id SERIAL NOT NULL,
    price DECIMAL(10) NOT NULL,
    skill_level VARCHAR(500) NOT NULL,
    lesson_id SERIAL NOT NULL
);

ALTER TABLE
    price_scheme
ADD
    CONSTRAINT PK_price_scheme PRIMARY KEY (price_scheme_id);

ALTER TABLE
    price_scheme
ADD
    CONSTRAINT FK_price_scheme_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);

-- Lesson



-- Instrument

CREATE TABLE instrument (
    instrument_id SERIAL NOT NULL,
    instrument_type VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    number_available INT NOT NULL,
    renting_price DECIMAL(10) NOT NULL,
    rental_id SERIAL
);

ALTER TABLE
    instrument
ADD
    CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);

CREATE TABLE rent_instrument (
    rental_id SERIAL NOT NULL,
    rent_start DATE NOT NULL,
    rental_end DATE NOT NULL,
    max_quantity INT NOT NULL,
    instrument_id SERIAL,
    student_id SERIAL
);

ALTER TABLE
    rent_instrument
ADD
    CONSTRAINT PK_rent_instrument PRIMARY KEY (rental_id);

ALTER TABLE
    instrument
ADD
    CONSTRAINT FK_instrument_0 FOREIGN KEY (rental_id) REFERENCES rent_instrument (rental_id);

ALTER TABLE
    rent_instrument
ADD
    CONSTRAINT FK_rent_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);

ALTER TABLE
    rent_instrument
ADD
    CONSTRAINT FK_rent_instrument_1 FOREIGN KEY (student_id) REFERENCES student (student_id);

-- Instrument