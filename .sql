-- users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    region VARCHAR(50),
    device_type VARCHAR(50),
    marketing_source VARCHAR(100)
);

-- products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2)
);

-- campaigns table
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    budget INT
);

-- sessions table
CREATE TABLE sessions (
    session_id VARCHAR(20) PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    session_start TIMESTAMP,
    session_end TIMESTAMP
);

-- events table
CREATE TABLE events (
    event_id VARCHAR(20) PRIMARY KEY,
    session_id VARCHAR(20) REFERENCES sessions(session_id),
    user_id INT REFERENCES users(user_id),
    event_type VARCHAR(50),
    product_id INT REFERENCES products(product_id),
    event_time TIMESTAMP
);


\COPY users FROM '~/Downloads/users.csv' DELIMITER ',' CSV HEADER;
\COPY products FROM '~/Downloads/products.csv' DELIMITER ',' CSV HEADER;
\COPY campaigns FROM '~/Downloads/campaigns.csv' DELIMITER ',' CSV HEADER;
\COPY sessions FROM '~/Downloads/sessions.csv' DELIMITER ',' CSV HEADER;
\COPY events FROM '~/Downloads/events.csv' DELIMITER ',' CSV HEADER;

SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM campaigns;
SELECT COUNT(*) FROM sessions;
SELECT COUNT(*) FROM events;

