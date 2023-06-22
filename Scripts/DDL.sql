-- @udanielarthur

-- Create database db_streaming
CREATE DATABASE IF NOT EXISTS db_streaming
COLLATE utf8mb4_general_ci 
CHARSET utf8mb4;
USE db_streaming;

-- Criar Tabela País
CREATE TABLE IF NOT EXISTS tb_pais (
	id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(140) NOT NULL,
	codigo CHAR(3) NOT NULL
);

-- Criar Tabela Plano
CREATE TABLE IF NOT EXISTS tb_plano (
	id_plano INTEGER PRIMARY KEY AUTO_INCREMENT,
	valor FLOAT NOT NULL,
	descricao VARCHAR(200) NOT NULL
);

-- Criar Tabela Tipo Pagamento
CREATE TABLE IF NOT EXISTS tb_tipo_pagamento (
	id_tipo_pagamento INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) UNIQUE NOT NULL
);

-- Criar Tabela Cartão de Crédito
CREATE TABLE IF NOT EXISTS tb_cartao_credito (
	id_cartao INTEGER PRIMARY KEY AUTO_INCREMENT,
	numero CHAR(20) UNIQUE NOT NULL,
	data_vencimento DATE NOT NULL,
	cod_seguranca CHAR(3) NOT NULL,
	nome_cartao VARCHAR(150) NOT NULL
);

-- Criar Tabela Classificação
CREATE TABLE IF NOT EXISTS tb_classificacao (
	id_classificacao INTEGER PRIMARY KEY AUTO_INCREMENT,
	idade INTEGER NOT NULL,
	descricao VARCHAR(250) NOT NULL
);

-- Criar Tabela Categoria
CREATE TABLE IF NOT EXISTS tb_categoria (
	id_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL
);

-- Criar Tabela Idioma
CREATE TABLE IF NOT EXISTS tb_idioma (
	id_idioma INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL
);

-- Criar Tabela Ator
CREATE TABLE IF NOT EXISTS tb_ator (
	id_ator INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(150) NOT NULL,
	sobrenome VARCHAR(150) NOT NULL,
	data_nascimento DATE NOT NULL,
	foto VARCHAR(255) NOT NULL
);

-- Criar Tabela Endereço
CREATE TABLE IF NOT EXISTS tb_endereco (
	id_endereco INTEGER PRIMARY KEY AUTO_INCREMENT,
	cep VARCHAR(100) NOT NULL,
	bairro VARCHAR(255) NOT NULL,
	rua VARCHAR(255),
	quadra VARCHAR(255),
	numero INTEGER NOT NULL,
	id_pais INTEGER NOT NULL,
	data_atualizacao DATE NOT NULL,
	CONSTRAINT FK_id_pais_endereco FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

-- Criar Tabela Usuário
CREATE TABLE IF NOT EXISTS tb_usuario (
	id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(150) NOT NULL,
	data_atualizacao DATE NOT NULL,
	sobrenome VARCHAR(150) NOT NULL,
	email VARCHAR(200) UNIQUE NOT NULL,
	status ENUM ('A' , 'I') NOT NULL, -- A para Ativo, I para Inativo
	data_nascimento DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	senha VARCHAR(225) NOT NULL,
	id_endereco INTEGER NOT NULL,
	CONSTRAINT FK_id_endereco FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco)
);

-- Criar Tabela Funcionário
CREATE TABLE IF NOT EXISTS tb_funcionario (
	id_funcionario INTEGER PRIMARY KEY AUTO_INCREMENT,
	foto_funcionario VARCHAR(255) NOT NULL,
	data_atualizacao DATE NOT NULL,
	id_usuario INTEGER NOT NULL,
	CONSTRAINT FK_id_usuario_2 FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario)
);

-- Criar Tabela Cliente
CREATE TABLE IF NOT EXISTS tb_cliente (
	id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_usuario INTEGER NOT NULL,
	id_plano INTEGER NOT NULL,
	data_vencimento_plano DATE,
	id_cartao INTEGER NOT NULL,
	data_atualizacao DATE NOT NULL,
	CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario),
	CONSTRAINT FK_id_plano FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano),
	CONSTRAINT FK_id_cartao FOREIGN KEY (id_cartao) REFERENCES tb_cartao_credito(id_cartao)
);

-- Criar Tabela Pagamento
CREATE TABLE IF NOT EXISTS tb_pagamento (
	id_pagamento INTEGER PRIMARY KEY AUTO_INCREMENT,
	valor FLOAT NOT NULL,
	data_pagamento DATE NOT NULL,
	id_cliente INTEGER NOT NULL,
	id_tipo_pagamento INTEGER NOT NULL,
	id_cartao INTEGER NOT NULL,
	CONSTRAINT FK_id_cartao_1 FOREIGN KEY (id_cartao) REFERENCES tb_cartao_credito(id_cartao),
	CONSTRAINT FK_id_cliente_1 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente),
	CONSTRAINT FK_id_tipo_pagamento FOREIGN KEY (id_tipo_pagamento) REFERENCES tb_tipo_pagamento(id_tipo_pagamento)
);

