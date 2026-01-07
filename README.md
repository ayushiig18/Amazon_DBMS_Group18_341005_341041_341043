# Amazon_DBMS_Group18_341005_341041_341043
Database design and implementation for Amazon using MySQL (DBMS Project)

<p align="center">
  <img src="amazon_logo.jpeg" alt="Amazon Logo" width="400">
</p>


## EER Diagram

![EER Diagram](eer_diagram.png)

**Amazon E-Commerce Database Management System**

This project presents a structured and normalized database design for an Amazon-inspired e-commerce platform. It demonstrates the practical application of core DBMS concepts such as entity-relationship modeling, normalization to 3NF, and enforcement of relational integrity through primary and foreign keys.

**Objectives of the Project**

1. To model a complex, real-world retail environment using a relational database.

2. To reduce data redundancy through strict normalization.

3. To ensure transactional integrity using primary keys, foreign keys, and unique constraints.

4. To support efficient storage and retrieval for high-volume order processing.

5. To demonstrate forward engineering and schema design using MySQL Workbench.

**Key Features**

1. Centralized Customer Management: Unified profiles for users with secure credential handling.

2. Dynamic Order Tracking: Full lifecycle management from order placement to shipping status.

3. Inventory & Warehouse Control: Multi-location stock tracking for a diverse product catalog.

4. Categorized Product Catalog: Simplified product discovery through hierarchical categorization.

5. Review & Feedback Loop: Integrated system for customer-driven product ratings.

**Major Entities**

1. Customer: Stores personal profiles and authentication details (e.g., email, hashed passwords).

2. SalesOrder: Records individual transactions, order timestamps, and total amounts.

3. Address: Manages multiple shipping and billing locations for customers.

4. Product: Maintains the global catalog of items, pricing, and descriptions.

5. Inventory: Tracks the physical stock quantities mapped across different warehouses.

6. OrderItem: Acts as a bridge table to link specific products and quantities to a single order.

![Amazon Inventory Warehouse](inventory_image.jpeg)

**Relationship Handling & Integrity**

1. One-to-Many Relationships: A single customer can have multiple addresses and place multiple orders.

2. Many-to-Many Bridge: The inventory table manages the complex relationship between products and various warehouse locations.

3. Normalization: High-level entities like Category and Address are separated to maintain 3NF and prevent update anomalies.

4. Referential Integrity: Enforced through ON DELETE RESTRICT to protect historical order data and ON UPDATE CASCADE for synchronized IDs.

5. Optimized Data Types: Use of BIGINT for high-volume order IDs, DECIMAL(10,2) for financial precision, and TINYINT for statuses and ratings to optimize storage.

**Tools and Technologies Used**

1. MySQL Workbench 8.0: Used for EER modeling and forward engineering the schema.

2. MySQL Server 8.0: The target relational database engine for data storage and querying.

3. SQL DDL/DML: Implementation of structured queries for table creation and sample data insertion.

BY GROUP 18(SECTION A) : AYUSHIE GUPTA (341005), PURVA TYAGI (341041), RADHIKA KHATTAR (341043)

SUBMITTED TO: Mr. ASHOK HARNAL
