
DROP TABLE IF EXISTS fees;
DROP TABLE IF EXISTS units;
DROP TABLE IF EXISTS owners;


CREATE TABLE IF NOT EXISTS units (
    id        INTEGER PRIMARY KEY,
    number    TEXT NOT NULL UNIQUE, 
    floor     INTEGER NOT NULL CHECK (floor > 0),
    area      REAL CHECK (area > 0),
    is_active INTEGER NOT NULL DEFAULT 1
);



CREATE TABLE IF NOT EXISTS owners (
    id      INTEGER PRIMARY KEY,
    name    TEXT NOT NULL,
    email   TEXT UNIQUE,
    phone   TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS fees (
    id        INTEGER PRIMARY KEY,
    unit_id   INTEGER NOT NULL,
    amount    REAL NOT NULL CHECK (amount > 0),
    status    TEXT NOT NULL CHECK (status IN ('pagado','pendiente')),
    due_date  TEXT,
    FOREIGN KEY (unit_id) REFERENCES units(id)
);



INSERT INTO units (id, number, floor, area) VALUES
(1,'101',1,60),(2,'102',1,58),(3,'103',1,62),
(4,'201',2,70),(5,'202',2,75),(6,'203',2,72),
(7,'301',3,80),(8,'302',3,85),(9,'303',3,90),
(10,'401',4,95),(11,'402',4,100),(12,'403',4,105),
(13,'501',5,110),(14,'502',5,115),(15,'503',5,120);


INSERT INTO owners (id, name, email, phone) VALUES
(1,'Carlos Perez','carlos@gmail.com','3001111111'),
(2,'Ana Gomez','ana@gmail.com','3002222222'),
(3,'Luis Torres','luis@gmail.com','3003333333'),
(4,'Maria Rojas','maria@gmail.com','3004444444'),
(5,'Jorge Diaz','jorge@gmail.com','3005555555');


INSERT INTO fees (id, unit_id, amount, status, due_date) VALUES
(1,1,200000,'pendiente','2026-05-01'),
(2,2,200000,'pagado','2026-05-01'),
(3,3,220000,'pendiente','2026-05-01'),
(4,4,250000,'pagado','2026-05-01'),
(5,5,260000,'pendiente','2026-05-01');




.tables
PRAGMA table_info(units);
PRAGMA table_info(owners);
PRAGMA table_info(fees);