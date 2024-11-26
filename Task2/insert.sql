-- Values are generated with generatedata.com
-- Insert students
INSERT INTO student (street, city, zip, first_name, last_name, person_number, sibling_id) VALUES
  ('552-7740 Felis, Street', 'Beerzel', '393116', 'Clio', 'Patrick', '196406052396', 0),
  ('Ap #833-4678 Lorem Rd.', 'Nushki', '28031', 'Quintessa', 'Hays', '200911087609', 1),
  ('Ap #172-3176 Sem Avenue', 'Tumaco', '42-361', 'Hayes', 'Gonzales', '201501230674', 2),
  ('812-567 Iaculis Road', 'Alingsås', '2890', 'Finn', 'Vang', '199808132394', 3),
  ('952-8833 Proin St.', 'Mustafakemalpaşa', '816272', 'Kasimir', 'Green', '202210198467', 4),
  ('Ap #936-2138 Leo. Rd.', 'Curitiba', '6563', 'Bruno', 'Mcpherson', '201312203043', 5),
  ('7036 Pede. Rd.', 'Ningxia', '124394', 'Jordan', 'Dillard', '193512251335', 6),
  ('Ap #544-5627 Donec Av.', 'Quilpué', '58137', 'Scarlett', 'Goff', '198910077109', 7),
  ('355-4627 Nec Ave', 'Troyes', '98722', 'Caryn', 'Fitzgerald', '201010110623', 8),
  ('506-4494 Morbi Road', 'Volgograd', '69432', 'Megan', 'Mccarthy', '196605229548', 9);

-- Insert student email
INSERT INTO student_email (student_id, email) VALUES
  (1, 'molie.tellus@icloud.edu'),
  (2, 'cras.sed@yahoo.org'),
  (3, 'aliquet@outlook.org'),
  (4, 'ut.tincidunt.vehicula@google.couk'),
  (5, 'aliquam.rutrum.lorem@icloud.net'),
  (6, 'turpis@icloud.org'),
  (7, 'ornare.in@outlook.couk'),
  (8, 'nam.ligula@hotmail.edu'),
  (9, 'quis@protonmail.edu'),
  (10, 'dolor@hotmail.com');

-- Insert student phone number
INSERT INTO student_phone_number (student_id, phone_number) VALUES
  (1, '08-723 72 50'),
  (2, '0220-511 00'),
  (3, '021-18 45 30'),
  (4, '08-570 108 70'),
  (5, '076-240 19 88'),
  (6, '031-367 05 00'),
  (7, '0920-100 52'),
  (8, '090-18 90 50'),
  (9, '0433-730 00'),
  (10, '030-364 05 00');

-- Insert instructors
INSERT INTO instructor (can_teach_ensemble, is_available, first_name, last_name, person_number) VALUES
  ('TRUE', 'TRUE', 'Vincent', 'Gallegos', '197605239548'),
  ('TRUE', 'TRUE', 'Chastity', 'Atkinson', '201014850623'),
  ('FALSE', 'FALSE', 'Natalie', 'Peterson', '202960498467'),
  ('TRUE', 'TRUE', 'Hedley', 'Barry', '197834052396'),
  ('TRUE', 'FALSE', 'Malik', 'Edwards', '200921087606'),
  ('TRUE', 'TRUE', 'Tallulah', 'Finley', '196665449548'),
  ('FALSE', 'FALSE', 'Marvin', 'Conner', '201538330676'),
  ('TRUE', 'FALSE', 'Avram', 'Salinas', '204210144467'),
  ('TRUE', 'TRUE', 'Felix', 'Eaton', '202784198467'),
  ('FALSE', 'FALSE', 'Lisandra', 'Hensley', '201078956623');

-- Insert the instruments each instructor can teach
INSERT INTO instructor_taught_instruments (instructor_id, instrument_type) VALUES
  (2, 'Piano'),
  (3, 'Violin'),
  (7, 'Flute'),
  (9, 'Piano'),
  (1, 'Guitar'),
  (6, 'Harmonica'),
  (4, 'Cello'),
  (10, 'Violin'),
  (5, 'Drums'),
  (5, 'Flute');

-- Insert instruments
INSERT INTO instrument (instrument_type, brand, number_available, renting_price) VALUES
  ('Violin', 'Yamaha', 10, 15.99),
  ('Piano', 'Steinway', 5, 200.00),
  ('Guitar', 'Fender', 8, 25.00),
  ('Flute', 'Yamaha', 12, 10.99),
  ('Drums', 'Pearl', 6, 50.00),
  ('Cello', 'Stradivarius', 4, 80.00),
  ('Saxophone', 'Selmer', 7, 35.99),
  ('Trumpet', 'Bach', 9, 20.00),
  ('Clarinet', 'Buffet', 11, 18.50),
  ('Trombone', 'Yamaha', 5, 22.00);