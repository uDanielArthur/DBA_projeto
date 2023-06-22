-- @udanielarthur
-- Procedures de UPDATE


-- Procedure UPDATE na Tabela Classificação
-- DROP PROCEDURE IF EXISTS sp_update_classificacao;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_classificacao(valor_id INT, idade_valor INT, descricao_texto VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_classificacao FROM tb_classificacao WHERE id_classificacao = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID inválido';
		ELSEIF
			(descricao_texto IS NULL ) OR (fn_valida_texto(descricao_texto, 50)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descrição inválida';
		ELSE
			UPDATE tb_classificacao SET idade = idade_valor, descricao = LOWER(descricao_texto)
			WHERE id_classificacao = valor_id;
		END IF;
    END //
DELIMITER ;
-- SELECT * FROM tb_classificacao;
-- CALL sp_update_classificacao(1, 'livre','O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.'); 


-- Procedure UPDATE na Tabela Categoria
-- DROP PROCEDURE sp_update_categoria;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_categoria(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_categoria SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_categoria = valor_id;
		END IF;
    END //
DELIMITER ;
-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;
-- CALL sp_update_categoria(4, 'suspense' );


-- Procedure UPDATE na Tabela Idioma
-- DROP PROCEDURE sp_update_idioma;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_idioma(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_idioma SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_idioma = valor_id;
		END IF;
    END //
DELIMITER ;
-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;
-- CALL sp_update_idioma(1, 'po');


-- Procedure UPDATE na tabela tipo_pagamento
-- DROP PROCEDURE sp_update_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_tipo_pagamento(valor_id INT, nome_valor VARCHAR(30))
	BEGIN
		IF NOT EXISTS
			(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_tipo_pagamento SET categoria = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_tipo_pagamento = valor_id;
		END IF;
    END //
DELIMITER ;
-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;
-- CALL sp_update_tipo_pagamento(1,'cartão');

-- Procedure UPDATE na Tabela País
-- DROP PROCEDURE sp_update_pais;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_pais(valor_id INT, nome_pais VARCHAR(45), cod_pais CHAR(3))
	BEGIN
		IF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_pais IS NULL ) OR (fn_valida_texto(nome_pais, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_pais invalido';
		ELSEIF
			(nome_pais IS NULL ) OR (fn_valida_texto(cod_pais, 3) = 0) OR (LENGTH(cod_pais) > 3 ) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere (id_pais) invalida';
		ELSE
			UPDATE tb_pais SET nome = LOWER(nome_pais), codigo = cod_pais
			WHERE id_pais = valor_id;
		END IF;
    END //
DELIMITER ;
-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;
-- CALL sp_update_pais(1,'BRASÍL', 'BRA');



-- Procedure UPDATE na Tabela Plano
-- DROP PROCEDURE sp_update_plano;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_plano(valor_id INT, nome_plano VARCHAR(45), valor FLOAT, descricao_plano  VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_plano IS NULL ) OR (fn_valida_texto(nome_valor, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
        ELSEIF
			(valor IS NULL ) OR (valor NOT BETWEEN 20.00 AND 100.00) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 100 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_plano SET nome = LOWER(nome_plano), valor = preco, descricao = LOWER(descricao_plano) 
			WHERE id_plano = valor_id;
		END IF;
    END //
DELIMITER ;
-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;
-- CALL sp_update_plano(3 , 'premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');

-- Procedure UPDATE na tabela Ator
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_update_ator(valor_id INT, nome_ator VARCHAR(45), sobrenome_ator  VARCHAR(255), data_nascimento_ator VARCHAR(255), FOTO_ATOR VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_ator IS NULL ) OR (fn_valida_texto(nome_ator, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(sobrenome_ator IS NULL ) OR (fn_valida_texto(sobrenome_autor, 130 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_ator SET nome = LOWER(nome_ator), sobrenome = LOWER(sobrenome_ator) 
			WHERE id_plano = valor_id;
		END IF;
    END //
DELIMITER ;
