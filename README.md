# SQL Project & Reference Guide
### Covering Specific pattern useful for Data Analyst from HackerRank and LeetCode and DataLemur 
### Here are basic yet imp concepts must know for every SQL Aspirant.

##  Database Schema

### 1. Users Table
```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

### 2. Orders Table
```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    total_amount NUMERIC(10, 2) NOT NULL CHECK (total_amount >= 0),
    status VARCHAR(20) DEFAULT 'pending',
    order_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
```

---

##  Essential Queries (Cheat Sheet)

### Insert Data (CRUD - Create)
```sql
INSERT INTO users (username, email)
VALUES 
    ('alice', 'alice@example.com'),
    ('bob', 'bob@example.com');

INSERT INTO orders (user_id, total_amount, status)
VALUES 
    (1, 149.99, 'completed'),
    (1, 49.50, 'completed'),
    (2, 89.00, 'pending');
```

### Query with Joins & Aggregations (CRUD - Read)
```sql
-- Total spending per user for completed orders
SELECT 
    u.id AS user_id,
    u.username,
    COUNT(o.id) AS total_orders,
    COALESCE(SUM(o.total_amount), 0.00) AS total_spent
FROM users u
LEFT JOIN orders o 
    ON u.id = o.user_id 
    AND o.status = 'completed'
GROUP BY u.id, u.username
ORDER BY total_spent DESC;
```

### Update & Delete (CRUD - Update / Delete)
```sql
-- Update order status
UPDATE orders
SET status = 'completed'
WHERE id = 3;

-- Safe delete
DELETE FROM orders
WHERE status = 'cancelled' 
  AND order_date < NOW() - INTERVAL '30 days';
```

---

##  Best Practices

- **Indexes**: Add indexes on foreign keys and frequently filtered columns (`WHERE`, `JOIN`, `ORDER BY`).
- **Parameterized Queries**: Always use parameterized queries in application code to prevent SQL injection.
- **Transactions**: Wrap multiple related mutations in a transaction:
  ```sql
  BEGIN;
  -- Operations here
  COMMIT;
  ```

