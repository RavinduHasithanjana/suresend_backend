-- Create the Person table
CREATE TABLE Person (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    dob DATE,
    country_of_residence VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    secret_pin VARCHAR(10) NOT NULL,
    cell VARCHAR(20),
    address TEXT,
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    password VARCHAR(255) NOT NULL
);
 --  Full name , DOB , Country of resident , email , secrete pin

 CREATE TABLE referral_codes (
    id SERIAL PRIMARY KEY,
    person_id INT NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE referral_uses (
    id SERIAL PRIMARY KEY,
    referrer_id INT NOT NULL,
    referred_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (referrer_id) REFERENCES Person(person_id),
    FOREIGN KEY (referred_id) REFERENCES Person(person_id),
    UNIQUE (referred_id) -- a person can only redeem once
);
