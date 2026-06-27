-- Tabla de unidades
CREATE TABLE units (
    id          INTEGER PRIMARY KEY,
    number      TEXT    NOT NULL,
    floor       INTEGER NOT NULL,
    area        REAL,
    is_active   INTEGER DEFAULT 1
);


-- Tabla de propietarios
CREATE TABLE owners (
    id          INTEGER PRIMARY KEY,
    first_name  TEXT    NOT NULL,
    last_name   TEXT    NOT NULL,
    email       TEXT,
    phone       TEXT
);


-- Tabla de tarifas relacionadas con las unidades
CREATE TABLE fees (
    id          INTEGER PRIMARY KEY,
    unit_id     INTEGER,
    amount      REAL NOT NULL,
    due_date    TEXT,
    status      TEXT,
    FOREIGN KEY (unit_id) REFERENCES units(id)
);



INSERT INTO units (id, number, floor, area) VALUES
(1, '101', 1, 60.5),
(2, '102', 1, 58.0),
(3, '201', 2, 75.2),
(4, '202', 2, 80.0),
(5, '301', 3, 90.3);



INSERT INTO owners (id, first_name, last_name, email, phone) VALUES
(1, 'Carlos', 'Perez', 'carlos@gmail.com', '3001234567'),
(2, 'Ana', 'Gomez', 'ana@gmail.com', '3007654321'),
(3, 'Luis', 'Torres', 'luis@gmail.com', '3011111111'),
(4, 'Maria', 'Rojas', 'maria@gmail.com', '3022222222'),
(5, 'Jorge', 'Diaz', 'jorge@gmail.com', '3033333333');



INSERT INTO fees (id, unit_id, amount, due_date, status) VALUES
(1, 1, 200000, '2026-04-30', 'Pending'),
(2, 2, 200000, '2026-04-30', 'Paid'),
(3, 3, 250000, '2026-04-30', 'Pending'),
(4, 4, 250000, '2026-04-30', 'Paid'),
(5, 5, 300000, '2026-04-30', 'Pending');

SELECT id, number, floor, area FROM units;

SELECT name FROM owners ORDER BY name;

SELECT id, unit_id, amount, due_date, status FROM fees WHERE status = 'pendiente';