-- @udanielarthur
-- Procedures de INSERT

-- Procedure INSERT na tabela Classificação
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_classificacao(idade_valor INT, descricao_texto VARCHAR(255))
	BEGIN
    IF 
		(descricao_texto IS NULL ) OR (fn_valida_texto(descricao_texto, 50)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descrição inválida';
    ELSE
		INSERT INTO tb_classificacao
        (idade, descricao)
        VALUES
        (idade_valor,  LOWER(descricao_texto));
	END IF;
    END // 
DELIMITER ; 

CALL sp_insert_classificacao('10', 'Não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock''n''roll');
CALL sp_insert_classificacao('12', ' Não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes ');
CALL sp_insert_classificacao('14', ' contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas');
CALL sp_insert_classificacao('16', ' não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo');
CALL sp_insert_classificacao('18', 'não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas');
-- SELECT * FROM tb_classificacao;


-- Porcedure INSERT na Tabela Categoria
-- DROP PROCEDURE sp_insert_categoria
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_categoria(nome_categoria VARCHAR(45))
	BEGIN
    IF 
		(nome_categoria IS NULL ) OR (fn_valida_texto(descricao_TEXTO, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_categoria
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_categoria), CURDATE());
	END IF;
    END // 
DELIMITER ;
-- DESCRIBE tb_categoria;
-- CALL sp_insert_categoria('suspense');
-- CALL sp_insert_categoria('terror');
-- CALL sp_insert_categoria('drama');
-- SELECT * FROM tb_categoria;



-- Procedure INSERT na Tabela Idioma
-- DROP PROCEDURE sp_insert_idioma;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_idioma(nome_idioma VARCHAR(45))
	BEGIN
    IF 
		(nome_idioma IS NULL ) OR (fn_valida_texto(nome_idioma, 4)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_idioma
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_idioma), CURDATE());
	END IF;
    END // 
DELIMITER ;
-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;
-- CALL sp_insert_idioma('português');
-- CALL sp_insert_idioma('inglês');
-- CALL sp_insert_idioma('espanhol');
-- CALL sp_insert_idioma('coreano');



-- Procedure INSERT na Tabela tipo_pagamento
-- DROP PROCEDURE sp_insert_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_tipo_pagamento(nome_valor VARCHAR(30))
	BEGIN
    IF 
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 4)) < 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_tipo_pagamento
        (categoria, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), CURDATE());
	END IF;
    END // 
DELIMITER ;
-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;
-- CALL sp_insert_tipo_pagamento('cartão');
-- CALL sp_insert_tipo_pagamento('pix');
-- CALL sp_insert_tipo_pagamento('boleto');
-- CALL sp_insert_tipo_pagamento('deposito bancario');



-- Procedure INSERT na Tabela País
-- DROP PROCEDURE sp_insert_pais;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_pais(nome_pais VARCHAR(45), cod_pais CHAR(3))
	BEGIN
	IF
		(cod_pais IS NULL ) OR (fn_valida_texto(cod_pais, 3) = 0) OR (LENGTH(cod_pais) >3) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere invalida';
	ELSEIF
		(nome_pais IS NULL ) OR (fn_valida_texto(nome_pais, 4)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_pais
        (nome, codigo)
        VALUES
        (LOWER(nome_pais), LOWER(cod_pais));
	END IF;
    END // 
DELIMITER ;
-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;
-- CALL sp_insert_pais('brasil', 'bra');
-- CALL sp_insert_pais('estados unidos', 'eua');
-- CALL sp_insert_pais('espanha', 'esp');
-- CALL sp_insert_pais('coreia do sul', 'kor');



-- Procedure INSERT na Tabela Plano
-- DROP PROCEDURE sp_insert_plano;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_plano(nome_plano VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
	BEGIN
	IF
		(descricao_plano IS NULL ) OR (fn_valida_texto(nome_valor, 4 )) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		(valor_plano IS NULL ) OR (valor_plano NOT BETWEEN 20.00 AND 100.00) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
	ELSEIF
		(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 100)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
    ELSE
		INSERT INTO tb_plano
        (nome, valor, descricao)
        VALUES
        (LOWER(nome_plano), valor_plano, LOWER(descricao_plano));
	END IF;
    END // 
DELIMITER ;
-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;
-- CALL sp_insert_plano('basico', 25.90 ,'resolução (HD), livre de anúncios, proporciona acesso ao catálogo completo e permite que você faça downloads em dispositivos para assistir offline.');
-- CALL sp_insert_plano('padrão', 39.99 , 'duas telas simultâneas, (Full HD). Ideal para compartilhar o acesso com outra pessoa em uma mesma residência. Além disso, é livre de anúncios, permite fazer o download dos conteúdos para assistir offline');
-- CALL sp_insert_plano('premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');



-- Procedure INSERT na tabela Ator
-- DROP PROCEDURE sp_insert_ator;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS sp_insert_ator(nome_ator VARCHAR(45), sobrenome_ator VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
	BEGIN
	IF
		(nome_ator IS NULL ) OR (fn_valida_texto(nome_ator, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		(sobrenome_ator IS NULL ) OR (fn_valida_texto(sobrenome_ator, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
	ELSEIF
		(nascimento IS NULL) OR (nascimento = '0000-00-00') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
    ELSEIF
		(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 10)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
	ELSE
		INSERT INTO tb_ator
        (nome, sobrenome, dt_nascimento, foto)
        VALUES
        (LOWER(nome_ator), LOWER(sobrenome_ator), nascimento, foto_ator);
	END IF;
    END // 
DELIMITER ; 
-- DESCRIBE tb_ator;
-- SELECT * FROM tb_ator;
-- CALL sp_insert_ator('george','clooney', '1961-05-06', 'https');
