CREATE KEYSPACE IF NOT EXISTS my_keyspace
WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};



USE my_keyspace;

CREATE TABLE IF NOT EXISTS users (
    user_id int PRIMARY KEY,
    name text,
    age int
);


INSERT INTO users (user_id, name, age) VALUES (1, 'Alice', 30);
INSERT INTO users (user_id, name, age) VALUES (2, 'Bob', 25);
INSERT INTO users (user_id, name, age) VALUES (3, 'Charlie', 28);

SELECT * FROM users;  -- To verify the inserted data



UPDATE users SET age = 31 WHERE user_id = 1;  -- Updating age for user_id 1 (Alice)

SELECT * FROM users;  -- To verify the update


DELETE FROM users WHERE user_id = 2;  -- Deleting user with user_id 2 (Bob)

SELECT * FROM users;  -- To verify the deletion

