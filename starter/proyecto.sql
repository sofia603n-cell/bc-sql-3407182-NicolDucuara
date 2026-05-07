
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS fees;
DROP TABLE IF EXISTS units;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
    owner_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    phone TEXT,
    email TEXT
);

CREATE TABLE units (
    unit_id INTEGER PRIMARY KEY,
    unit_number TEXT NOT NULL,
    tower TEXT NOT NULL,
    owner_id INTEGER,
    status TEXT,
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

CREATE TABLE fees (
    fee_id INTEGER PRIMARY KEY,
    unit_id INTEGER,
    amount REAL,
    payment_date TEXT,
    status TEXT,
    FOREIGN KEY (unit_id) REFERENCES units(unit_id)
);

CREATE TABLE maintenance (
    maintenance_id INTEGER PRIMARY KEY,
    unit_id INTEGER,
    description TEXT,
    maintenance_date TEXT,
    cost REAL,
    FOREIGN KEY (unit_id) REFERENCES units(unit_id)
);




INSERT INTO owners (owner_id, full_name, phone, email)
VALUES
(1, 'Carlos Ramirez', '3001111111', 'carlos@email.com'),
(2, 'Laura Gomez', '3002222222', 'laura@email.com'),
(3, 'Miguel Torres', '3003333333', 'miguel@email.com'),
(4, 'Andrea Ruiz', '3004444444', 'andrea@email.com'),
(5, 'Sofia Perez', '3005555555', 'sofia@email.com');

INSERT INTO units (unit_id, unit_number, tower, owner_id, status)
VALUES
(1, '101', 'A', 1, 'Occupied'),
(2, '102', 'A', 2, 'Occupied'),
(3, '103', 'B', 3, 'Available'),
(4, '104', 'B', 4, 'Maintenance'),
(5, '105', 'C', 5, 'Occupied');

INSERT INTO fees (fee_id, unit_id, amount, payment_date, status)
VALUES
(1, 1, 250000, '2026-05-01', 'Paid'),
(2, 2, 250000, '2026-05-02', 'Pending'),
(3, 3, 300000, '2026-05-03', 'Paid');

INSERT INTO maintenance (maintenance_id, unit_id, description, maintenance_date, cost)
VALUES
(1, 4, 'Electrical repair', '2026-05-01', 500000),
(2, 3, 'Painting service', '2026-05-02', 200000);



SELECT
    owner_id AS "ID Propietario",
    full_name AS "Nombre Completo",
    phone AS "Teléfono",
    email AS "Correo Electrónico"
FROM owners;




SELECT
    unit_id AS "ID Unidad",
    unit_number AS "Número",
    tower AS "Torre",
    status AS "Estado"
FROM units
WHERE status = 'Occupied';




SELECT
    fee_id AS "ID Cuota",
    amount AS "Valor",
    status AS "Estado"
FROM fees
WHERE status = 'Paid'
AND amount >= 250000;



SELECT
    maintenance_id AS "ID",
    description AS "Descripción",
    cost AS "Costo"
FROM maintenance
ORDER BY cost DESC
LIMIT 5;



SELECT
    owner_id AS "ID",
    full_name AS "Propietario"
FROM owners
ORDER BY full_name ASC
LIMIT 3 OFFSET 0;

SELECT
    owner_id AS "ID",
    full_name AS "Propietario"
FROM owners
ORDER BY full_name ASC
LIMIT 3 OFFSET 3;