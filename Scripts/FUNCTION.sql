-- @udanielarthur
-- Functions

-- Function para validação de texto
DELIMITER //
CREATE FUNCTION IF NOT EXISTS fn_valida_texto( texto VARCHAR(255), parametro INT)
RETURNS BOOLEAN
READS SQL DATA 
BEGIN
    DECLARE valor BOOLEAN;
		IF 
			(LENGTH(TRIM(texto))) < parametro THEN
            SET valor = 0;
            RETURN valor;
		ELSE
			SET valor = 1;
			RETURN valor;
		END IF;
END //
DELIMITER ;

-- Function para deixar letras minusculas
DELIMITER //
CREATE FUNCTION IF NOT EXISTS fn_minuscula(texto VARCHAR(255))
RETURNS VARCHAR (255)
DETERMINISTIC 
BEGIN
DECLARE resultado VARCHAR (255);
SET resultado = lower (texto);
RETURN resultado ;
END//
DELIMITER ;