-- Criar Tabela Catálogo
CREATE TABLE IF NOT EXISTS tb_catalogo (
	id_catalogo INTEGER PRIMARY KEY AUTO_INCREMENT,
	pais_origem VARCHAR(130) NOT NULL,
	imagem_capa VARCHAR(255)NOT NULL,
	titulo VARCHAR(170) NOT NULL,
	sinopse VARCHAR(255) NOT NULL,
	ano_lancamento YEAR NOT NULL,
	duracao TIME NOT NULL,
	avaliacao ENUM ('1','2','3','4','5') NOT NULL,
	data_atualizacao DATE NOT NULL,
	id_classificacao INTEGER NOT NULL,
	id_idioma INTEGER NOT NULL,
	CONSTRAINT FK_id_classificacao FOREIGN KEY (id_classificacao) REFERENCES tb_classificacao(id_classificacao),
	CONSTRAINT FK_id_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma)
);

-- Inclui uma nova coluna na tabela tb_catalogo esscolhendo a posição
ALTER TABLE tb_catalogo
ADD COLUMN tipo_midia ENUM('F', 'S'); -- F para Filme, S para Série

-- Criar Tabela Perfil
CREATE TABLE IF NOT EXISTS tb_perfil (
	id_perfil INTEGER PRIMARY KEY AUTO_INCREMENT,
	foto VARCHAR(255) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	tipo ENUM( 'A', 'C') NOT NULL,
	id_cliente INTEGER NOT NULL,
	data_atualizacao DATE NOT NULL,
	CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
);

-- Criar Tabela Série
CREATE TABLE IF NOT EXISTS tb_serie (
	id_serie INTEGER PRIMARY KEY AUTO_INCREMENT,
	quant_episodio_total INTEGER NOT NULL,
	quantidade_temporada INTEGER NOT NULL,
	id_catalogo INTEGER NOT NULL,
	CONSTRAINT FK_id_catalogo_4 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo)
);      

-- Criar Tabela Filme
CREATE TABLE IF NOT EXISTS tb_filme (
	id_filme INTEGER PRIMARY KEY AUTO_INCREMENT,
	oscar INTEGER NOT NULL,
	id_catalogo INTEGER NOT NULL,
	CONSTRAINT FK_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo)
);
 
-- Criar Tabela Temporada
CREATE TABLE IF NOT EXISTS tb_temporada (
	id_temporada INTEGER PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(145) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	quantidade_episodio INTEGER NOT NULL,
	id_serie INTEGER NOT NULL,
	CONSTRAINT FK_id_serie FOREIGN KEY (id_serie) REFERENCES tb_serie(id_serie)
);
-- Adicionar coluna numero_temporada na tabela temporada
ALTER TABLE tb_temporada ADD COLUMN numero_temporada INT;

-- Criar Tabela Episódio
CREATE TABLE IF NOT EXISTS tb_episodio (
	id_episodio INTEGER PRIMARY KEY AUTO_INCREMENT,
	numero_episodio INTEGER NOT NULL,
	id_catalogo INTEGER NOT NULL,
	id_temporada INTEGER NOT NULL,
	CONSTRAINT FK_id_temporada FOREIGN KEY (id_temporada) REFERENCES tb_temporada(id_temporada),
	CONSTRAINT FK_id_catalogo_5 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo)
);

-- Criar Tabela pais_catalogo
CREATE TABLE IF NOT EXISTS tb_pais_catalogo (
	id_pais_catalogo INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_pais INTEGER NOT NULL,
	id_catalogo INTEGER NOT NULL,
	CONSTRAINT FK_id_pais_3 FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais),
	CONSTRAINT FK_id_catalogo_6 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo)
);

-- Criar Tabela catalogo_ator
CREATE TABLE IF NOT EXISTS tb_catalogo_ator (
	id_catalogo_ator INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_catalogo INTEGER NOT NULL,
	id_ator INTEGER NOT NULL,
	CONSTRAINT FK_id_catalogo_1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo),
	CONSTRAINT FK_id_ator FOREIGN KEY (id_ator) REFERENCES tb_ator (id_ator)
);

-- Criar Tabela catalogo_categoria
CREATE TABLE IF NOT EXISTS tb_catalogo_categoria (
	id_catalogo_categoria INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_categoria INTEGER NOT NULL,
	id_catalogo INTEGER NOT NULL,
	CONSTRAINT FK_id_categoria_1 FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria),
	CONSTRAINT FK_id_catalogo_2 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo)
);

-- Criar Tabela catalogo_idioma
CREATE TABLE IF NOT EXISTS tb_catalogo_idioma (
	id_catalogo_idioma INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_catalogo INTEGER NOT NULL,
	id_idioma INTEGER NOT NULL,
	CONSTRAINT FK_id_idioma_1 FOREIGN KEY (id_idioma)REFERENCES tb_idioma (id_idioma),
	CONSTRAINT FK_id_catalogo_3 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo)
);