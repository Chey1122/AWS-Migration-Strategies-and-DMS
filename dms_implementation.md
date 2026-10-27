
# AWS Database Migration Service (DMS)

## Introduction
AWS DMS is a managed service used to migrate databases
to AWS or between supported database systems.

## Project Architecture

Source Database (MySQL)
        |
        v
AWS DMS Replication Instance
        |
        v
Target Database (Amazon RDS MySQL)

## Main Components

1. Source Database
   Stores the original application data.

2. Target Database
   Receives the migrated data.

3. Replication Instance
   Performs migration processing.

4. Source and Target Endpoints
   Store database connection configurations.

5. Migration Task
   Defines tables and migration settings.

## Migration Procedure

Step 1: Create a source MySQL database.

Step 2: Create a target Amazon RDS database.

Step 3: Configure network access and security groups.

Step 4: Create an AWS DMS replication instance.

Step 5: Configure source and target endpoints.

Step 6: Test both endpoint connections.

Step 7: Create a migration task.

Step 8: Select Full Load or Full Load + CDC.

Step 9: Start the migration task.

Step 10: Monitor the task using AWS DMS.

Step 11: Validate migrated database records.

## Migration Types

- Full Load
- Change Data Capture (CDC)
- Full Load and CDC

## Benefits
- Minimal downtime with CDC
- Supports heterogeneous migrations
- Managed migration infrastructure
- Monitoring and error reporting

## Note
This document describes the implementation workflow.
It does not establish that an AWS migration has been
executed.
