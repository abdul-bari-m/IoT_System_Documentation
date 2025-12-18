# API Specification – Temperature Monitoring System

This document describes the REST APIs exposed by the Flask service. These APIs are used by the web dashboard to fetch live and historical temperature data from the system.

The focus here is on clarity and practical usage, similar to how lightweight APIs are documented in real IoT dashboards.

---

## Base URL

```
/api
```

---

## 1. Get Latest Temperature

**Endpoint**

```
GET /api/latest/<device_id>
```

**Purpose**
Returns the most recent temperature reading for a device. The value is usually served from Redis so the response is quick.

**Example Request**

```
GET /api/latest/dev101
```

**Example Response**

```json
{
  "device_id": "dev101",
  "temperature": 27.4,
  "unit": "°C",
  "timestamp": "2025-12-16T10:32:15Z"
}
```

**Notes**

* Used for live dashboard updates
* If Redis does not have a value, the service can fall back to InfluxDB

---

## 2. Get Temperature History

**Endpoint**

```
GET /api/history/<device_id>
```

**Purpose**
Fetches historical temperature readings for a device from InfluxDB. This data is mainly used for charts and trend views.

**Query Parameter**

* `range` – time window for data (for example: `1h`, `24h`, `7d`)

**Example Request**

```
GET /api/history/dev101?range=1h
```

**Example Response**

```json
{
  "device_id": "dev101",
  "range": "1h",
  "readings": [
    {"timestamp": "2025-12-16T09:45:00Z", "temperature": 26.9},
    {"timestamp": "2025-12-16T10:00:00Z", "temperature": 27.1},
    {"timestamp": "2025-12-16T10:15:00Z", "temperature": 27.4}
  ]
}
```

**Notes**

* Data is read only from InfluxDB
* Suitable for historical analysis and reports

---

## 3. Service Health Check

**Endpoint**

```
GET /api/health
```

**Purpose**
Checks whether the API service is running. This is useful during testing and deployment.

**Example Response**

```json
{
  "status": "ok",
  "service": "temperature-api"
}
```

---

## Common Error Responses

* `400` – request is missing required parameters or values
* `404` – device ID not found
* `500` – internal server issue

Responses are returned in simple JSON format so they are easy for the dashboard to handle.

---

## Usage Summary

* Live data requests use the **latest** API
* Historical views use the **history** API
* Health endpoint is used for monitoring and checks

This API set is intentionally kept small and clear, which is common for early-stage and dashboard-focused IoT systems.
