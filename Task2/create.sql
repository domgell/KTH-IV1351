-- Automatically generated with Astah

CREATE TABLE instructor (
 instructor_id  SERIAL NOT NULL,
 can_teach_ensemble BOOLEAN NOT NULL,
 is_available BOOLEAN NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 person_number UNIQUE VARCHAR(12) NOT NULL,
 lesson_id SERIAL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id );


CREATE TABLE instructor_taught_instruments (
 instructor_id  SERIAL NOT NULL,
 instrument_type VARCHAR(500) NOT NULL
);

ALTER TABLE instructor_taught_instruments ADD CONSTRAINT PK_instructor_taught_instruments PRIMARY KEY (instructor_id );


CREATE TABLE instrument (
 instrument_id  SERIAL NOT NULL,
 type VARCHAR(50) NOT NULL,
 brand VARCHAR(50) NOT NULL,
 number_available INT NOT NULL,
 renting_price DECIMAL(10) NOT NULL,
 rental_id  SERIAL NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id );


CREATE TABLE lesson (
 lesson_id SERIAL NOT NULL,
 date DATE NOT NULL,
 instructor_id  SERIAL NOT NULL,
 student_id SERIAL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE price_scheme (
 price_scheme_id  SERIAL NOT NULL,
 price DECIMAL(10) NOT NULL,
 level VARCHAR(500) NOT NULL,
 lesson_type VARCHAR(500) NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE price_scheme ADD CONSTRAINT PK_price_scheme PRIMARY KEY (price_scheme_id );


CREATE TABLE rent_instrument (
 rental_id  SERIAL NOT NULL,
 rent_start DATE NOT NULL,
 rental_end DATE NOT NULL,
 max_quantity INT NOT NULL,
 instrument_id  SERIAL,
 student_id SERIAL
);

ALTER TABLE rent_instrument ADD CONSTRAINT PK_rent_instrument PRIMARY KEY (rental_id );


CREATE TABLE sibling_id (
 sibling_id SERIAL NOT NULL,
 student_id SERIAL
);

ALTER TABLE sibling_id ADD CONSTRAINT PK_sibling_id PRIMARY KEY (sibling_id);


CREATE TABLE student  (
 student_id SERIAL NOT NULL,
 street VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL,
 zip VARCHAR(500) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 person_number UNIQUE VARCHAR(12) NOT NULL,
 sibling_id SERIAL NOT NULL
);

ALTER TABLE student  ADD CONSTRAINT PK_student  PRIMARY KEY (student_id);


CREATE TABLE student_email (
 student_id SERIAL NOT NULL,
 email VARCHAR(500)
);

ALTER TABLE student_email ADD CONSTRAINT PK_student_email PRIMARY KEY (student_id);


CREATE TABLE student_phone_number (
 student_id SERIAL NOT NULL,
 phone_number VARCHAR(500)
);

ALTER TABLE student_phone_number ADD CONSTRAINT PK_student_phone_number PRIMARY KEY (student_id);


CREATE TABLE contact_person_email (
 student_id SERIAL NOT NULL,
 contact_person_email VARCHAR(500)
);

ALTER TABLE contact_person_email ADD CONSTRAINT PK_contact_person_email PRIMARY KEY (student_id);


CREATE TABLE contact_person_name (
 student_id SERIAL NOT NULL,
 contact_person_name VARCHAR(500)
);

ALTER TABLE contact_person_name ADD CONSTRAINT PK_contact_person_name PRIMARY KEY (student_id);


CREATE TABLE ensemble_lesson (
 ensemble_id  SERIAL NOT NULL,
 genre VARCHAR(500) NOT NULL,
 max_participants INT NOT NULL,
 min_participants INT NOT NULL,
 scheduled_time TIME NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE ensemble_lesson ADD CONSTRAINT PK_ensemble_lesson PRIMARY KEY (ensemble_id );


CREATE TABLE group_lesson (
 group_lesson_id  SERIAL NOT NULL,
 max_participants INT,
 min_participants INT,
 scheduled_time TIME NOT NULL,
 instrument_type VARCHAR(500),
 lesson_id SERIAL NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id );


CREATE TABLE individual_lesson (
 individual_id  SERIAL NOT NULL,
 appointment_time TIME(10) NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 lesson_id SERIAL NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_id );


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE instructor_taught_instruments ADD CONSTRAINT FK_instructor_taught_instruments_0 FOREIGN KEY (instructor_id ) REFERENCES instructor (instructor_id );


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (rental_id ) REFERENCES rent_instrument (rental_id );


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id ) REFERENCES instructor (instructor_id );
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE price_scheme ADD CONSTRAINT FK_price_scheme_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_0 FOREIGN KEY (instrument_id ) REFERENCES instrument (instrument_id );
ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_1 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE sibling_id ADD CONSTRAINT FK_sibling_id_0 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE student  ADD CONSTRAINT FK_student _0 FOREIGN KEY (sibling_id) REFERENCES sibling_id (sibling_id);


ALTER TABLE student_email ADD CONSTRAINT FK_student_email_0 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE student_phone_number ADD CONSTRAINT FK_student_phone_number_0 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE contact_person_email ADD CONSTRAINT FK_contact_person_email_0 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE contact_person_name ADD CONSTRAINT FK_contact_person_name_0 FOREIGN KEY (student_id) REFERENCES student  (student_id);


ALTER TABLE ensemble_lesson ADD CONSTRAINT FK_ensemble_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);
