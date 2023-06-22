-- @udanielarthur
-- Procedures de UPDATE


-- Procedure DELETE na Tabela Classificação
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_delete_classificacao (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao FROM tb_classificacao WHERE id_classificacao = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao
		WHERE id_classificacao = valor_id;
	END IF;
END //
DELIMITER ;
-- DESCRIBE tb_classificacao;
-- SELECT * FROM tb_classificacao;
-- CALL sp_delete_classificacao(9);



-- Procedure DELETE na Tabela Categoria
-- DROP PROCEDURE sp_delete_categoria;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_delete_categoria (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END //
DELIMITER ;
-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;
-- CALL sp_delete_categoria(6);


-- Procedure DELETE tb_idioma
-- DROP PROCEDURE sp_delete_idioma;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_delete_idioma (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END //
DELIMITER ;
-- SELECT * FROM tb_idioma;
-- CALL sp_delete_idioma(5);


-- Procedure DELETE na tabela tipo_pagamento
-- DROP PROCEDURE sp_delete_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_delete_tipo_pagamento(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END //
DELIMITER ;



-- Procedure DELETE na tabela País
-- DROP PROCEDURE sp_delete_pais;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_delete_pais(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END //
DELIMITER ;


-- Procedure DELETE na Tabela Plano
-- DROP PROCEDURE sp_delete_plano;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_delete_plano(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END //
DELIMITER ;

-- Procedure DELETE na tabela Ator
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS  sp_delete_ator(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END //
DELIMITER ;
