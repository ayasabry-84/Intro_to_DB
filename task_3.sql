import mysql.connector

# Establish the connection
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="T_#258@ya$npr",
    database="alx_book_store"  # Specify the database
)

# Create a cursor object
mycursor = mydb.cursor()

# Query to list all tables in the specified database
mycursor.execute("SHOW TABLES;")

# Fetch and print the list of tables
tables = mycursor.fetchall()
print("Tables in 'alx_book_store':")
for table in tables:
    print(table[0])  # Each entry is a tuple, so we need the first element

# Close the cursor and connection
mycursor.close()
mydb.close()

