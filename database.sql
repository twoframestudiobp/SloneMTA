-- SloneMTA Database Schema
-- Compatible with MySQL/MariaDB

CREATE DATABASE IF NOT EXISTS slonemta;
USE slonemta;

-- News Table
CREATE TABLE IF NOT EXISTS news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) DEFAULT 'Admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Rules Table
CREATE TABLE IF NOT EXISTS rules (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(100) NOT NULL,
    rule_text TEXT NOT NULL,
    display_order INT DEFAULT 0
);

-- Players Table (Basic info for UCP simulation)
CREATE TABLE IF NOT EXISTS players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    level INT DEFAULT 1,
    money INT DEFAULT 5000,
    bank INT DEFAULT 20000,
    playtime INT DEFAULT 0,
    is_online BOOLEAN DEFAULT FALSE
);

-- Insert Sample Data
INSERT INTO news (title, content) VALUES 
('Üdvözlünk a SloneMTA-n!', 'Hamarosan megnyitjuk kapuinkat minden régi és új játékosunk előtt.'),
('Launcher Frissítés', 'Az új launcher elérhető a letöltés menüpont alatt.');

INSERT INTO rules (category, rule_text, display_order) VALUES 
('Általános RP', 'Tilos az OOC szidás és a karakteridegen viselkedés.', 1),
('DM/DB/RK', 'A DeathMatch (DM) és Drive-By (DB) szigorúan tilos.', 2);
