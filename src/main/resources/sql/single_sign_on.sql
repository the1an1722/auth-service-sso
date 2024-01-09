CREATE DATABASE IF NOT EXISTS sso;
USE sso;

CREATE TABLE IF NOT EXISTS email (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    description VARCHAR(255),
    is_active TINYINT(1),
    create_time DATETIME(4),
    update_time DATETIME(4),
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS phone (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    phone VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    description VARCHAR(255),
    is_active TINYINT(1),
    create_time DATETIME(4),
    update_time DATETIME(4),
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS address (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    address_line_1 VARCHAR(100) NOT NULL,
    address_line_2 VARCHAR(100),
    address_line_3 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    zip VARCHAR(25),
    type VARCHAR(255),
    is_active TINYINT(1),
    create_time DATETIME(4),
    update_time DATETIME(4),
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS user (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    gender VARCHAR(50),
    birth_date DATE,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    create_time DATETIME(4),
    update_time DATETIME(4),
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS user_role (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    is_active TINYINT(1),
    create_time DATETIME(4) DEFAULT NULL,
    update_time DATETIME(4) DEFAULT NULL,
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS role (
    id INT NOT NULL AUTO_INCREMENT,
    role VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    is_active TINYINT(1),
    create_time DATETIME(4) DEFAULT NULL,
    update_time DATETIME(4) DEFAULT NULL,
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS role_permission (
    id INT NOT NULL AUTO_INCREMENT,
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    is_active TINYINT(1),
    create_time DATETIME(4) DEFAULT NULL,
    update_time DATETIME(4) DEFAULT NULL,
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS permission (
    id INT NOT NULL AUTO_INCREMENT,
    permission VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    is_active TINYINT(1),
    create_time DATETIME(4) DEFAULT NULL,
    update_time DATETIME(4) DEFAULT NULL,
    update_by INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS user_token (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    token VARCHAR(255) NOT NULL,
    expire_time DATETIME(4),
    is_active TINYINT(1),
    create_time DATETIME(4) DEFAULT NULL,
    update_time DATETIME(4) DEFAULT NULL,
    update_by INT,
    PRIMARY KEY (id)
);

-- Test
INSERT INTO email (user_id, email, type, description, is_active, create_time, update_time, update_by)
VALUES
    (1, 'user1@example.com', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (2, 'user2@example.com', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (3, 'user3@example.com', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO phone (user_id, phone, type, description, is_active, create_time, update_time, update_by)
VALUES
    (1, '+1234567890', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (2, '+9876543210', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (3, '+5555555555', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO address (user_id, address_line_1, address_line_2, address_line_3, city, state, country, zip, type, is_active, create_time, update_time, update_by)
VALUES
    (1, '123 Main St', NULL, NULL, 'Anytown', 'CA', 'USA', '12345', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (2, '456 Elm St', NULL, NULL, 'Othertown', 'NY', 'USA', '54321', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (3, '789 Oak St', NULL, NULL, 'Sometown', 'TX', 'USA', '67890', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO user_role (user_id, role_id, is_active, create_time, update_time, update_by)
VALUES
    (1, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (2, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (3, 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO role (role, description, is_active, create_time, update_time, update_by)
VALUES
    ('Admin', 'Administrator', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('User', 'Regular User', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Manager', 'Manager User', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO role_permission (role_id, permission_id, is_active, create_time, update_time, update_by)
VALUES
    (1, 1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (2, 2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (3, 3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO permission (permission, description, is_active, create_time, update_time, update_by)
VALUES
    ('Read', 'Read Permission', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Write', 'Write Permission', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    ('Execute', 'Execute Permission', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO user_token (user_id, token, expire_time, is_active, create_time, update_time, update_by)
VALUES
    (1, 'token1', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (2, 'token2', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL),
    (3, 'token3', NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);