
import sqlite3
from pathlib import Path

BASE = Path(__file__).resolve().parent.parent
SOURCE = BASE / "source.db"
TARGET = BASE / "target.db"

def create_source():
    with sqlite3.connect(SOURCE) as conn:
        conn.execute("""
            CREATE TABLE IF NOT EXISTS students (
                student_id INTEGER PRIMARY KEY,
                student_name TEXT,
                department TEXT
            )
        """)

        conn.executemany("""
            INSERT OR REPLACE INTO students
            VALUES (?, ?, ?)
        """, [
            (101, "Rahul", "CSE"),
            (102, "Priya", "ECE"),
            (103, "Arjun", "IT"),
            (104, "Sneha", "CSE"),
            (105, "Kiran", "EEE")
        ])

def migrate_database():
    with sqlite3.connect(SOURCE) as source:
        records = source.execute(
            "SELECT * FROM students ORDER BY student_id"
        ).fetchall()

    with sqlite3.connect(TARGET) as target:
        target.execute("""
            CREATE TABLE IF NOT EXISTS students (
                student_id INTEGER PRIMARY KEY,
                student_name TEXT,
                department TEXT
            )
        """)

        target.executemany("""
            INSERT OR REPLACE INTO students
            VALUES (?, ?, ?)
        """, records)

    return records

def validate_migration(source_records):
    with sqlite3.connect(TARGET) as target:
        target_records = target.execute(
            "SELECT * FROM students ORDER BY student_id"
        ).fetchall()

    print("Source Records:", len(source_records))
    print("Target Records:", len(target_records))

    if source_records == target_records:
        print("Migration Status: SUCCESS")
    else:
        print("Migration Status: FAILED")

if __name__ == "__main__":
    print("Local Database Migration Demonstration")
    print("This is not an actual AWS DMS migration.")

    create_source()
    records = migrate_database()
    validate_migration(records)
