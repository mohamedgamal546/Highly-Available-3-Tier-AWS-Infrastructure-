# AWS Multi-Region Database Architecture for Disaster Recovery

## 📌 Project Overview

This project demonstrates the design of a highly available, fault-tolerant, and globally distributed database architecture for a production multi-tier web application deployed across two AWS Regions.

The solution ensures near real-time cross-region data replication, automatic storage scaling, and rapid disaster recovery while maintaining low operational overhead through fully managed AWS database services.

---

## 🏗️ Architecture Design

The solution is deployed across two AWS Regions in an active-passive database architecture using Amazon Aurora Global Database.

### Primary Region

* Amazon Aurora Global Database (Primary Cluster)
* Handles all application read and write operations
* Automatically scales storage as data grows

### Secondary Region

* Amazon Aurora Global Database (Secondary Cluster)
* Continuously replicates data from the primary region
* Ready for disaster recovery and failover

---

## 🌐 Multi-Region Replication

### Global Database Replication

* Cross-region replication latency of less than one second
* Near real-time data synchronization
* Low replication lag
* Global disaster recovery support

---

## ⚖️ High Availability & Disaster Recovery

### High Availability

* Multi-AZ deployment within each AWS Region
* Automatic failover
* Fully managed database infrastructure

### Disaster Recovery

* Recovery Point Objective (RPO): Less than 1 second
* Recovery Time Objective (RTO): Less than 1 minute
* Fast regional failover with minimal downtime

---

## 📈 Scalability & Performance

### Storage

* Automatic storage scaling
* No manual capacity planning required

### Database Performance

* Supports complex SQL queries
* Optimized for table joins
* High-performance relational database engine

---

## 🔐 Security Design

### Encryption

* Encryption at rest using AWS KMS
* Encryption in transit using SSL/TLS

### Network Security

* Database deployed in private subnets
* No public database access
* Security Groups restrict access to authorized application resources only

---

## 🔄 Architecture Flow

Application

↓

Amazon Aurora Global Database

↓

Primary Region

⇄

Secondary Region

↓

Automatic Disaster Recovery

---

## 🎯 Key Features

* Multi-Region Architecture
* Amazon Aurora Global Database
* Cross-Region Replication
* Automatic Storage Scaling
* Multi-AZ High Availability
* Disaster Recovery
* Automatic Failover
* Encryption at Rest
* Encryption in Transit
* Low Operational Overhead

---

## 🧠 Skills Demonstrated

* AWS Architecture Design
* Amazon Aurora Global Database
* Multi-Region Deployment
* Disaster Recovery
* High Availability
* Fault Tolerance
* Database Replication
* Storage Auto Scaling
* AWS KMS
* Cloud Security Best Practices
