# NetTrace — Internet Outage Detection

## About the Project
NetTrace is a crowdsourced network monitoring application designed to help users identify areas experiencing weak internet connectivity or possible network outages.

The application aims to collect network measurements and location-based reports, analyze network conditions, and visualize possible connectivity problems on a map.

## Objectives
- Detect internet connectivity problems.
- Monitor network quality and reachability.
- Collect location-based reports with user permission.
- Identify areas with weak connectivity or possible outages.
- Visualize reported network conditions on a map.

## Project Structure
- `mobile/` — Flutter mobile application.
- `backend/` — Backend services.
- `database/` — Database schema and related files.
- `docs/` — Project documentation.

## Technology Stack
- **Mobile:** Flutter and Dart
- **Backend:** Java Spring Boot (planned)
- **Database:** PostgreSQL with PostGIS (planned)
- **Network analysis:** Python and FastAPI (planned)

## Current Features
- Flutter mobile application interface.
- Device location retrieval with permission.
- Location details screen.
- Speed test interface with demonstration values.
- Map interface with demonstration network-status data.

**Note:** Some network measurements, speed results, and map statuses are currently demonstration data. Real-time network detection and outage analysis are planned improvements.

## Planned Improvements
- Detect Wi-Fi and mobile network connectivity.
- Check whether the internet is reachable.
- Measure actual network performance.
- Collect user-submitted network reports.
- Aggregate reports to identify possible outage areas.
- Integrate the mobile app with the backend and database.

## Project Status
NetTrace is under active development as a collaborative student project.

## Disclaimer
A connectivity report may indicate an internet access problem, but it does not independently confirm a failure in a specific cell tower or network infrastructure component.