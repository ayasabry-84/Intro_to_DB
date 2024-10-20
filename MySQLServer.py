import mysql.connector
from mysql.connector import errorcode

def create_database():
    try:
        # Connect to MySQL Server
        connection = mysql.connector.connect(
            host="localhost",      # Change if your server isn't local
            user="your_username",  # Replace with your MySQL username
            password="your_password"  # Replace with your MySQL password
        )

        # Creating a cursor object
        cursor = connection.cursor()

        # SQL command to create the database
        create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"

        # Execute the query
        cursor.execute(create_db_query)
        
        # Commit changes
        connection.commit()

        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Invalid username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Error: Database does not exist.")
        else:
            print(f"Error: {err}")
    finally:
        # Close the cursor and connection
        if cursor:
            cursor.close()
        if connection:
            connection.close()

if __name__ == "__main__":
    create_database()

