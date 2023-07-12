USE `mag-db`;

DROP PROCEDURE IF EXISTS format_date;
DELIMITER //
CREATE PROCEDURE format_date
(
	IN num INT,
    OUT format_date_text VARCHAR(100)
)

BEGIN
	DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    DECLARE seconds INT DEFAULT 0;
    SET format_date_text = "";     
    If num > 0 THEN
		SET days = FLOOR(num / (24 * 60 * 60));
        SET num = num - days * 24 * 60 * 60;
	END IF;
    If num > 0 THEN
		SET hours = FLOOR(num / (60 * 60));
        SET num = num - hours * 60 * 60;
    END IF;    
    If num > 0 THEN
		SET minutes = FLOOR(num / 60);
        SET num = num - minutes * 60;
	END IF;
	If num > 0 THEN 
		SET seconds = num;
	END IF;
    IF days > 0 THEN
		SET format_date_text = concat(format_date_text, concat(days, " days"), " ");
	END IF;
    IF hours > 0 THEN
		SET format_date_text = concat(format_date_text, concat(hours, " hours"), " ");
	END IF;
    IF minutes > 0 THEN
		SET format_date_text = concat(format_date_text, concat(minutes, " minutes"), " ");
	END IF;
    IF seconds > 0 THEN
		SET format_date_text = concat(format_date_text, concat(seconds, " seconds"), " ");
	END IF;
END//

CALL format_date(124856, @res);
SELECT @res;


DROP FUNCTION IF EXISTS get_nums;
DELIMITER //

CREATE FUNCTION get_nums()
RETURNS VARCHAR(50) DETERMINISTIC 

BEGIN
	DECLARE result VARCHAR(50) DEFAULT "";
	DECLARE start_value INT DEFAULT 2;
	DECLARE stop_value INT DEFAULT 10;
    DECLARE n INT DEFAULT 0;
	SET n = IF(start_value % 2 = 0, start_value, start_value + 1);
	IF n <= stop_value THEN 
		REPEAT
			IF LENGTH(result) > 0 THEN
				SET result = CONCAT(result, ",");
            END IF;
			SET result = CONCAT(result, n);
			SET n = n + 2;
			UNTIL n > stop_value
		END REPEAT;
	END IF;
	RETURN result;
END//

SELECT get_nums();