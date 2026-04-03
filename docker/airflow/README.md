# Airflow Local Setup Quickstart

This folder contains the official Docker Compose setup for Apache Airflow, modified to persist the database locally.

### 1. Initial Setup (Run Once)
Before running Airflow for the first time, you must initialize the database and create the default admin user:
```powershell
# Set your user ID so you have file permissions
echo "AIRFLOW_UID=50000" > .env

# Initialize the Postgres database
docker compose up airflow-init
```

### 2. Start Airflow
Once initialized, spin up the entire cluster in detached mode (background):
```powershell
docker compose up -d
```

### 3. Access the UI
* **URL:** [http://localhost:8080](http://localhost:8080)
* **Username:** `airflow`
* **Password:** `airflow`

### 4. Stop Airflow
To safely turn everything off without deleting your data:
```powershell
docker compose stop
```
*(If you want to completely destroy the containers and start completely fresh later, you can run `docker compose down`)*
