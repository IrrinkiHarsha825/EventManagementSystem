CREATE DATABASE dbms_project;
USE dbms_project;

-- Organizer Table
CREATE TABLE Organizer (
    Organizer_ID INT PRIMARY KEY,
    Organizer_Name VARCHAR(255),
    Organizer_Contact_Info VARCHAR(255)
);

-- Event Table
CREATE TABLE Event (
    Event_ID INT PRIMARY KEY,
    Event_Name VARCHAR(255),
    Event_Description TEXT,
    Event_Date DATE,
    Event_Location VARCHAR(255),
    Organizer_ID INT,
    FOREIGN KEY (Organizer_ID) REFERENCES Organizer(Organizer_ID)
);

-- Participant Table
CREATE TABLE Participant (
    Participant_ID INT PRIMARY KEY,
    Participant_Name VARCHAR(255),
    Participant_Contact_Info VARCHAR(255)
);

-- Registration Table
CREATE TABLE Registration (
    Registration_ID INT PRIMARY KEY,
    Event_ID INT,
    Participant_ID INT,
    Registration_Date DATE,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Participant_ID) REFERENCES Participant(Participant_ID)
);

-- Venue Table
CREATE TABLE Venue (
    Venue_ID INT PRIMARY KEY,
    Venue_Name VARCHAR(255),
    Venue_Location VARCHAR(255),
    Venue_Capacity INT
);

-- Speaker Table
CREATE TABLE Speaker (
    Speaker_ID INT PRIMARY KEY,
    Speaker_Name VARCHAR(255),
    Speaker_Contact_Info VARCHAR(255)
);

-- Event_Speaker Table
CREATE TABLE Event_Speaker (
    Event_ID INT,
    Speaker_ID INT,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Speaker_ID) REFERENCES Speaker(Speaker_ID)
);

-- Ticket Table
CREATE TABLE Ticket (
    Ticket_ID INT PRIMARY KEY,
    Event_ID INT,
    Ticket_Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Available_Quantity INT,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

-- Booking Table
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Event_ID INT,
    Participant_ID INT,
    Ticket_ID INT,
    Quantity INT,
    Total_Amount DECIMAL(10, 2),
    Booking_Date DATE,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Participant_ID) REFERENCES Participant(Participant_ID),
    FOREIGN KEY (Ticket_ID) REFERENCES Ticket(Ticket_ID)
);

-- Payment Table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT,
    Payment_Method VARCHAR(50),
    Amount DECIMAL(10, 2),
    Payment_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

-- Feedback Table
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY,
    Event_ID INT,
    Participant_ID INT,
    Rating INT,
    Comment TEXT,
    Submission_Date DATE,
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Participant_ID) REFERENCES Participant(Participant_ID)
);

-- Organizer Table
INSERT INTO Organizer (Organizer_ID, Organizer_Name, Organizer_Contact_Info) VALUES
(1, 'ABC Events', 'abc@example.com'),
(2, 'XYZ Conferences', 'xyz@example.com'),
(3, '123 Productions', '123@example.com'),
(4, 'Global Summit Organizers', 'global@example.com'),
(5, 'Tech Conventions Inc.', 'techcon@example.com'),
(6, 'Community Events Management', 'community@example.com'),
(7, 'Corporate Events Ltd.', 'corporate@example.com'),
(8, 'Music Festivals Unlimited', 'musicfest@example.com'),
(9, 'Artistic Endeavors Events', 'artistic@example.com'),
(10, 'Sports Events Management', 'sports@example.com'),
(11, 'Green Earth Events', 'greenearth@example.com'),
(12, 'Health and Wellness Events', 'health@example.com'),
(13, 'Educational Conferences LLC', 'education@example.com'),
(14, 'Fashion Events International', 'fashion@example.com'),
(15, 'Culinary Events Group', 'culinary@example.com');

