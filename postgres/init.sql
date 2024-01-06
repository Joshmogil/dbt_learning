-- Connect to the default database to perform administrative tasks
-- Create the 'example' database
-- CREATE DATABASE example;

-- Connect to the 'example' database to continue setup
\c example

-- Create the 'source' schema
CREATE SCHEMA source;

-- Create 'dbt_user' with a specified password
CREATE USER dbt_user WITH PASSWORD 'password';

-- Grant all privileges on the schema 'source' to 'dbt_user'
GRANT ALL PRIVILEGES ON SCHEMA source TO dbt_user;

-- Grant all privileges on the database 'example' to 'dbt_user'
GRANT ALL PRIVILEGES ON DATABASE example TO dbt_user;

-- Set default search path for 'dbt_user' to 'source'
ALTER USER dbt_user SET search_path TO source;

-- Create the 'users' table within the 'source' schema
CREATE TABLE source.users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    phone_number VARCHAR(15),
    address TEXT,
    status BOOLEAN DEFAULT TRUE
);

-- Grant specific privileges on the 'users' table to 'dbt_user'
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE source.users TO dbt_user;

-- Create the 'pets' table
CREATE TABLE source.pets (
    pet_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    age INT,
    microchip_id VARCHAR(50) UNIQUE
);

-- Grant specific privileges on the 'pets' table to 'dbt_user'
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE source.pets TO dbt_user;

-- Create the 'user_pets' junction table
CREATE TABLE source.user_pets (
    user_id INT,
    pet_id INT,
    FOREIGN KEY (user_id) REFERENCES source.users(user_id),
    FOREIGN KEY (pet_id) REFERENCES source.pets(pet_id),
    PRIMARY KEY (user_id, pet_id)
);

-- Grant specific privileges on the 'user_pets' table to 'dbt_user'
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE source.user_pets TO dbt_user;

INSERT INTO source.users (username, email, first_name, last_name, date_of_birth, phone_number, address) VALUES
('john_doe', 'john.doe@example.com', 'John', 'Doe', '1980-01-01', '123-456-7890', '123 Main St'),
('jane_smith', 'jane.smith@example.com', 'Jane', 'Smith', '1981-02-02', '123-456-7891', '124 Main St'),
('emily_johnson', 'emily.johnson@example.com', 'Emily', 'Johnson', '1982-03-03', '123-456-7892', '125 Main St'),
('mike_davis', 'mike.davis@example.com', 'Mike', 'Davis', '1983-04-04', '123-456-7893', '126 Main St'),
('sarah_wilson', 'sarah.wilson@example.com', 'Sarah', 'Wilson', '1984-05-05', '123-456-7894', '127 Main St'),
('brian_martinez', 'brian.martinez@example.com', 'Brian', 'Martinez', '1985-06-06', '123-456-7895', '128 Main St'),
('laura_garcia', 'laura.garcia@example.com', 'Laura', 'Garcia', '1986-07-07', '123-456-7896', '129 Main St'),
('david_lee', 'david.lee@example.com', 'David', 'Lee', '1987-08-08', '123-456-7897', '130 Main St'),
('jessica_young', 'jessica.young@example.com', 'Jessica', 'Young', '1988-09-09', '123-456-7898', '131 Main St'),
('tom_hernandez', 'tom.hernandez@example.com', 'Tom', 'Hernandez', '1989-10-10', '123-456-7899', '132 Main St'),
('lisa_moore', 'lisa.moore@example.com', 'Lisa', 'Moore', '1990-11-11', '123-456-7810', '133 Main St'),
('gary_white', 'gary.white@example.com', 'Gary', 'White', '1991-12-12', '123-456-7811', '134 Main St');

-- Inserting 22 pets
INSERT INTO source.pets (name, species, breed, age, microchip_id) VALUES
('Buddy', 'Dog', 'Golden Retriever', 3, 'M1001'),
('Max', 'Dog', 'Beagle', 4, 'M1002'),
('Bella', 'Cat', 'Siamese', 2, 'M1003'),
('Lucy', 'Cat', 'Persian', 5, 'M1004'),
('Charlie', 'Dog', 'Labrador', 6, 'M1005'),
('Daisy', 'Dog', 'Dachshund', 1, 'M1006'),
('Molly', 'Cat', 'Bengal', 3, 'M1007'),
('Bailey', 'Dog', 'Poodle', 2, 'M1008'),
('Rocky', 'Dog', 'Boxer', 5, 'M1009'),
('Maggie', 'Dog', 'Bulldog', 4, 'M1010'),
('Sophie', 'Cat', 'Ragdoll', 6, 'M1011'),
('Chloe', 'Cat', 'Maine Coon', 1, 'M1012'),
('Oscar', 'Dog', 'Cocker Spaniel', 2, 'M1013'),
('Zoe', 'Dog', 'Rottweiler', 3, 'M1014'),
('Lily', 'Cat', 'Sphynx', 4, 'M1015'),
('Coco', 'Dog', 'Border Collie', 2, 'M1016'),
('Stella', 'Dog', 'Australian Shepherd', 3, 'M1017'),
('Ginger', 'Cat', 'British Shorthair', 5, 'M1018'),
('Rusty', 'Dog', 'Shih Tzu', 1, 'M1019'),
('Shadow', 'Cat', 'Scottish Fold', 3, 'M1020'),
('Leo', 'Cat', 'Abyssinian', 4, 'M1021'),
('Sadie', 'Dog', 'Pit Bull', 2, 'M1022');

INSERT INTO source.user_pets (user_id, pet_id) VALUES
(1, 1), (1, 2), (1, 3), -- 3 pets for User 1
(2, 4), (2, 5), -- 2 pets for User 2
(3, 6), (3, 7), (3, 8), (3, 9), -- 4 pets for User 3
(4, 10), (4, 11), -- 2 pets for User 4
(5, 12), (5, 13), (5, 14), -- 3 pets for User 5
(6, 15), (6, 16), (6, 17), -- 3 pets for User 6
(7, 18), (7, 19), -- 2 pets for User 7
(8, 20), (8, 21), (8, 22), -- 3 pets for User 8
(9, 1), (9, 7), -- 2 pets for User 9
(10, 14), (10, 15), (10, 4); -- 3 pets for User 10
