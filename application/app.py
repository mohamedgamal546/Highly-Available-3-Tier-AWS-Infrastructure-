from flask import Flask
import os
import socket
import pymysql

app = Flask(__name__)


def get_database_status():
    host = os.getenv("DB_HOST")
    port = int(os.getenv("DB_PORT", "3306"))
    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    database = os.getenv("DB_NAME")

    if not all([host, user, password, database]):
        return "Database configuration not provided"

    try:
        connection = pymysql.connect(
            host=host,
            port=port,
            user=user,
            password=password,
            database=database,
            connect_timeout=5
        )
        connection.close()
        return "Connected"
    except Exception as error:
        return f"Connection failed: {error}"


@app.route("/")
def home():
    hostname = socket.gethostname()
    database_status = get_database_status()

    return {
        "application": "AWS 3-Tier HA Application",
        "hostname": hostname,
        "database": database_status,
        "status": "OK"
    }


@app.route("/health")
def health():
    return {
        "status": "healthy",
        "hostname": socket.gethostname()
    }


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)