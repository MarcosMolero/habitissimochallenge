DROP TABLE IF EXISTS BUDGETS;


CREATE TABLE BUDGETS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    actual_date INTEGER DEFAULT 0,
    name varchar(50) DEFAULT NULL,
    email varchar(50) DEFAULT NULL,
    phone varchar(50) DEFAULT NULL,
    subcategory varchar(200) DEFAULT NULL,
    description varchar(200) DEFAULT NULL,
    location varchar(100) DEFAULT NULL
);