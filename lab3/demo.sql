CREATE KEYSPACE ks WITH replication = {'class': 'NetworkTopologyStrategy', 'replication_factor' : 1};

USE ks;

CREATE TABLE IF NOT EXISTS ks.users (
    user_id int PRIMARY KEY,
    name text,
    age int
) WITH cdc = {'enabled': true};

INSERT INTO ks.users (user_id, name, age) VALUES (1, 'Alice', 30);
INSERT INTO ks.users (user_id, name, age) VALUES (2, 'Bob', 25);
INSERT INTO ks.users (user_id, name, age) VALUES (3, '***', 28);

SELECT * FROM users;


