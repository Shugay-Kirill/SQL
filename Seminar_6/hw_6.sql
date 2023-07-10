CREATE database hw6;
use hw6;
# 1.Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

delimiter //
CREATE FUNCTION exercise_1(time int)
RETURNS VARCHAR(10000)  
DETERMINISTIC
begin
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    DECLARE result VARCHAR(10000) DEFAULT " ";
	set days = floor(time/24/60/60);
    set time = time-days*24*60*60; 
    set hours = floor(time/60/60);
    set time = time-hours*60*60; 
    set minutes = floor(time/60);
    set time = time-minutes*60; 
    set seconds = floor(time);
    set result = CONCAT(days, " days " , hours, " hours ", minutes, " minutes ", seconds, " seconds ");
	return result;
end //
delimiter ;
select exercise_1(123456);

# 2.Создайте процедуру которая, выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10
delimiter $$
create PROCEDURE exercise_2()
begin
    DECLARE number INT DEFAULT 10;
    DECLARE count  INT DEFAULT 0;
    DECLARE result VARCHAR(10000) DEFAULT "";
    WHILE count  < number DO
		set count  = count  + 2;
		set result = concat(result, count, ", " );
	END WHILE;
    SELECT result;
END $$
delimiter ;
call exercise_2();

