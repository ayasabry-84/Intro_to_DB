import mysql.connector

# Establish the connection
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="T_#258@ya$npr",
    database="alx_book_store"
)

# Create a cursor object
mycursor = mydb.cursor()

# Create Authors table
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Authors (
        author_id INT PRIMARY KEY AUTO_INCREMENT,
        author_name VARCHAR(215) NOT NULL
    );
""")

# Create Books table
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Books (
        book_id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(130) NOT NULL,
        author_id INT,
        price DOUBLE,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    );
""")

# Create Customers table
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT PRIMARY KEY AUTO_INCREMENT,
        customer_name VARCHAR(215) NOT NULL,
        email VARCHAR(215),
        address TEXT
    );
""")

# Create Orders table
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders (
        order_id INT PRIMARY KEY AUTO_INCREMENT,
        customer_id INT NOT NULL,
        order_date DATE,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );
""")

# Create Order_Details table
mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT,
        book_id INT,
        quantity DOUBLE,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
    );
""")

print("All tables created successfully!")

# Close the cursor and connection
mycursor.close()
mydb.close()

