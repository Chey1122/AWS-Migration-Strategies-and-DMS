terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# AWS DMS Replication Instance
resource "aws_dms_replication_instance" "dms_instance" {
  replication_instance_id    = "dms-migration-instance"
  replication_instance_class = "dbt3.micro"
  allocated_storage          = 20
  publicly_accessible        = false
  multi_az                   = false
  auto_minor_version_upgrade = true

  tags = {
    Name        = "AWS-DMS-Project"
    Environment = "Production"
  }
}

# Source Database Endpoint (MySQL)
resource "aws_dms_endpoint" "source_db" {
  endpoint_id   = "source-mysql-endpoint"
  endpoint_type = "source"
  engine_name   = "mysql"
  server_name   = "source-db.example.com"
  port          = 3306
  database_name = "production_db"
  username      = "admin"
  password      = "SuperSecretPassword123!"
  ssl_mode      = "none"
}

# Target Database Endpoint (Amazon Aurora PostgreSQL)
resource "aws_dms_endpoint" "target_db" {
  endpoint_id   = "target-aurora-postgres-endpoint"
  endpoint_type = "target"
  engine_name   = "aurora-postgresql"
  server_name   = "aurora-target.example.com"
  port          = 5432
  database_name = "migrated_db"
  username      = "postgres"
  password      = "SuperSecretPassword123!"
  ssl_mode      = "require"
}

# DMS Replication Task (Full Load + CDC)
resource "aws_dms_replication_task" "migration_task" {
  migration_type           = "full-load-and-cdc"
  replication_instance_arn = aws_dms_replication_instance.dms_instance.replication_instance_arn
  replication_task_id      = "dms-full-migration-task"
  source_endpoint_arn      = aws_dms_endpoint.source_db.endpoint_arn
  target_endpoint_arn      = aws_dms_endpoint.target_db.endpoint_arn

  table_mappings = file("table-mappings.json")
}
