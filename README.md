
# AWS Migration Strategies & Database Migration Service

## Project Overview

This project explains AWS cloud migration strategies
and the working principles of AWS Database Migration
Service (DMS).

It includes Terraform configuration, SQL examples,
migration documentation, and a local Python database
migration demonstration.

## Objectives

1. Understand the seven AWS migration strategies.
2. Study AWS Database Migration Service.
3. Explain source and target database endpoints.
4. Demonstrate database migration concepts.
5. Validate database records after migration.

## Technologies Used

- Amazon Web Services (AWS)
- AWS Database Migration Service
- Terraform
- MySQL
- Python
- SQLite
- SQL
- GitHub

## Repository Files

- main.tf - Terraform AWS DMS configuration
- table-mappings.json - DMS table selection rules
- migration_strategies.md - AWS migration strategies
- dms_implementation.md - AWS DMS implementation guide
- sql/source_database.sql - Sample MySQL database
- sql/validation.sql - Data validation queries
- src/local_migration.py - Local migration demonstration
- .gitignore - Excluded local and sensitive files

## Local Demonstration

Requirements: Python 3

Run:

    python3 src/local_migration.py

Expected output:

    Source Records: 5
    Target Records: 5
    Migration Status: SUCCESS

The output above is expected after successful execution.

## AWS DMS Workflow

1. Prepare source and target databases.
2. Configure AWS networking and IAM permissions.
3. Create a DMS replication instance.
4. Configure database endpoints.
5. Test endpoint connectivity.
6. Create and start a migration task.
7. Monitor progress and validate the target data.

## Important Note

The Python demonstration uses SQLite locally.
It does not use AWS DMS.

Terraform files describe AWS infrastructure.
An actual AWS deployment requires valid database
endpoints, credentials, networking, permissions,
and a configured AWS account.

## Conclusion

The project provides an overview of AWS migration
strategies and demonstrates fundamental database
migration and validation concepts.

## References

https://docs.aws.amazon.com/dms/
https://docs.aws.amazon.com/prescriptive-guidance/
https://developer.hashicorp.com/terraform

