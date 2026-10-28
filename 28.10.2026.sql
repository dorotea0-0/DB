USE `client_db`;

-- ЗАДАНИЕ 1: Обновление дат рождения конкретных клиентов

-- Предварительный поиск
SELECT id, name, lastname, dbirth 
FROM clients 
WHERE (name = 'Gary' AND lastname = 'Harrison')
   OR (name = 'Michael' AND lastname = 'Atwood')
   OR (name = 'Amy' AND lastname = 'Majors')
   OR (name = 'Katherine' AND lastname = 'Smith');

-- Обновление дат рождения
UPDATE clients SET dbirth = '1930-10-21' WHERE name = 'Gary' AND lastname = 'Harrison' LIMIT 1;
UPDATE clients SET dbirth = '1934-04-12' WHERE name = 'Michael' AND lastname = 'Atwood' LIMIT 1;
UPDATE clients SET dbirth = '1975-08-01' WHERE name = 'Amy' AND lastname = 'Majors' LIMIT 1;
UPDATE clients SET dbirth = '1959-09-22' WHERE name = 'Katherine' AND lastname = 'Smith' LIMIT 1;

-- ЗАДАНИЕ 2: Удаление номеров телефонов у клиентов, родившихся ранее 1933 года

-- Предварительный поиск 
SELECT id, name, lastname, dbirth, phone 
FROM clients 
WHERE YEAR(dbirth) < 1933;

-- Обновление
UPDATE clients 
SET phone = NULL 
WHERE YEAR(dbirth) < 1933 
LIMIT 47;

-- ЗАДАНИЕ 3: Исправление данных John Ohara - Johanna Ohara

-- Предварительный поиск 
SELECT id, name, lastname, gender 
FROM clients 
WHERE name = 'John' AND lastname = 'Ohara';

-- Обновление
UPDATE clients 
SET name = 'Johanna', gender = 'F' 
WHERE name = 'John' AND lastname = 'Ohara' 
LIMIT 1;

-- ЗАДАНИЕ 4: Замена телефонов у трёх клиентов

-- Предварительный поиск
SELECT id, name, lastname, phone 
FROM clients 
WHERE (name = 'Humberto' AND lastname = 'Hoosier')
   OR (name = 'Irene' AND lastname = 'Schreiber')
   OR (name = 'Donna' AND lastname = 'Wallace');

-- Обновление телефонов
UPDATE clients SET phone = '5551234' WHERE name = 'Humberto' AND lastname = 'Hoosier' LIMIT 1;
UPDATE clients SET phone = '5559876' WHERE name = 'Irene' AND lastname = 'Schreiber' LIMIT 1;
UPDATE clients SET phone = '5554321' WHERE name = 'Donna' AND lastname = 'Wallace' LIMIT 1;

-- ЗАДАНИЕ 5: Удаление клиентов по ID

-- Предварительный поиск
SELECT id, name, lastname 
FROM clients 
WHERE id IN (215, 340, 449, 470, 607);

-- Удаление
DELETE FROM clients 
WHERE id IN (215, 340, 449, 470, 607) 
LIMIT 4;

-- ЗАДАНИЕ 6: Удаление клиентов мужского пола по датам рождения

-- Предварительный поиск
SELECT id, name, lastname, dbirth, gender 
FROM clients 
WHERE gender = 'M' 
  AND ((dbirth BETWEEN '1941-01-01' AND '1941-04-30') 
       OR (dbirth BETWEEN '1972-09-10' AND '1972-09-15'));

-- Удаление
DELETE FROM clients 
WHERE gender = 'M' 
  AND ((dbirth BETWEEN '1941-01-01' AND '1941-04-30') 
       OR (dbirth BETWEEN '1972-09-10' AND '1972-09-15')) 
LIMIT 7;

-- ЗАДАНИЕ 7: Дополнительные запросы на обновление

-- 7.1. Обновление фамилии для клиентов с именем "Tom"
-- Предварительный поиск 
SELECT id, name, lastname FROM clients WHERE name = 'Tom';

UPDATE clients 
SET lastname = 'Brown-Smith' 
WHERE name = 'Tom' 
LIMIT 3;

-- 7.2. Установка NULL для телефонов клиентов с именем "Robert"
-- Предварительный поиск 
SELECT id, name, lastname, phone FROM clients WHERE name = 'Robert';

UPDATE clients 
SET phone = NULL 
WHERE name = 'Robert' 
LIMIT 6;

-- 7.3. Обновление пола для клиента с именем "Kalle"
-- Предварительный поиск 
SELECT id, name, lastname, gender FROM clients WHERE name = 'Kalle';

UPDATE clients 
SET gender = 'M' 
WHERE name = 'Kalle' 
LIMIT 1;

-- 7.4. Удаление клиентов с годом рождения 1999
-- Предварительный поиск
SELECT id, name, lastname, dbirth FROM clients WHERE YEAR(dbirth) = 1999;

DELETE FROM clients 
WHERE YEAR(dbirth) = 1999 
LIMIT 3;

-- 7.5. Обновление даты рождения для клиентов с фамилией "Miller"
-- Предварительный поиск
SELECT id, name, lastname, dbirth FROM clients WHERE lastname = 'Miller';

UPDATE clients 
SET dbirth = '1980-01-01' 
WHERE lastname = 'Miller' 
LIMIT 4;

SELECT COUNT(*) AS total_clients FROM clients;