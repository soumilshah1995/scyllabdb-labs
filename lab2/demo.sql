-- Create Keyspace if not already created
CREATE KEYSPACE IF NOT EXISTS my_keyspace
WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE my_keyspace;

-- Create Table with new columns: city, state, and ts (auto-generated timestamp)
CREATE TABLE IF NOT EXISTS users (
    user_id int PRIMARY KEY,
    name text,
    age int,
    city text,
    state text
) WITH cdc = {'enabled': true,  'delta': 'full'};

-- Insert Data (you can leave out the ts column as it will be auto-generated)
INSERT INTO users (user_id, name, age, city, state)
VALUES (1, 'Alice', 30, 'Seattle', 'WA');

INSERT INTO users (user_id, name, age, city, state)
VALUES (2, 'Bob', 25, 'San Francisco', 'CA');

INSERT INTO users (user_id, name, age, city, state)
VALUES (3, 'Charlie', 28, 'Austin', 'TX');

-- Select to verify inserted data
SELECT * FROM users;

-- Updating age and location for user_id 1 (Alice)
INSERT INTO users (user_id, name, age, city, state)
VALUES (1, 'Alice', 33, 'Seattle', 'WA');


-- Select to verify the update
SELECT * FROM users;


SELECT tounixtimestamp("cdc$time") , user_id, name, age, city, state, "cdc$operation" FROM users_scylla_cdc_log LIMIT 10;

