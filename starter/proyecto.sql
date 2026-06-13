
PRAGMA foreign_keys = ON;

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


INSERT INTO owners (owner_id, first_name, last_name, phone, email)
VALUES
(1, 'Carlos', 'Ramirez', '3001111111', '[carlos@email.com](mailto:carlos@email.com)'),
(2, 'Laura', 'Gomez', NULL, '[laura@email.com](mailto:laura@email.com)'),
(3, 'Miguel', 'Torres', '3003333333', '[miguel@email.com](mailto:miguel@email.com)');

INSERT INTO units (unit_id, unit_number, tower, owner_id, status)
VALUES
(1, '101', 'A', 1, 'Occupied'),
(2, '102', 'A', 2, 'Occupied'),
(3, '103', 'A', 3, 'Available'),
(4, '104', 'A', 1, 'Maintenance'),
(5, '105', 'A', 2, 'Available'),
(6, '106', 'A', 3, 'Occupied');


SELECT
owner_id,
first_name,
last_name
FROM owners
WHERE phone IS NULL;



SELECT
first_name,
last_name,
COALESCE(phone, 'Sin teléfono registrado') AS phone_display
FROM owners;
