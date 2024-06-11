CREATE DATABASE TalentAppDB;
GO

-- Використання бази даних TalentAppDB
USE TalentAppDB;
GO

-- Створення таблиці Talent
CREATE TABLE [Talent] (
    TalentId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Skills NVARCHAR(255) NOT NULL,
    Experience INT NOT NULL
);
GO

-- Створення таблиці Project
CREATE TABLE [Project] (
    ProjectId INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NOT NULL
);
GO

-- Створення таблиці TalentProject
CREATE TABLE [TalentProject] (
    TalentId INT NOT NULL,
    ProjectId INT NOT NULL,
    PRIMARY KEY (TalentId, ProjectId),
    FOREIGN KEY (TalentId) REFERENCES [Talent](TalentId),
    FOREIGN KEY (ProjectId) REFERENCES [Project](ProjectId)
);
GO

-- Вставка даних у таблицю Talent
INSERT INTO [Talent] (Name, Skills, Experience) VALUES
('John Doe', 'C#, SQL, WPF', 5),
('Jane Smith', 'JavaScript, React, Node.js', 3),
('Alice Johnson', 'Python, Django, Machine Learning', 7),
('Michael Brown', 'Java, Spring, Hibernate', 4),
('Emma Jones', 'Ruby on Rails, JavaScript', 6),
('Oliver Davis', 'PHP, Laravel, MySQL', 8),
('Ava Martin', 'C++, Qt, STL', 5),
('Jack Wilson', 'Swift, iOS Development', 3),
('Sophia Moore', 'Android, Kotlin', 4),
('Liam Taylor', 'JavaScript, Vue.js', 2),
('Charlotte Anderson', 'PHP, Symfony', 6),
('Elijah Thomas', 'Java, Spring Boot', 7),
('Isabella Jackson', 'Python, Flask', 5),
('Benjamin White', 'C#, .NET', 6),
('Mia Harris', 'JavaScript, Node.js', 4),
('Olivia Clark', 'Ruby, Sinatra', 3),
('Elijah Lewis', 'C++, Visual Studio', 5),
('Emma Robinson', 'Java, Kotlin', 7),
('Lucas Walker', 'React Native, Flutter', 6),
('Mia Hall', 'PHP, CodeIgniter', 4),
('Noah Allen', 'Ruby, Rails', 5),
('Sophia King', 'JavaScript, Angular', 6),
('James Young', 'Python, Django', 7),
('Lucas Hill', 'Java, Spring Framework', 8),
('Lily Adams', 'C#, ASP.NET', 4),
('Emma Garcia', 'JavaScript, React', 3),
('Jack Martinez', 'PHP, Laravel', 5),
('Olivia Rodriguez', 'C++, Qt', 6);
GO

-- Вставка даних у таблицю Project
INSERT INTO [Project] (Name, Description) VALUES
('Project Alpha', 'A project to develop a web application using React and Node.js'),
('Project Beta', 'A project to create a desktop application using WPF and C#'),
('Project Gamma', 'A data science project using Python and Machine Learning'),
('Project Delta', 'A mobile app development project using Swift and Kotlin'),
('Project Epsilon', 'A full-stack web application using PHP and Laravel'),
('Project Zeta', 'An enterprise application using Java and Spring'),
('Project Eta', 'A game development project using C++ and Unreal Engine'),
('Project Theta', 'A cloud-based solution using Azure and .NET'),
('Project Iota', 'A big data analysis project using Hadoop and Spark'),
('Project Kappa', 'A blockchain application development using Solidity'),
('Project Lambda', 'An IoT project using Raspberry Pi and Python'),
('Project Mu', 'A machine learning project using TensorFlow and Python'),
('Project Nu', 'A CRM system development using JavaScript and Node.js'),
('Project Xi', 'A finance application using Java and Spring Boot'),
('Project Omicron', 'A health tech application using React Native'),
('Project Pi', 'A data visualization project using D3.js and JavaScript'),
('Project Rho', 'A smart home application using Arduino and C++'),
('Project Sigma', 'A virtual reality project using Unity and C#'),
('Project Tau', 'An educational app using Flutter and Dart'),
('Project Upsilon', 'A social media platform using Angular and Firebase'),
('Project Phi', 'An e-commerce platform using Ruby on Rails'),
('Project Chi', 'A logistics management system using .NET and SQL'),
('Project Psi', 'A digital marketing tool using Python and Django'),
('Project Omega', 'A research project on AI and machine learning'),
('Project Beta II', 'An advanced desktop application with WPF and .NET'),
('Project Alpha II', 'A web-based platform with React and Express'),
('Project Gamma II', 'A mobile app with Kotlin and Swift'),
('Project Delta II', 'A cross-platform app with Flutter'),
('Project Epsilon II', 'A high-load application with Java and Spring Boot');
GO

-- Вставка даних у таблицю TalentProject після внесення всіх Talent і Project
INSERT INTO [TalentProject] (TalentId, ProjectId) VALUES
(1, 1), -- John Doe on Project Alpha
(2, 2), -- Jane Smith on Project Beta
(3, 3), -- Alice Johnson on Project Gamma
(4, 4), -- Michael Brown on Project Delta
(5, 5), -- Emma Jones on Project Epsilon
(6, 6), -- Oliver Davis on Project Zeta
(7, 7), -- Ava Martin on Project Eta
(8, 8), -- Jack Wilson on Project Theta
(9, 9), -- Sophia Moore on Project Iota
(10, 10), -- Liam Taylor on Project Kappa
(11, 11), -- Charlotte Anderson on Project Lambda
(12, 12), -- Elijah Thomas on Project Mu
(13, 13), -- Isabella Jackson on Project Nu
(14, 14), -- Benjamin White on Project Xi
(15, 15), -- Mia Harris on Project Omicron
(16, 16), -- Olivia Clark on Project Pi
(17, 17), -- Elijah Lewis on Project Rho
(18, 18), -- Emma Robinson on Project Sigma
(19, 19), -- Lucas Walker on Project Tau
(20, 20), -- Mia Hall on Project Upsilon
(21, 21), -- Noah Allen on Project Phi
(22, 22), -- Sophia King on Project Chi
(23, 23), -- James Young on Project Psi
(24, 24), -- Lucas Hill on Project Omega
(25, 25), -- Lily Adams on Project Beta II
(26, 26), -- Emma Garcia on Project Alpha II
(27, 27), -- Jack Martinez on Project Gamma II
(28, 28), -- Olivia Rodriguez on Project Delta II
(29, 29); -- New Talent on Project Epsilon II
GO

-- Вибірка всіх записів з таблиці Talent
SELECT * FROM Talent;
GO

-- Вибірка всіх записів з таблиці Project
SELECT * FROM Project;
GO

-- Вибірка всіх записів з таблиці TalentProject
SELECT * FROM TalentProject;
GO

-- Вибірка всіх проектів, в яких бере участь конкретний талант (наприклад, з TalentId = 1)
SELECT 
    p.Name AS ProjectName, 
    p.Description AS ProjectDescription
FROM 
    Project p
JOIN 
    TalentProject tp ON p.ProjectId = tp.ProjectId
WHERE 
    tp.TalentId = 1;
GO

-- Вибірка всіх талантів, які беруть участь у конкретному проекті (наприклад, з ProjectId = 1)
SELECT 
    t.Name AS TalentName, 
    t.Skills, 
    t.Experience
FROM 
    Talent t
JOIN 
    TalentProject tp ON t.TalentId = tp.TalentId
WHERE 
    tp.ProjectId = 1;
GO
