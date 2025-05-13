-- Use the database
USE librarydb;

-- Create Staff table
CREATE TABLE Staff (
  StaffID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  StaffRole VARCHAR(50) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Phone VARCHAR(15),
  HireDate DATE NOT NULL
);

-- Create Members table
CREATE TABLE Members (
  MemberID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Phone VARCHAR(15),
  JoinDate DATE NOT NULL
);

-- Create Authors table
CREATE TABLE Authors (
  AuthorID INT AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Bio TEXT
);

-- Create Books table
CREATE TABLE Books (
  BookID INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  AuthorID INT,
  Genre VARCHAR(50),
  PublishDate DATE,
  ISBN VARCHAR(20) UNIQUE,
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create BorrowedBooks table
CREATE TABLE BorrowedBooks (
  BorrowID INT AUTO_INCREMENT PRIMARY KEY,
  MemberID INT,
  BookID INT,
  BorrowDate DATE NOT NULL,
  ReturnDate DATE,
  StaffID INT,
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Insert Staff
INSERT INTO Staff (FirstName, LastName, StaffRole, Email, Phone, HireDate)
VALUES 
('Catherine', 'Andiwo', 'Librarian', 'catherine.andiwo@library.com', '0700111222', '2023-01-01'),
('Kate', 'Luchiri', 'Assistant Librarian', 'kate.luchiri@library.com', '0700222333', '2023-02-01'),
('John', 'Doe', 'Archivist', 'john.doe@library.com', '0700333444', '2022-08-15'),
('Mary', 'Wanjiku', 'Technician', 'mary.wanjiku@library.com', '0700444555', '2023-03-12'),
('Peter', 'Otieno', 'Security', 'peter.otieno@library.com', '0700555666', '2023-05-20');

-- Insert Members
INSERT INTO Members (FirstName, LastName, Email, Phone, JoinDate)
VALUES 
('Catherine', 'Andiwo', 'catherine.andiwo@gmail.com', '0799907456', '2024-01-01'),
('Kate', 'Luchiri', 'kate.luchiri@gmail.com', '0700198754', '2024-02-01'),
('Andiwo', 'Kate', 'andiwo.kate@gmail.com', '0710772567', '2024-03-01'),
('Brian', 'Omondi', 'brian.omondi@gmail.com', '0711000000', '2024-03-15'),
('Joy', 'Achieng', 'joy.achieng@gmail.com', '0700554433', '2024-04-10');

-- Insert Authors
INSERT INTO Authors (FirstName, LastName, Bio)
VALUES 
('Catherine', 'Andiwo', 'Author of various educational books.'),
('Kate', 'Luchiri', 'Fiction writer with a focus on mystery genres.'),
('Andiwo', 'Kate', 'Author of children''s books and motivational literature.'),
('David', 'Mutua', 'Expert in African history and culture.'),
('Grace', 'Mwende', 'Award-winning romance novelist.');

-- Insert Books
INSERT INTO Books (Title, AuthorID, Genre, PublishDate, ISBN)
VALUES 
('The Education Journey', 1, 'Educational', '2025-01-01', '9781234567890'),
('Mystery in the Shadows', 2, 'Mystery', '2024-06-01', '9789876543210'),
('The Young Explorer', 3, 'Children''s Literature', '2023-10-15', '9781928374650'),
('African Roots', 4, 'History', '2022-05-22', '9781111222233'),
('Love Unwritten', 5, 'Romance', '2021-09-10', '9785555666677');

-- Insert Borrowed Books
INSERT INTO BorrowedBooks (MemberID, BookID, BorrowDate, ReturnDate, StaffID)
VALUES 
(1, 1, '2025-05-01', '2025-05-15', 1),
(2, 2, '2025-05-02', '2025-05-16', 2),
(3, 3, '2025-05-03', '2025-05-17', 1),
(4, 4, '2025-05-04', NULL, 3),
(5, 5, '2025-05-05', NULL, 2);

-- View data from all tables
DESCRIBE Staff;
SELECT * FROM Staff;

DESCRIBE Members;
SELECT * FROM Members;

DESCRIBE Authors;
SELECT * FROM Authors;

DESCRIBE Books;
SELECT * FROM Books;

DESCRIBE BorrowedBooks;
SELECT * FROM BorrowedBooks;
