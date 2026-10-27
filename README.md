# AWS Migration Strategies & Database Migration Service (DMS)

## Overview
This repository contains infrastructure configurations and documentation for migrating applications and databases to Amazon Web Services (AWS). It demonstrates the enterprise adoption of the *6 Rs Migration Framework* alongside automated deployment using *AWS Database Migration Service (DMS)*.

---

## 1. AWS 6 Rs Migration Strategies

| Strategy | Description | Typical Use Case |
| :--- | :--- | :--- |
| *Rehost* (Lift & Shift) | Moving servers without altering code or core architecture. | Legacy VMs moving directly to AWS EC2. |
| *Replatform* (Lift, Tinker & Shift) | Minor modifications for performance/cost savings. | Migrating self-hosted DBs to AWS RDS. |
| *Refactor* / Re-architect | Redesigning code for cloud-native features. | Transitioning monolithic apps to Serverless (Lambda) or Containers (ECS/EKS). |
| *Repurchase* (Drop & Shop) | Replacing internal software with commercial SaaS. | Switching from custom CRM to Salesforce. |
| *Retain* | Keeping applications on-premises. | High compliance components or recent hardware investments. |
| *Retire* | Decommissioning redundant applications. | Obsolete tracking systems. |

---

## 2. AWS Database Migration Service (DMS)

AWS DMS enables seamless data migration to AWS with minimal application downtime.

### Core Architecture Components
1. *Replication Instance:* The engine node executing data transfer tasks.
2. *Endpoints:* Connection configurations for Source (MySQL) and Target (Aurora PostgreSQL).
3. *Replication Task:* Defines table selection rules, schema transformations, and replication mode.

### Migration Modes
* *Full Load:* Migrates baseline table structures and data records.
* *Change Data Capture (CDC):* Continuously streams real-time updates (inserts, updates, deletes) to synchronize target databases prior to cutover.

---

## Project Structure
* main.tf — Terraform configuration for AWS DMS endpoints, replication instance, and tasks.
* table-mappings.json — Rule definition file mapping source schemas to target databases.
