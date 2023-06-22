-- @udanielarthur
-- VIEWS

-- View do Usuário
CREATE VIEW vw_usuario AS
SELECT
    u.id_usuario,
    u.nome,
    u.data_atualizacao,
    u.sobrenome,
    u.email,
    u.status,
    u.data_nascimento,
    u.data_cadastro,
    CONCAT(e.rua,', ',e.bairro, ', ',e.quadra,', ',e.numero) AS endereco,
    e.cep,
	p.nome as nome_pais,
    pl.descricao,
    CASE
        WHEN f.id_funcionario IS NOT NULL THEN 'Funcionário'
        WHEN c.id_cliente IS NOT NULL THEN 'Cliente'
		ELSE 'N/A'
    END AS tipo_usuario,
    (SELECT COUNT(*) FROM tb_perfil WHERE id_cliente = c.id_cliente) AS qtd_perfis    
FROM
    tb_usuario as u
    LEFT JOIN tb_funcionario as f ON f.id_usuario = u.id_usuario
    LEFT JOIN tb_cliente as c ON c.id_usuario = u.id_usuario
    LEFT JOIN tb_endereco as e ON e.id_endereco = u.id_endereco
    LEFT JOIN tb_pais as p ON p.id_pais = e.id_pais
    LEFT JOIN tb_plano as pl ON pl.id_plano = c.id_plano;
    
-- View do Catálogo
CREATE VIEW vw_catalogo AS
SELECT 
	c.id_catalogo,
	c.pais_origem,
	c.imagem_capa,
	c.titulo,
	c.sinopse,
	c.ano_lancamento,
	c.duracao,
	c.avaliacao,
	c.data_atualizacao,
	c.id_idioma,
	i.nome as idioma_original,
	cla.descricao as classificacao,
	cat.nome as categoria,
    (SELECT COUNT(*) from tb_catalogo_idioma WHERE id_catalogo = c.id_catalogo) AS Quant_idioma_disponivel,
		CASE
			WHEN c.tipo_midia = 'F' THEN 'Filme'
			WHEN c.tipo_midia = 'S' THEN 'Serie'
		ELSE 'N/A'
	END AS Tipo_catalogo
FROM tb_catalogo as c 
	LEFT JOIN tb_idioma as i on i.id_idioma = c.id_idioma
	LEFT JOIN tb_classificacao as cla on cla.id_classificacao=c.id_classificacao
	LEFT JOIN Tb_catalogo_categoria as cc on cc.id_catalogo= c.id_catalogo 
	LEFT JOIN tb_categoria as cat on cat.id_categoria= cc.id_categoria; 

-- View do Episódio
CREATE VIEW vw_episodio AS
SELECT 
	c.titulo as nome_serie,
	t.numero_temporada as numero_temporada,
	t.titulo as nome_temporada,
	t.quantidade_episodio,
	e.numero_episodio
FROM tb_catalogo as c
	INNER JOIN tb_episodio as e on e.id_catalogo=c.id_catalogo
	LEFT JOIN tb_temporada as t on t.id_temporada=e.id_temporada;
-- SELECT * FROM vw_episodio;

-- View da Temporada
CREATE VIEW vw_temporada AS
SELECT 
	t.numero_temporada as numero_temporada,
	t.titulo as nome_temporada,
	t.descricao as descricao,
	t.quantidade_episodio,
	c.titulo as nome_serie
FROM tb_catalogo as c
	INNER JOIN tb_episodio as e on e.id_catalogo=c.id_catalogo
	LEFT JOIN tb_temporada as t on t.id_temporada= e.id_temporada
	LEFT JOIN tb_serie as s on s.id_serie = t.id_serie;
-- SELECT * FROM tb_temporada;

-- VIEW ATOR
CREATE VIEW vw_ator AS
    SELECT 
        a.nome,
        a.sobrenome,
        a.data_nascimento,
        a.foto,
        COUNT(F.ID_CATALOGO) AS qtd_filmes,
        COUNT(S.ID_CATALOGO) AS qtd_series
    FROM
        tb_ator a
            LEFT JOIN
        tb_catalogo_ator AS ca ON ca.id_ator = a.id_ator
            LEFT JOIN
        tb_catalogo AS c ON c.id_catalogo = ca.id_catalogo
            LEFT JOIN
        tb_filme F ON f.id_catalogo = c.id_catalogo
            LEFT JOIN
        tb_serie S ON s.id_catalogo = c.id_catalogo
    GROUP BY a.nome , a.sobrenome , a.data_nascimento , a.foto;
-- SELECT * FROM vw_ator;

-- VIEW PAGAMENTO
CREATE VIEW vw_pagamento AS
SELECT 
p.id_pagamento,
p.valor,
p.data_pagamento,
p.id_cartao,
c.id_plano,
u.nome as nome_cliente,
tp.nome as tipo_pagamento,
pl.descricao as nome_plano,
c.data_vencimento_plano
FROM tb_pagamento as P
LEFT JOIN tb_tipo_pagamento as Tp ON tp.id_tipo_pagamento = p.id_tipo_pagamento
LEFT JOIN tb_cliente as c ON p.id_cliente=c.id_cliente
LEFT JOIN tb_usuario as U ON u.id_usuario=c.id_usuario
LEFT JOIN tb_plano as pl ON pl.id_plano=c.id_plano;

-- VIEW perfil
CREATE VIEW vw_perfil AS
SELECT 
p.foto as foto_perfil, 
p.nome as nome_perfil,
p.tipo as tipo_perfil,
u.nome as nome_cliente,
c.id_usuario,
c.id_cartao,
c.id_plano,
c.data_vencimento_plano 
FROM tb_perfil p
INNER JOIN tb_cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN tb_usuario u ON u.id_usuario =c.id_usuario;