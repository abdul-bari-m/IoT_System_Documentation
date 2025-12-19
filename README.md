# IoT Temperature Monitoring System

**System Design & Documentation**

## Overview

This repository contains the complete system design documentation for a simple IoT-based temperature monitoring system. The focus of this project is on **how data flows through the system**, **how different storage layers are used**, and **how a dashboard accesses sensor data through APIs**.

The project is intentionally kept simple so the overall design is easy to understand and explain.

---

## Problem Statement

Temperature monitoring is a common requirement in many environments such as indoor spaces, server rooms, and small industrial setups. Sensors continuously generate readings, but these values are only useful when they can be processed, stored, and viewed in a clear way.

The objective of this system is to design a clean and reliable flow where temperature data is:

* collected from sensors,
* transferred safely to the backend,
* stored for both short-term and long-term use,
* and displayed through a web dashboard.

---

## System Overview

At a high level, the system works as follows:

```
Temperature Sensor → MQTT Broker → Flask API Service
                   → Redis (latest data)
                   → InfluxDB (historical data)

Web Dashboard ↔ Flask API Service (REST API)
```

This separation allows fast access to live data while still keeping a complete history of readings.

---

## Architecture Diagram

The architecture diagram shows all major components and how they are connected.

Diagram:

<img width="435" height="790" alt="architecture_diagram" src="https://github.com/user-attachments/assets/bab1e07a-930e-4ff5-b180-bc2834f2f044" />
```

**Key components**

* Temperature Sensor publishes readings using MQTT
* MQTT Broker handles message delivery
* Flask API Service processes incoming data
* Redis stores the most recent value
* InfluxDB stores historical time-series data
* Web Dashboard requests data through REST APIs

---

## Data Flow Diagrams

### DFD Level 0

Shows the system as a single unit interacting with external entities.

Diagam:

<img width="756" height="221" alt="dataflow_diagram_0" src="https://github.com/user-attachments/assets/9dc82283-c94f-4e81-8584-e07c3b9e9db1" />

### DFD Level 1

Breaks the system into internal components and shows detailed data movement.

Diagram:

<img width="856" height="514" alt="dataflow_diagram_1" src="https://github.com/user-attachments/assets/348d6ff6-814d-4948-b259-4f54ad18e605" />

**Main flows**

* Temperature Reading from sensor to backend
* Latest Temperature stored in Redis
* Historical Readings stored in InfluxDB
* Dashboard requests data via REST API
* API responds with sensor data in JSON format

---

## Database Design

### SQL Schema

Used for structured data such as device information and metadata.

📌 File:

```
database_schema.sql
```

### MongoDB Structure

Used for flexible or optional configuration-style data.

📌 File:

```
mongo_structure.json
```

---

## Redis & InfluxDB Data Model

### Redis (Real-time Data)

* Stores only the most recent temperature value per device
* Enables fast access for live dashboard updates
* Data is short-lived and frequently updated

📌 File:

```
redis_structure.txt
```

### InfluxDB (Historical Data)

* Stores all temperature readings over time
* Used for trends, graphs, and history views
* Optimized for time-series queries

📌 File:

```
influx_structure.txt
```

---

## API Endpoints

The Flask API exposes simple REST endpoints used by the web dashboard.

📌 File:

```
api_endpoints.md
```

**Examples**

* Get latest temperature for a device
* Get historical readings for a time range
* Check API service health

All responses are returned in JSON format for easy use on the frontend.

---

## Design Patterns Used

* **Publish–Subscribe Pattern**
  MQTT allows sensors and backend services to stay loosely connected.

* **Separation of Storage Responsibilities**
  Redis handles fast, real-time data while InfluxDB manages long-term history.

* **Stateless REST APIs**
  Makes the backend easy to scale and simple to maintain.

---

## Documentation Folder Structure

```
/documentation/
├── architecture_diagram.png
├── dataflow_diagram_0.png
├── dataflow_diagram_1.png
├── database_schema.sql
├── mongo_structure.json
├── redis_structure.txt
├── influx_structure.txt
├── api_endpoints.md
└── system_description.docx
```

---

## What This Project Demonstrates

* Clear understanding of IoT data flow
* Proper use of MQTT and REST APIs
* Practical database selection for different data needs
* Ability to document system design clearly

This repository is suitable for **project reviews, interviews, and portfolio presentation**.

---

## Notes

This repository focuses on **system design and documentation**.
The API behavior is described conceptually, but executable backend code is not included.

---

## Author
 
Prepared by **ABDUL BARI M**.

---


