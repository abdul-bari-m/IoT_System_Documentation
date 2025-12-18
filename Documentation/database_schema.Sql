CREATE TABLE devices (
    device_id VARCHAR(50) PRIMARY KEY,
    device_name VARCHAR(100),
    device_type VARCHAR(50),
    location VARCHAR(100),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sensor_readings (
    reading_id SERIAL PRIMARY KEY,
    device_id VARCHAR(50),
    sensor_type VARCHAR(50),
    value FLOAT,
    timestamp TIMESTAMP,
    FOREIGN KEY (device_id) REFERENCES devices(device_id)
);
