CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    region_id INT,
    CHECK (country_name IN ('Italy', 'India', 'China'))
);
