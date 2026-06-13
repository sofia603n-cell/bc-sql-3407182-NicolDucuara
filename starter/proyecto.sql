
-- ============================================
-- PROYECTO SEMANAL: NULL y Constraints
-- Semana 07
-- Dominio: Administración de Propiedad Horizontal
-- ============================================

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS fees;
DROP TABLE IF EXISTS units;
DROP TABLE IF EXISTS owners;


CREATE TABLE owners (
owner_id INTEGER PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
phone TEXT,
email TEXT NOT NULL UNIQUE
);


CREATE TABLE units (
unit_id INTEGER PRIMARY KEY,
unit_number TEXT NOT NULL UNIQUE,
tower TEXT NOT NULL,
owner_id INTEGER NOT NULL,
status TEXT NOT NULL DEFAULT 'Available'
CHECK(status IN ('Occupied', 'Available', 'Maintenance')),
FOREIGN KEY (owner_id)
REFERENCES owners(owner_id)
ON DELETE RESTRICT
);



CREATE TABLE fees (
fee_id INTEGER PRIMARY KEY,
unit_id INTEGER NOT NULL,
amount REAL NOT NULL CHECK(amount > 0),
payment_date TEXT,
status TEXT NOT NULL DEFAULT 'Pending'
CHECK(status IN ('Paid', 'Pending')),
FOREIGN KEY (unit_id)
REFERENCES units(unit_id)
);


CREATE TABLE maintenance (
maintenance_id INTEGER PRIMARY KEY,
unit_id INTEGER NOT NULL,
description TEXT,
maintenance_date TEXT,
cost REAL CHECK(cost >= 0),
FOREIGN KEY (unit_id)
REFERENCES units(unit_id)
);



INSERT INTO owners (owner_id, first_name, last_name, phone, email)
VALUES
(1, 'Carlos', 'Ramirez', '3001111111', '[carlos@email.com](mailto:carlos@email.com)'),
(2, 'Laura', 'Gomez', NULL, '[laura@email.com](mailto:laura@email.com)'),
(3, 'Miguel', 'Torres', '3003333333', '[miguel@email.com](mailto:miguel@email.com)'),
(4, 'Andrea', 'Ruiz', NULL, '[andrea@email.com](mailto:andrea@email.com)'),
(5, 'Sofia', 'Perez', '3005555555', '[sofia@email.com](mailto:sofia@email.com)'),
(6, 'Daniel', 'Castro', NULL, '[daniel@email.com](mailto:daniel@email.com)'),
(7, 'Camila', 'Herrera', '3007777777', '[camila@email.com](mailto:camila@email.com)'),
(8, 'Julian', 'Martinez', '3008888888', '[julian@email.com](mailto:julian@email.com)'),
(9, 'Paula', 'Rojas', '3009999999', '[paula@email.com](mailto:paula@email.com)'),
(10, 'Nicolas', 'Dias', '3011111111', '[nicolas@email.com](mailto:nicolas@email.com)'),
(11, 'Valentina', 'Mora', '3012222222', '[valentina@email.com](mailto:valentina@email.com)'),
(12, 'Samuel', 'Vargas', '3013333333', '[samuel@email.com](mailto:samuel@email.com)'),
(13, 'Fernando', 'Leon', '3014444444', '[fernando@email.com](mailto:fernando@email.com)'),
(14, 'Juan', 'Silva', '3015555555', '[juan@email.com](mailto:juan@email.com)'),
(15, 'Isabella', 'Medina', '3016666666', '[isabella@email.com](mailto:isabella@email.com)');

INSERT INTO units (unit_id, unit_number, tower, owner_id, status)
VALUES
(1, '101', 'A', 1, 'Occupied'),
(2, '102', 'A', 2, 'Occupied'),
(3, '103', 'A', 3, 'Occupied'),
(4, '104', 'A', 4, 'Occupied'),
(5, '105', 'A', 5, 'Available'),
(6, '201', 'B', 6, 'Occupied'),
(7, '202', 'B', 7, 'Occupied'),
(8, '203', 'B', 8, 'Maintenance'),
(9, '204', 'B', 9, 'Occupied'),
(10, '205', 'B', 10, 'Available'),
(11, '301', 'C', 11, 'Occupied'),
(12, '302', 'C', 12, 'Occupied'),
(13, '303', 'C', 13, 'Maintenance'),
(14, '304', 'C', 14, 'Occupied'),
(15, '305', 'C', 15, 'Available');

INSERT INTO fees (fee_id, unit_id, amount, payment_date, status)
VALUES
(1, 1, 250000, '2026-05-01', 'Paid'),
(2, 2, 250000, '2026-05-02', 'Paid'),
(3, 3, 250000, '2026-05-03', 'Pending'),
(4, 4, 250000, '2026-05-04', 'Paid'),
(5, 5, 250000, '2026-05-05', 'Pending');

INSERT INTO maintenance (maintenance_id, unit_id, description, maintenance_date, cost)
VALUES
(1, 8, 'Water pipe repair', '2026-05-01', 500000),
(2, 13, 'Electrical maintenance', '2026-05-02', 300000),
(3, 5, 'Painting walls', '2026-05-03', 200000),
(4, 10, 'Door replacement', '2026-05-04', 450000),
(5, 15, 'Air conditioning repair', '2026-05-05', 600000);




------------------------------------------------------------------------------
SELECT
owner_id,
first_name,
last_name
FROM owners
WHERE phone IS NULL;



SELECT
first_name,
last_name,
COALESCE(phone, 'Sin telefono registrado') AS phone_display
FROM owners;
