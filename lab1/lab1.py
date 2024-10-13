from cassandra.cluster import Cluster

def main():
    # Connect to the ScyllaDB instance
    cluster = Cluster(['127.0.0.1'])
    session = cluster.connect('my_keyspace')

    # Step 1: Insert mock data
    users_to_insert = [
        (1, 'Alice', 30),
        (2, 'Bob', 25),
        (3, 'Charlie', 28)
    ]

    for user_id, name, age in users_to_insert:
        session.execute("""
        INSERT INTO users (user_id, name, age)
        VALUES (%s, %s, %s)
        """, (user_id, name, age))

    print("Mock user data inserted successfully.")

    # Step 2: Update Alice's age
    session.execute("""
    UPDATE users
    SET age = %s
    WHERE user_id = %s
    """, (31, 1))  # Updating age for user_id 1 (Alice)

    print("User data modified successfully for Alice.")

    # Step 3: Delete Bob
    session.execute("""
    DELETE FROM users
    WHERE user_id = %s
    """, (2,))  # Deleting user with user_id 2 (Bob)

    print("User record deleted successfully for Bob.")

    # Query data to verify
    rows = session.execute("SELECT * FROM users")
    print("\nRemaining users in the table:")
    for row in rows:
        print(f"User ID: {row.user_id}, Name: {row.name}, Age: {row.age}")

    # Close the session
    session.shutdown()
    cluster.shutdown()

if __name__ == "__main__":
    main()
