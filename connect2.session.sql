DROP TABLE workers;

CREATE TABLE workers(
  id serial PRIMARY KEY,
  "name" varchar(22) NOT NULL CHECK (name != ''),
  birthday date NOT NULL,
  salary int
);

-- Задачи на INSERT:

INSERT INTO workers (name, birthday, salary)
VALUES ('Олег', '1999-05-10', '300');

INSERT INTO workers (name, birthday, salary)
VALUES ('Ярослава', '1999-05-10', '1200');

INSERT INTO workers (name, birthday, salary)
VALUES ('Саша', '1985-05-10', '900'),
  ('Маша', '1995-05-10', '900');

-- Задачи на UPDATE:

UPDATE workers
SET salary = 500
WHERE name = 'Олег';

UPDATE workers
SET birthday = '1999-05-10'
WHERE id = '4';

UPDATE workers
SET salary = 700
WHERE salary > '500';

UPDATE workers
SET birthday = '1999-05-10'
WHERE (id  > '1' AND id < '6');

UPDATE workers
SET name = 'Женя', salary = 901
WHERE name = 'Саша';

-- Задачи на SELECT 

SELECT * 
FROM workers
WHERE id = 3;

SELECT * 
FROM workers
WHERE salary > '400';

SELECT (birthday, salary)
FROM workers
WHERE name = 'Женя';

SELECT * 
FROM workers
WHERE name = 'Петя';

SELECT * 
FROM workers
WHERE (extract('year' from age("birthday")) = 23) OR salary = 1000;

SELECT * 
FROM workers
WHERE extract('year' from age("birthday")) > 24 AND  extract('year' from age("birthday")) < 29;

SELECT * 
FROM workers
WHERE id = '1' OR id = '3' OR id = '5';

-- Задачи на DELETE

DELETE FROM workers
WHERE id = 4
RETURNING *;

DELETE FROM workers
WHERE name = 'Петя'
RETURNING *;

DELETE FROM workers
WHERE extract('year' from age("birthday")) > 30
RETURNING *;
