-- Values are generated with generatedata.com

-- Insert students
INSERT INTO student (street, city, zip, first_name, last_name, person_number, sibling_id)
VALUES
  ("552-7740 Felis, Street","Beerzel","393116","","Clio Patrick",196406052396,7),
  ("Ap #833-4678 Lorem Rd.","Nushki","28031","","Quintessa Hays",200911087609,4),
  ("Ap #172-3176 Sem Avenue","Tumaco","42-361","","Hayes Gonzales",201501230674,9),
  ("812-567 Iaculis Road","Alingsås","2890","","Finn Vang",199808132394,7),
  ("952-8833 Proin St.","Mustafakemalpaşa","816272","","Kasimir Green",202210198467,8),
  ("Ap #936-2138 Leo. Rd.","Curitiba","6563","","Bruno Mcpherson",201312203043,4),
  ("7036 Pede. Rd.","Ningxia","124394","","Jordan Dillard",193512251335,0),
  ("Ap #544-5627 Donec Av.","Quilpué","58137","","Scarlett Goff",198910077109,3),
  ("355-4627 Nec Ave","Troyes","98722","","Caryn Fitzgerald",201010110623,9),
  ("506-4494 Morbi Road","Volgograd","69432","","Megan Mccarthy",196605229548,8);

-- Insert student email
INSERT INTO student_email (student_id, email)
VALUES
  (2,"molie.tellus@icloud.edu"),
  (2,"cras.sed@yahoo.org"),
  (10,"aliquet@outlook.org"),
  (6,"ut.tincidunt.vehicula@google.couk"),
  (1,"aliquam.rutrum.lorem@icloud.net"),
  (7,"turpis@icloud.org"),
  (8,"ornare.in@outlook.couk"),
  (6,"nam.ligula@hotmail.edu"),
  (7,"quis@protonmail.edu"),
  (2,"dolor@hotmail.com");

-- Insert student phone number
INSERT INTO student_phone_number (student_id, phone_number)
VALUES 
   (6, "08-723 72 50"),
   (3, "0220-511 00"),
   (7, "021-18 45 30"),
   (5, "08-570 108 70"),
   (1, "076-240 19 88"),
   (6, "031-367 05 00"),
   (9, "0920-100 52"),
   (10, "090-18 90 50"),
   (4, "0433-730 00"),
   (8, "030-364 05 00");

-- Insert instructors
INSERT INTO instructor (can_teach_ensemble, is_available, first_name, last_name, person_number, lesson_id)
VALUES 
  ("TRUE","TRUE","Vincent Mckinney","Keane Gallegos",197605239548,6),
  ("TRUE","TRUE","Chastity Barber","Phoebe Atkinson",201014850623,2),
  ("FALSE","FALSE","Natalie Anderson","Mira Peterson",202960498467,1),
  ("TRUE","TRUE","Hedley Hanson","Jaden Barry",197834052396,9),
  ("TRUE","FALSE","Malik Savage","Ifeoma Edwards",200921087606,6),
  ("TRUE","TRUE","Tallulah Harrell","India Finley",196665449548,2),
  ("FALSE","FALSE","Marvin Morris","Abbot Conner",201538330676,1),
  ("TRUE","FALSE","Avram Myers","Zeus Salinas",204210144467,2),
  ("TRUE","TRUE","Felix English","Cooper Eaton",202784198467,3),
  ("FALSE","FALSE","Lisandra Lawson","Jamalia Hensley",201078956623,10);

-- Insert the instruments each instructor can teach
INSERT INTO instructor_taught_instruments (instructor_id, instrument_type)
VALUES 
   (2, "Piano"),
   (3, "Violin"),
   (7, "Flute"),
   (9, "Piano"),
   (1, "Guitar"),
   (6, "Harmonica"),
   (4, "Cello"),
   (10, "Violin"),
   (5, "Drums"),
   (5, "Flute");

-- Insert instruments
INSERT INTO instrument (type, brand, number_available, renting_price, rental_id)
VALUES 
    ("Violin", "Yamaha", 10, 15.99, 1),
    ("Piano", "Steinway", 5, 200.00, 2),
    ("Guitar", "Fender", 8, 25.00, 3),
    ("Flute", "Yamaha", 12, 10.99, 4),
    ("Drums", "Pearl", 6, 50.00, 5),
    ("Cello", "Stradivarius", 4, 80.00, 6),
    ("Saxophone", "Selmer", 7, 35.99, 7),
    ("Trumpet", "Bach", 9, 20.00, 8),
    ("Clarinet", "Buffet", 11, 18.50, 9),
    ("Trombone", "Yamaha", 5, 22.00, 10);