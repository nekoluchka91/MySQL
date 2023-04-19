-- Домашнее задание к Семинару 3
DROP DATABASE IF EXISTS lesson3; 
CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT
);

INSERT `staff` (`firstname`, `lastname`, `post`, `seniority`, `salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

DROP TABLE IF EXISTS `activity_staff`;
CREATE TABLE IF NOT EXISTS `activity_staff`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY(staff_id) REFERENCES staff(id),
-- ВНЕШНИЙ КЛЮЧ(тот столбец, который будет отвечать за внешний ключ нашей таблицы, т.е. указываем данный столбец)ОТКУДА_БУДЕТ_БРАТЬСЯ название нашей первой таблицы(название столбца, который будет изыматься)
 `date_activity` DATE, -- обычный столбик, который отвечает за дату 
 `count_page` INT -- количество страниц, которое заполнил наш работник
 );
 
INSERT `activity_staff` (`staff_id`, `date_activity`, `count_page`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);

SELECT *
FROM staff;

SELECT *
FROM activity_staff;

-- Задание 1. Выведите id сотрудников, которые напечатали более 500 страниц за все дни.
SELECT staff_id, SUM(count_page) AS 'Кол-во страниц по каждому сотруднику'
FROM activity_staff
GROUP BY staff_id
HAVING SUM(count_page) > 500;

-- Задание 2. Выведите дни, когда работало более 3 сотрудников. 
-- Также укажите кол-во сотрудников, которые работали в выбранные дни.
SELECT COUNT(staff_id) AS 'Кол-во сотрудников на работе', date_activity
FROM activity_staff
GROUP BY date_activity 
HAVING COUNT(staff_id) > 3; 

-- Задание 3. Выведите среднюю заработную плату по должностям, которая составляет более 30000.
SELECT post, AVG(salary) AS 'Средняя з/п по должностям'
FROM staff
GROUP BY post
HAVING AVG(salary) > 30000; 

-- Задание 4. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания.
SELECT *
FROM staff
ORDER BY salary DESC; -- в порядке убывания

SELECT *
FROM staff
ORDER BY salary ASC; -- в порядке возрастания

-- Задание 5. Выведите 5 максимальных заработных плат (salary).
SELECT id, firstname, salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- Задание 6. Посчитайте суммарную зарплату (salary) по каждой специальности (роst).
SELECT post, SUM(salary) AS 'Суммарная з/п по должностям'
FROM staff
GROUP BY post;

-- Задание 7. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(post) AS 'Количество сотрудников - Рабочих'
FROM staff
WHERE age between 24 AND 49
GROUP BY post 
HAVING post = 'Рабочий';

-- Задание 8. Найдите количество специальностей
SELECT COUNT(DISTINCT post) AS 'Количество специальностей'
FROM staff;

-- Задание 9. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.
SELECT post, AVG(age)
FROM staff
GROUP BY age
HAVING AVG(age) < 30;

SELECT id, post FROM staff;