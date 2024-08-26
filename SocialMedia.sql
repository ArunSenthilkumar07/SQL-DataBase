
CREATE DATABASE SocialMediaDB;
drop database socialmediadb;

USE SocialMediaDB;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    Bio TEXT,
    ProfileImage VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);

INSERT INTO Users (Username, Email, Password, FullName, Bio, ProfileImage)
VALUES ('Vijay', 'vijay@onlin.com', 'random_password', 'Vijay Master', 'Just a regular guy.', 'profile1.jpg'),
('Ramesh', 'ramesh@onlin.com', 'random_password', 'Ramesh Kumar', 'Love to code.', 'profile2.jpg'),
('Priya', 'priya@onlin.com', 'random_password', 'Priya S', 'Avid traveler.', 'profile3.jpg'),
('Anita', 'anita@onlin.com', 'random_password', 'Anita V', 'Photographer.', 'profile4.jpg'),
('Surya', 'surya@onlin.com', 'random_password', 'Surya R', 'Guitarist.', 'profile5.jpg'),
('Divya', 'divya@onlin.com', 'random_password', 'Divya M', 'Bookworm.', 'profile6.jpg'),
('Karthik', 'karthik@onlin.com', 'random_password', 'Karthik N', 'Tech enthusiast.', 'profile7.jpg'),
('Lakshmi', 'lakshmi@onlin.com', 'random_password', 'Lakshmi P', 'Yoga lover.', 'profile8.jpg'),
('Manoj', 'manoj@onlin.com', 'random_password', 'Manoj D', 'Foodie.', 'profile9.jpg'),
('Geetha', 'geetha@onlin.com', 'random_password', 'Geetha L', 'Nature lover.', 'profile10.jpg');

SELECT * FROM Users;

SELECT * FROM Users WHERE Username = 'Vijay';

CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Content TEXT NOT NULL,
    ImageURL VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO Posts (UserID, Content, ImageURL)
VALUES (1, 'Beautiful sunrise today!', 'sunrise.jpg'),
(2, 'Coding all day!', 'coding.jpg'),
(3, 'Exploring the mountains.', 'mountains.jpg'),
(4, 'Captured a beautiful moment.', 'photography.jpg'),
(5, 'Rocking on stage!', 'guitar.jpg'),
(6, 'Finished another great book.', 'book.jpg'),
(7, 'Latest tech trends.', 'tech.jpg'),
(8, 'Morning yoga session.', 'yoga.jpg'),
(9, 'Best meal ever!', 'food.jpg'),
(10, 'Lush green forest.', 'forest.jpg');

SELECT * FROM Posts;

CREATE TABLE Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT,
    UserID INT,
    CommentText TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO Comments (PostID, UserID, CommentText)
VALUES (1, 2, 'Amazing view!'),
(2, 3, 'Keep up the good work!'),
(3, 4, 'So inspiring!'),
(4, 5, 'Great shot!'),
(5, 6, 'Rock on!'),
(6, 7, 'Love that book!'),
(7, 8, 'Interesting insights!'),
(8, 9, 'Yoga is life!'),
(9, 10, 'That looks delicious!'),
(10, 1, 'Nature is beautiful!');

SELECT * FROM Comments;


