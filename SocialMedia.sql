
CREATE DATABASE SocialMediaDB;

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
VALUES ('Vijay', 'vijay@onlin.com', 'random_password', 'vijay Master', 'Just a regular guy.', 'profile1.jpg');

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
VALUES (1, 'beautifull post!', 'post_image1.jpg');

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
VALUES (1, 1, 'Great post!');




CREATE TABLE Likes (
    LikeID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT,
    UserID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Likes (PostID, UserID)
VALUES (1, 1);

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
VALUES (1, 2, 'accepted');

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
VALUES (1, 2, 'Hey, how are you?');




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
VALUES (2, 'like', 1, FALSE);


CREATE TABLE Grp (
    GroupID INT AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(100) NOT NULL,
    GroupDescription TEXT,
    CreatedBy INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CreatedBy) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Grp (GroupName, GroupDescription, CreatedBy)
VALUES ('Travel Enthusiasts', 'A group for people who love to travel.', 1);




CREATE TABLE GroupMembers (
    GroupID INT,
    UserID INT,
    JoinedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (GroupID, UserID),
    FOREIGN KEY (GroupID) REFERENCES Grp(GroupID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO GroupMembers (GroupID, UserID)
VALUES (1, 1);



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
VALUES ('Beach Cleanup', 'Join us for a beach cleanup event.', '2024-09-15 09:00:00', 1);



CREATE TABLE EventParticipants (
    EventID INT,
    UserID INT,
    JoinedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (EventID, UserID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO EventParticipants (EventID, UserID)
VALUES (1, 1);



CREATE TABLE Media (
    MediaID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    MediaType ENUM('image', 'video') NOT NULL,
    MediaURL VARCHAR(255) NOT NULL,
    UploadedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

INSERT INTO Media (UserID, MediaType, MediaURL)
VALUES (1, 'image', 'media_image1.jpg');



CREATE TABLE Tags (
    TagID INT AUTO_INCREMENT PRIMARY KEY,
    TagName VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO Tags (TagName)
VALUES ('Nature');


CREATE TABLE PostTags (
    PostID INT,
    TagID INT,
    PRIMARY KEY (PostID, TagID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (TagID) REFERENCES Tags(TagID) ON DELETE CASCADE
);

INSERT INTO PostTags (PostID, TagID)
VALUES (1, 1);



CREATE TABLE Follows (
    FollowerID INT,
    FollowedID INT,
    FollowedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (FollowerID, FollowedID),
    FOREIGN KEY (FollowerID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (FollowedID) REFERENCES Users(UserID) ON DELETE CASCADE
);
INSERT INTO Follows (FollowerID, FollowedID)
VALUES (1, 2);