-- Event Table
INSERT INTO Event (Event_ID, Event_Name, Event_Description, Event_Date, Event_Location, Organizer_ID) VALUES
(1, 'Tech Summit', 'Annual technology conference', '2024-04-15', 'Convention Center', 1),
(2, 'Business Expo', 'Showcasing local businesses', '2024-05-20', 'Exhibition Hall', 2),
(3, 'Music Festival', 'Celebration of music and arts', '2024-07-10', 'City Park', 3),
(4, 'Global Conference', 'Bringing together leaders worldwide', '2024-08-25', 'Global Convention Center', 4),
(5, 'Tech Innovations Forum', 'Exploring the latest in tech advancements', '2024-09-05', 'Tech Hub Auditorium', 5),
(6, 'Community Fair', 'Engaging local community organizations', '2024-06-15', 'Community Park', 6),
(7, 'Corporate Retreat', 'Strategic planning and team building', '2024-10-10', 'Corporate Resort', 7),
(8, 'Music Concert', 'Featuring top artists from around the globe', '2024-08-05', 'Amphitheater', 8),
(9, 'Art Exhibition', 'Showcasing diverse artistic talents', '2024-11-20', 'Art Gallery', 9),
(10, 'Sports Tournament', 'Competitive sports events for all ages', '2024-07-30', 'Sports Complex', 10),
(11, 'Green Earth Summit', 'Promoting sustainability and environmental awareness', '2024-09-15', 'Convention Center', 11),
(12, 'Health and Wellness Expo', 'Educating on holistic health practices', '2024-10-30', 'Wellness Center', 12),
(13, 'Education Symposium', 'Sharing insights and innovations in education', '2024-11-05', 'Conference Center', 13),
(14, 'Fashion Show', 'Showcasing latest trends and designers', '2024-08-15', 'Fashion Mall', 14),
(15, 'Culinary Festival', 'Celebrating culinary diversity and talent', '2024-09-20', 'Food Park', 15);

-- Participant Table
INSERT INTO Participant (Participant_ID, Participant_Name, Participant_Contact_Info) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Alice Johnson', 'alice.johnson@example.com'),
(4, 'Michael Brown', 'michael.brown@example.com'),
(5, 'David Wilson', 'david.wilson@example.com'),
(6, 'Emily Davis', 'emily.davis@example.com'),
(7, 'Sophia Martinez', 'sophia.martinez@example.com'),
(8, 'William Taylor', 'william.taylor@example.com'),
(9, 'Olivia Anderson', 'olivia.anderson@example.com'),
(10, 'James Garcia', 'james.garcia@example.com'),
(11, 'Emma Hernandez', 'emma.hernandez@example.com'),
(12, 'Daniel Rodriguez', 'daniel.rodriguez@example.com'),
(13, 'Ava Lopez', 'ava.lopez@example.com'),
(14, 'Liam Gonzalez', 'liam.gonzalez@example.com'),
(15, 'Isabella Perez', 'isabella.perez@example.com');

-- Registration Table
INSERT INTO Registration (Registration_ID, Event_ID, Participant_ID, Registration_Date) VALUES
(1, 1, 1, '2024-04-01'),
(2, 1, 2, '2024-03-25'),
(3, 2, 3, '2024-04-05'),
(4, 3, 4, '2024-06-20'),
(5, 4, 5, '2024-07-01'),
(6, 5, 6, '2024-08-10'),
(7, 6, 7, '2024-05-15'),
(8, 7, 8, '2024-09-01'),
(9, 8, 9, '2024-07-25'),
(10, 9, 10, '2024-10-05'),
(11, 10, 11, '2024-07-10'),
(12, 11, 12, '2024-08-15'),
(13, 12, 13, '2024-09-30'),
(14, 13, 14, '2024-10-15'),
(15, 14, 15, '2024-06-01');

