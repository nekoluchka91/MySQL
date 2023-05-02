-- Домашнее задание к Семинару 6.

USE lesson_5;

/*Задача 1. 
Создайте функцию, которая принимает количество секунд и форматирует их в количество дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds' */
-- DROP PROCEDURE time;
/*DELIMITER //
CREATE PROCEDURE time(seconds INT)
BEGIN
DECLARE days INT default 0;
DECLARE hours INT default 0;
DECLARE minutes INT default 0;
    
    WHILE seconds >= 84600 DO -- в одном дне 84600 секунд
    SET days = seconds / 84600;
    SET seconds = seconds % 84600;
    END WHILE;

    WHILE seconds >= 3600 DO  -- в одном часе 3600 секунд
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO -- в одной минуте 60 секунд
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END //
DELIMITER ;

CALL time(123456);*/


/*Задача 2. Выведите только четные числа от 1 до 10 включительно.
Пример: 2,4,6,8,10. */
-- DROP PROCEDURE num;
DELIMITER //
CREATE PROCEDURE num()
BEGIN
    DECLARE number INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (number INT);

    WHILE number < 10 DO
    SET number = number + 2;
    INSERT INTO nums VALUES(number);
    END WHILE;

SELECT * FROM nums;
END //
DELIMITER ;

CALL num();