CREATE TABLE Likes (
    LikeID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT,
    UserID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Likes (PostID, UserID)
VALUES (1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 1),
(10, 2);

SELECT * FROM Likes;


CREATE TABLE Friends (
    UserID1 INT,
    UserID2 INT,
    Status ENUM('pending', 'accepted', 'declined') DEFAULT 'pending',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID1, UserID2),
    FOREIGN KEY (UserID1) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (UserID2) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Friends (UserID1, UserID2, Status)
VALUES (1, 2, 'accepted'),
(2, 3, 'accepted'),
(3, 4, 'accepted'),
(4, 5, 'accepted'),
(5, 6, 'accepted'),
(6, 7, 'accepted'),
(7, 8, 'accepted'),
(8, 9, 'accepted'),
(9, 10, 'accepted'),
(10, 1, 'accepted');


SELECT * FROM Friends;

CREATE TABLE Messages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageText TEXT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Messages (SenderID, ReceiverID, MessageText)
VALUES (1, 2, 'Hey, how are you?'),
(2, 3, 'Long time no see!'),
(3, 4, 'What’s up?'),
(4, 5, 'Had a great day!'),
(5, 6, 'Let’s catch up!'),
(6, 7, 'How’s everything?'),
(7, 8, 'Miss you!'),
(8, 9, 'Let’s meet soon!'),
(9, 10, 'Good to hear from you!'),
(10, 1, 'Take care!');

SELECT * FROM Messages;


CREATE TABLE Notifications (
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    NotificationType ENUM('like', 'comment', 'friend_request', 'message') NOT NULL,
    SourceID INT, -- The ID of the related post, comment, or user
    IsRead BOOLEAN DEFAULT FALSE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Notifications (UserID, NotificationType, SourceID, IsRead)
VALUES (1, 'like', 1, FALSE),
(2, 'comment', 1, FALSE),
(3, 'friend_request', 2, FALSE),
(4, 'message', 3, FALSE),
(5, 'like', 4, FALSE),
(6, 'comment', 5, FALSE),
(7, 'friend_request', 6, FALSE),
(8, 'message', 7, FALSE),
(9, 'like', 8, FALSE),
(10, 'comment', 9, FALSE);

SELECT * FROM Notifications;

CREATE TABLE Grp (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100) NOT NULL,
    GroupDescription TEXT,
    CreatedBy INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Grp (GroupName, GroupDescription, CreatedBy)
VALUES ('Travel Enthusiasts', 'A group for people who love to travel.', 1),
('Coders United', 'A group for coding enthusiasts.', 2),
('Photography Club', 'A group for photography lovers.', 3),
('Music Maniacs', 'A group for music enthusiasts.', 4),
('Book Lovers', 'A group for people who love reading.', 5),
('Tech Gurus', 'A group for tech enthusiasts.', 6),
('Yoga Masters', 'A group for yoga lovers.', 7),
('Foodies Hub', 'A group for food lovers.', 8),
('Nature Admirers', 'A group for nature lovers.', 9),
('Sports Fanatics', 'A group for sports enthusiasts.', 10);

SELECT * FROM Grp;


CREATE TABLE GroupMembers (
    GroupID INT,
    UserID INT,
    JoinedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (GroupID, UserID),
    FOREIGN KEY (GroupID) REFERENCES Grp(GroupID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO GroupMembers (GroupID, UserID)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT * FROM GroupMembers;

CREATE TABLE Events (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    EventName VARCHAR(100) NOT NULL,
    EventDescription TEXT,
    EventDate DATETIME NOT NULL,
    CreatedBy INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO Events (EventName, EventDescription, EventDate, CreatedBy)
VALUES ('Beach Cleanup', 'Join us for a beach cleanup event.', '2024-09-15 09:00:00', 1),
('Hackathon', 'A coding challenge for all levels.', '2024-09-20 10:00:00', 2),
('Photography Walk', 'Explore the city and take great photos.', '2024-09-25 08:00:00', 3),
('Live Concert', 'A live concert by local bands.', '2024-09-30 19:00:00', 4),
('Book Reading', 'Join us for a book reading session.', '2024-10-05 15:00:00', 5),
('Tech Expo', 'Showcasing the latest tech gadgets.', '2024-10-10 12:00:00', 6),
('Yoga Retreat', 'A weekend yoga retreat.', '2024-10-15 07:00:00', 7),
('Food Festival', 'Taste delicious foods from around the world.', '2024-10-20 11:00:00', 8),
('Nature Hike', 'A hike through the forest.', '2024-10-25 06:00:00', 9),
('Sports Day', 'Compete in various sports activities.', '2024-10-30 09:00:00', 10);

SELECT * FROM Events;

CREATE TABLE EventParticipants (
    EventID INT,
    UserID INT,
    JoinedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (EventID, UserID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO EventParticipants (EventID, UserID)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT * FROM EventParticipants;

CREATE TABLE Media (
    MediaID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MediaType ENUM('image', 'video') NOT NULL,
    MediaURL VARCHAR(255) NOT NULL,
    UploadedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Media (UserID, MediaType, MediaURL)
VALUES (1, 'image', 'media_image1.jpg'),
(2, 'video', 'media_video1.mp4'),
(3, 'image', 'media_image2.jpg'),
(4, 'video', 'media_video2.mp4'),
(5, 'image', 'media_image3.jpg'),
(6, 'video', 'media_video3.mp4'),
(7, 'image', 'media_image4.jpg'),
(8, 'video', 'media_video4.mp4'),
(9, 'image', 'media_image5.jpg'),
(10, 'video', 'media_video5.mp4');

SELECT * FROM Media;


CREATE TABLE Tags (
    TagID INT AUTO_INCREMENT PRIMARY KEY,
    TagName VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Tags (TagName)
VALUES ('Nature'),
('Technology'),
('Music'),
('Food'),
('Travel'),
('Photography'),
('Books'),
('Sports'),
('Yoga'),
('Coding');

SELECT * FROM Tags;

CREATE TABLE PostTags (
    PostID INT,
    TagID INT,
    PRIMARY KEY (PostID, TagID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (TagID) REFERENCES Tags(TagID) ON DELETE CASCADE
);

INSERT INTO PostTags (PostID, TagID)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT * FROM PostTags;

CREATE TABLE Follows (
    FollowerID INT,
    FollowedID INT,
    FollowedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (FollowerID, FollowedID),
    FOREIGN KEY (FollowerID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (FollowedID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO Follows (FollowerID, FollowedID)
VALUES (1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

SELECT * FROM Follows;