-- Venue Table
INSERT INTO Venue (Venue_ID, Venue_Name, Venue_Location, Venue_Capacity) VALUES
(1, 'Convention Center', 'Main Street', 1000),
(2, 'Exhibition Hall', 'Broadway Avenue', 500),
(3, 'City Park', 'Park Street', 2000),
(4, 'Global Convention Center', 'Global Avenue', 1500),
(5, 'Tech Hub Auditorium', 'Tech Avenue', 800),
(6, 'Community Park', 'Community Street', 3000),
(7, 'Corporate Resort', 'Corporate Road', 500),
(8, 'Amphitheater', 'Amphitheater Lane', 2000),
(9, 'Art Gallery', 'Art Street', 400),
(10, 'Sports Complex', 'Sports Street', 2500),
(11, 'Wellness Center', 'Wellness Avenue', 600),
(12, 'Conference Center', 'Conference Road', 800),
(13, 'Fashion Mall', 'Fashion Boulevard', 1000),
(14, 'Food Park', 'Food Plaza', 1200);

-- Speaker Table
INSERT INTO Speaker (Speaker_ID, Speaker_Name, Speaker_Contact_Info) VALUES
(1, 'Michael Brown', 'michael.brown@example.com'),
(2, 'Sarah Wilson', 'sarah.wilson@example.com'),
(3, 'David Johnson', 'david.johnson@example.com'),
(4, 'Jennifer Lee', 'jennifer.lee@example.com'),
(5, 'Kevin Moore', 'kevin.moore@example.com'),
(6, 'Emma Thompson', 'emma.thompson@example.com'),
(7, 'Samuel Clark', 'samuel.clark@example.com'),
(8, 'Rachel White', 'rachel.white@example.com'),
(9, 'Christopher Garcia', 'christopher.garcia@example.com'),
(10, 'Jessica Rodriguez', 'jessica.rodriguez@example.com'),
(11, 'Erica Hill', 'erica.hill@example.com'),
(12, 'Matthew Allen', 'matthew.allen@example.com'),
(13, 'Samantha Young', 'samantha.young@example.com'),
(14, 'Nathan King', 'nathan.king@example.com'),
(15, 'Grace Scott', 'grace.scott@example.com');

