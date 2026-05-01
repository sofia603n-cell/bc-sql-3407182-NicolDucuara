--  Tabla de unidades
CREATE TABLE units (
    id          INTEGER PRIMARY KEY,
    number      TEXT    NOT NULL,   
    floor       INTEGER NOT NULL,   
    area        REAL,               
    is_active   INTEGER DEFAULT 1
);


-- tabla de propietarios
CREATE TABLE owners (
    id          INTEGER PRIMARY KEY,
    name        TEXT    NOT NULL,
    email       TEXT,
    phone       TEXT
);


-- tabla de las tarifas con relacion a las unidades
CREATE TABLE fees (
    id          INTEGER PRIMARY KEY,
    unit_id     INTEGER,
    amount      REAL NOT NULL,
    due_date    TEXT,
    status      TEXT, -- pagado / pendiente
    FOREIGN KEY (unit_id) REFERENCES units(id)
);


INSERT INTO units (id, number, floor, area) VALUES
(1, '101', 1, 60.5),
(2, '102', 1, 58.0),
(3, '201', 2, 75.2),
(4, '202', 2, 80.0),
(5, '301', 3, 90.3);

INSERT INTO owners (id, name, email, phone) VALUES
(1, 'Carlos Perez', 'carlos@gmail.com', '3001234567'),
(2, 'Ana Gomez', 'ana@gmail.com', '3007654321'),
(3, 'Luis Torres', 'luis@gmail.com', '3011111111'),
(4, 'Maria Rojas', 'maria@gmail.com', '3022222222'),
(5, 'Jorge Diaz', 'jorge@gmail.com', '3033333333');

INSERT INTO fees (id, unit_id, amount, due_date, status) VALUES
(1, 1, 200000, '2026-04-30', 'pendiente'),
(2, 2, 200000, '2026-04-30', 'pagado'),
(3, 3, 250000, '2026-04-30', 'pendiente'),
(4, 4, 250000, '2026-04-30', 'pagado'),
(5, 5, 300000, '2026-04-30', 'pendiente');

SELECT * FROM units;

SELECT name FROM owners ORDER BY name;

SELECT * FROM fees WHERE status = 'pendiente';