-- Event_Speaker Table
INSERT INTO Event_Speaker (Event_ID, Speaker_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(4, 10),
(5, 11),
(6, 12);

-- Ticket Table
INSERT INTO Ticket (Ticket_ID, Event_ID, Ticket_Name, Price, Available_Quantity) VALUES
(1, 1, 'General Admission', 50.00, 500),
(2, 1, 'VIP Pass', 100.00, 100),
(3, 2, 'Standard Ticket', 20.00, 300),
(4, 2, 'Premium Ticket', 50.00, 100),
(5, 3, 'Standard Entry', 30.00, 800),
(6, 3, 'VIP Package', 150.00, 200),
(7, 4, 'Student Pass', 40.00, 200),
(8, 4, 'Executive Pass', 200.00, 100),
(9, 5, 'Early Bird Ticket', 25.00, 500),
(10, 5, 'Late Registration', 35.00, 300),
(11, 6, 'Day Pass', 40.00, 400),
(12, 6, 'Weekend Pass', 80.00, 200),
(13, 7, 'Single Day Ticket', 60.00, 300),
(14, 7, 'Full Event Pass', 120.00, 150),
(15, 8, 'Standard Admission', 45.00, 600);

-- Booking Table
INSERT INTO Booking (Booking_ID, Event_ID, Participant_ID, Ticket_ID, Quantity, Total_Amount, Booking_Date) VALUES
(1, 1, 1, 1, 2, 100.00, '2024-04-02'),
(2, 1, 2, 2, 1, 100.00, '2024-04-02'),
(3, 2, 3, 3, 4, 80.00, '2024-04-02'),
(4, 3, 4, 5, 3, 90.00, '2024-04-02'),
(5, 3, 5, 6, 1, 150.00, '2024-04-02'),
(6, 4, 6, 7, 2, 80.00, '2024-04-02'),
(7, 4, 7, 8, 1, 200.00, '2024-04-02'),
(8, 5, 8, 9, 3, 75.00, '2024-04-02'),
(9, 5, 9, 10, 2, 70.00, '2024-04-02'),
(10, 6, 10, 11, 1, 40.00, '2024-04-02'),
(11, 6, 11, 12, 1, 80.00, '2024-04-02'),
(12, 7, 12, 13, 2, 120.00, '2024-04-02'),
(13, 7, 13, 14, 1, 120.00, '2024-04-02'),
(14, 8, 14, 15, 2, 90.00, '2024-04-02'),
(15, 8, 15, 1, 1, 50.00, '2024-04-02');

-- Payment Table
INSERT INTO Payment (Payment_ID, Booking_ID, Payment_Method, Amount, Payment_Date, Status) VALUES
(1, 1, 'Credit Card', 100.00, '2024-04-02', 'Completed'),
(2, 2, 'PayPal', 100.00, '2024-04-02', 'Completed'),
(3, 3, 'Credit Card', 80.00, '2024-04-02', 'Completed'),
(4, 4, 'PayPal', 90.00, '2024-04-02', 'Completed'),
(5, 5, 'Credit Card', 150.00, '2024-04-02', 'Completed'),
(6, 6, 'Credit Card', 80.00, '2024-04-02', 'Completed'),
(7, 7, 'Credit Card', 200.00, '2024-04-02', 'Completed'),
(8, 8, 'Credit Card', 75.00, '2024-04-02', 'Completed'),
(9, 9, 'PayPal', 70.00, '2024-04-02', 'Completed'),
(10, 10, 'Credit Card', 40.00, '2024-04-02', 'Completed'),
(11, 11, 'PayPal', 80.00, '2024-04-02', 'Completed'),
(12, 12, 'Credit Card', 120.00, '2024-04-02', 'Completed'),
(13, 13, 'Credit Card', 120.00, '2024-04-02', 'Completed'),
(14, 14, 'Credit Card', 90.00, '2024-04-02', 'Completed'),
(15, 15, 'PayPal', 50.00, '2024-04-02', 'Completed');

-- Feedback Table
INSERT INTO Feedback (Feedback_ID, Event_ID, Participant_ID, Rating, Comment, Submission_Date) VALUES
(1, 1, 1, 5, 'The event was well-organized with insightful sessions.', '2024-04-16'),
(2, 1, 2, 4, 'Enjoyed the networking opportunities and keynote speeches.', '2024-04-17'),
(3, 2, 3, 4, 'The expo had a good variety of businesses.', '2024-05-21'),
(4, 3, 4, 5, 'Great atmosphere and performances at the festival.', '2024-07-11'),
(5, 4, 5, 4, 'Informative sessions and well-selected speakers.', '2024-08-26'),
(6, 5, 6, 5, 'Loved the discussions on emerging technologies.', '2024-09-06'),
(7, 6, 7, 4, 'Good community engagement with useful resources.', '2024-06-16'),
(8, 7, 8, 5, 'Valuable team-building activities and workshops.', '2024-10-11'),
(9, 8, 9, 5, 'Amazing performances and great sound quality.', '2024-08-06'),
(10, 9, 10, 4, 'Beautiful artwork on display at the exhibition.', '2024-11-21'),
(11, 10, 11, 5, 'Enjoyed the competitive spirit and sportsmanship.', '2024-07-31'),
(12, 11, 12, 4, 'Informative talks on sustainability and conservation.', '2024-09-16'),
(13, 12, 13, 5, 'Educational sessions were insightful and practical.', '2024-10-01'),
(14, 13, 14, 4, 'Engaging discussions on the future of education.', '2024-10-16'),
(15, 14, 15, 5, 'Impressive lineup of designers and creative designs.', '2024-06-02'),
(16, 15, 1, 4, 'Delicious food and enjoyable culinary experiences.', '2024-09-21');

show tables;