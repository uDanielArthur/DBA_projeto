-- Inserçôes para verificar funcionalidade do banco

 INSERT INTO tb_ator 
	(nome, sobrenome, data_nascimento, foto)
VALUES
	(LOWER('Anthony'),LOWER('Mackie'),'1978-09-23','https://br.web.img3.acsta.net/c_310_420/pictures/19/04/16/18/24/1258711.jpg'),
	(LOWER('Will'),LOWER('Smith'),'1968-09-25','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg/640px-TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg'),
	(LOWER('Ana'),LOWER('de Armas'),'1988-04-30','https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Ana_de_Armas%2C_March_2018%2C_GQ_Mexico_04_cropped.jpg/250px-Ana_de_Armas%2C_March_2018%2C_GQ_Mexico_04_cropped.jpg'),
	(LOWER('Elizabeth'),LOWER('Banks'),'1974-02-10','https://static.wikia.nocookie.net/jogosvorazes/images/f/fb/Elizabeth-banks.jpg/revision/latest?cb=20161002010327&path-prefix=pt-br'),
	(LOWER('Dave'),LOWER('Bautista'),'1969-01-18','https://br.web.img3.acsta.net/c_310_420/pictures/18/09/04/19/30/2609205.jpg'),
    (LOWER('Katheryn'),LOWER('Winnick'),'1977-12-17','https://pbs.twimg.com/profile_images/1628866098002296834/iLeN3zd__400x400.jpg');
    
INSERT INTO tb_categoria
	(nome)
VALUES 
	(LOWER('Ação')),
	(LOWER('Comédia')),
	(LOWER('Drama')),
	(LOWER('Ficção Científica')),
	(LOWER('Suspense')),
	(LOWER('Aventura')),
	(LOWER('Romance')),
	(LOWER('Terror')),
	(LOWER('Infantil')),
	(LOWER('Religião'));
    
INSERT INTO tb_pais
	(nome, codigo)
VALUES
	(LOWER('Brasil'),LOWER('BRA')),
    (LOWER('Estados Unidos da América'), LOWER('EUA')),
    (LOWER('Argentina'),LOWER('ARG')),
    (LOWER('França'),LOWER('FRA')),
    (LOWER('Austrália'),LOWER('AUS')),
    (LOWER('Espanha'), LOWER('ESP')),
    (LOWER('Tailândia'),LOWER('THA')),
    (LOWER('Alemanha'),LOWER('ALE'));
INSERT INTO tb_idioma
	(nome)
VALUES 
	(LOWER('Português')),
    (LOWER('Português Brasileiro')),
    (LOWER('Inglês')),
    (LOWER('Japonês')),
    (LOWER('Mandarim')),
    (LOWER('Italiano')),
    (LOWER('Francês')),
    (LOWER('Espanhol')),
    (LOWER('Russo')),
    (LOWER('Tailandês')),
    (LOWER('Turco')),
    (LOWER('Coreano')),
    (LOWER('Alemão'));

INSERT INTO tb_catalogo
	(Pais_origem, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, data_atualizacao, id_classificacao, id_idioma)
VALUES
(LOWER('Estados Unidos da américa'),'https://cinema10.com.br/upload/featuredImage.php?url=https%3A%2F%2Fcinema10.com.br%2Fupload%2Fseries%2Fseries_5_MV5BZTczMjRjNDItNmFhOS00NmU3LTllMTAtMTk1ZWU0NWJmNzUxXkEyXkFqcGdeQXVyNTA4NzY1MzY%40._V1_SY1000_CR0%2C0%2C701%2C1000_AL_.jpg',LOWER('Friends'),LOWER('Seis amigos, três homens e três mulheres, enfrentam a vida e os amores em Nova York e adoram passar o tempo livre na cafeteria Central Park.'),1994,'00:30:00',4, CURDATE(),3,3),
(LOWER('Alemanha'),'https://resizing.flixster.com/lpJkDxnEFNQT1OWJjnmYfvpAHJ0=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvUlRUVjI2NjgyOS53ZWJw',LOWER('Dark'),LOWER('Os mistérios sombrios de uma pequena cidade alemã são expostos quando duas crianças desaparecem. Enquanto as famílias procuram os dois desaparecidos, eles descobrem uma trama de indivíduos conectados com a história conturbada da cidade.'),2017,'01:00:00',4,CURDATE(),4,13),
(LOWER('Turquia'),'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS8ZpUnbnm-JGnAn1cCSxTXL9cEFmO_NcuKvjfRcjpfSMxwzW8S',LOWER('O Último Guardião'),LOWER('Descobrindo seus laços com uma ordem secreta antiga, um jovem de Istambul embarca em uma missão para salvar a cidade de um inimigo imortal.'),2018,'00:46:00',3,CURDATE(),3,11),
(LOWER('Brasil'),'https://i0.wp.com/jornalcomunicacao.ufpr.br/wp-content/uploads/2015/09/21939810.jpg?ssl=1',LOWER('Narcos'),LOWER('Conheça a notória e infame história dos mais violentos cartéis de drogas da Colômbia.'),2015, '00:50:00',5,CURDATE(),5,2),
(LOWER('França'),'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQaP8TqXAxW2gsObYG6un9xMX9rOYGP3Pgyg8CRaEbhNLnTGO7j',LOWER('Lupin'),LOWER('Inspirado pelas aventuras de Arsène Lupin, o ladrão gentil Assane Diop quer se vingar de uma família rica por uma injustiça cometida contra o pai dele.'),2021,'00:41:00',5,CURDATE(),3,7),
(LOWER('Estados Unidos da América'),'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ7t9b0ixwBWfuade5ehS5PQqZL5_oYUhyDNOa5cQikhrDrqoCP',LOWER('Guerra ao Terror'),LOWER('JT Sanborn, Brian Geraghty e Matt Thompson integram o esquadrão antibombas do exército americano em missão no Iraque. Eles trabalham na destruição de um explosivo, para que seja detonado sem atingir alguém.'),2010,'02:04:00',4,CURDATE(),4,3),
(LOWER('França'),'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL6g90YvMslOD-T6wi0t9Z_BJDesrL0ZlWbQgpfQZbEQx28LD0', LOWER('Amor'), LOWER('Georges e Anne são dois idosos apaixonados pela arte e, principalmente, um pelo outro. Os desafios da terceira idade afetam sua forma de viver e o modo como se relacionam com a filha, mas o amor entre eles segue inabalável.'),2012,'02:12:00',4,CURDATE(),4,7),
(LOWER('Brasil'),'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQEuGqzqbuqNJxbBunRYMRTjFzroETQjfVTuFjX9SZ2Z8RJpoZq', LOWER('Cidade de Deus'), LOWER('Buscapé é um jovem pobre, negro e sensível, que cresce em um universo de muita violência. Ele vive na Cidade de Deus, favela carioca conhecida por ser um dos locais mais violentos do Rio.'),2002,'02:15:00',4,CURDATE(),4,2),
(LOWER('Espanha'),'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT2Sa82fwsPqpufCGR71t3QrhgohkjqDFiTMTIbDVtDU740XT17',LOWER('Silenciadas'), LOWER('País Basco, 1609. Um grupo de mulheres acusadas de bruxaria tenta provar sua inocência ao realizar a celebração do Sabbath para seus inquisidores.'),2020,'01:32:00',3,CURDATE(),1,8),
(LOWER('Thailândes'),'https://pics.filmaffinity.com/The_Trapped_13_How_We_Survived_the_Thai_Cave-255423550-large.jpg', LOWER('Os 13 Sobreviventes da Caverna'), LOWER('Segue-se o resgate da caverna Tham Luang, uma missão de 2018 que salvou um time de futebol da associação júnior de uma caverna inundada.'),2022,'01:41:00',5,CURDATE(),2,10);

INSERT INTO tb_classificacao
	(idade, descricao)
VALUES 
	(10,LOWER('Não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock''n''roll')),
    (12, LOWER('Não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes')),
    (14, LOWER('contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas')),
	(16, LOWER('não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo')),
    (18, LOWER('não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas'));

INSERT INTO tb_serie 
	(quant_episodio_total, quantidade_temporada,id_catalogo)
VALUES 
	(236,10,1), 
    (26,3,2), 
    (32,4,3),
    (30,3,4), 
    (10,2,5); 
  
INSERT INTO TB_FILME
	(oscar, id_catalogo)
VALUES 
	(6,6),
	(1,7),
    (0,8),
    (0,9),
    (2,10);

INSERT INTO tb_tipo_pagamento (nome)
VALUES (LOWER('Cartão de crédito')), (LOWER('Cartão de Débito')), (LOWER('Boleto')), (LOWER('Pix')), (LOWER('Paypal'));


INSERT INTO tb_plano(valor,descricao)
VALUES
('35.00',LOWER('Plano Básico, Contém conteúdo básico')),
('45.00',LOWER('Plano Plus, alguns bônus adicionais')),
('55.00',LOWER('Plano Master, acesso à tudo'));

INSERT INTO tb_temporada (titulo,descricao, quantidade_episodio, id_serie)
VALUES
(LOWER('O Início'), LOWER('Aonde começa a série'),24,1),
(LOWER('Piloto'), LOWER('Início da temporada'),8,2);

INSERT INTO tb_cartao_credito(numero,data_vencimento,cod_seguranca,nome_cartao)
VALUES
('4444555555668887', '2024-07-15', '870', 'Carolina Araújo'),
('8884499900001111', '2023-10-31', '335', 'Fernando Alves'),
('2211333344445555', '2024-02-28', '618', 'Camilla Rodrigues'),
('6699777788889999', '2023-12-31', '312', 'Rafaela Silva'),
('5555666676778888', '2024-06-30', '243', 'Luis Mendes');

INSERT INTO tb_endereco (cep,bairro,rua,quadra,numero,id_pais,data_atualizacao)
VALUES
	('12345-678', 'Centro', 'Rua A', 'Quadra 1', 10, 1, '2023-06-14'),
    ('54321-098', 'Vila Nova', 'Rua B', 'Quadra 2', 20, 1, '2023-06-14'),
    ('98765-432', 'Jardim das Flores', 'Rua C', 'Quadra 3', 30, 2, '2023-06-14'),
    ('45678-901', 'Bairro Novo', 'Rua D', 'Quadra 4', 40, 3, '2023-06-14'),
    ('56789-012', 'Centro', 'Rua E', 'Quadra 5', 50, 4, '2023-06-14'),
    ('87654-321', 'Vila Nova', 'Rua F', 'Quadra 6', 60, 1, '2023-06-14'),
    ('23456-789', 'Jardim das Flores', 'Rua G', 'Quadra 7', 70, 3, '2023-06-14'),
    ('78901-234', 'Bairro Novo', 'Rua H', 'Quadra 8', 80, 2, '2023-06-14'),
    ('34567-890', 'Centro', 'Rua I', 'Quadra 9', 90, 4, '2023-06-14'),
    ('67890-123', 'Vila Nova', 'Rua J', 'Quadra 10', 100, 1, '2023-06-14');

INSERT INTO tb_usuario (nome,data_atualizacao,sobrenome,email,status,data_nascimento,data_cadastro,senha,id_endereco)
VALUES 
(LOWER('Carolina'), '2023-05-09', LOWER('Mendes'), 'carolina.mendes@example.com', LOWER('A'), '1990-01-01', '2023-05-01',MD5('123456'),1),
(lower('Fernando'), '2023-05-09', lower('Costa'), 'fernando.costa@example.com', LOWER('I'), '1985-02-15', '2023-04-27',MD5('secreta123'),2),
(lower('Camila'), '2023-05-09', lower('Rodrigues'), 'camila.rodrigues@example.com', LOWER('A'), '1992-07-10', '2023-05-03',MD5('senha@2023'),3),
(lower('Rafaela'), '2023-05-09', lower('Santos'), 'rafaela.santos@example.com', LOWER('A'), '1994-04-20', '2023-05-05',MD5('p4ssw0rd'),4),
(lower('Gustavo'), '2023-05-09', lower('Lima'), 'gustavo.lima@example.com', LOWER('I'), '1998-09-30', '2023-04-29','myPass123',5),
(lower('Laura'), '2023-06-14', lower('Ribeiro'), 'laura.ribeiro@example.com', LOWER('A'), '1993-03-25', '2023-06-14', 'senha123', 6),
(lower('Rafael'), '2023-06-14', lower('Gomes'), 'rafael.gomes@example.com', LOWER('A'), '1987-11-12', '2023-06-14', 'senha456', 7),
(lower('Camila'), '2023-06-14', lower('Almeida'), 'camila.almeida@example.com', LOWER('I'), '1994-08-05', '2023-06-14', 'senha789', 8),
(lower('Mariana'), '2023-06-14', lower('Melo'), 'mariana.melo@example.com', LOWER('A'), '1989-06-30', '2023-06-14', 'senhaabc', 9),
(lower('Gustavo'), '2023-06-14', LOWER('Costa'), 'gustavo.costa@example.com', LOWER('A'), '1996-04-18', '2023-06-14', 'senhadef', 10);
SELECT * FROM TB_USUARIO;
INSERT INTO tb_funcionario (foto_funcionario,data_atualizacao,id_usuario)
VALUES 
('caminho1/foto1.jpg', '2023-05-09',1),
('caminho2/foto2.jpg', '2023-05-09',2),
('caminho3/foto3.jpg', '2023-05-09',3 ),
('caminho4/foto4.jpg', '2023-05-09',4 ),
('caminho5/foto5.jpg', '2023-05-09',5 );

INSERT INTO tb_cliente (id_usuario,id_plano,data_vencimento_plano,id_cartao,data_atualizacao)
VALUES 
(1,2,'2024-07-15',1,'2023-05-09'),
(2,1,'2023-10-31',2,'2023-05-09'),
(3,3,'2024-02-28',3,'2023-05-09'),
(4,1,'2023-12-31',4,'2023-05-09'),
(5,2,'2024-06-30',5,'2023-05-09');

INSERT INTO tb_pagamento (valor,data_pagamento,id_cliente,id_tipo_pagamento,id_cartao) 
VALUES 
('35.00','2023-06-10',1,2,1),
('45.00','2023-06-05',2,2,2),
('55.00','2023-06-01',3,3,3),
('55.00','2023-06-02',4,2,4),
('35.00','2023-06-03',5,1,5);

INSERT INTO tb_perfil (foto,nome,tipo,id_cliente,data_atualizacao)
VALUES 
('/caminho/foto1.jpg', 'Perfil A', 'A', 1, '2023-06-10'),
('/caminho/foto2.jpg', 'Perfil B', 'C', 2, '2023-06-11'),
('/caminho/foto3.jpg', 'Perfil C', 'C', 3, '2023-06-12'),
('/caminho/foto4.jpg', 'Perfil D', 'A', 4, '2023-06-13'),
('/caminho/foto5.jpg', 'Perfil E', 'C', 5,'2023-06-14');

INSERT INTO tb_episodio (numero_episodio,id_catalogo,id_temporada)
values
(1,5,1),
(2,7,2),
(1,9,2),
(2,2,1),
(1,3,2),
(2,4,2),
(1,6,1),
(2,10,2);

 INSERT INTO tb_pais_catalogo(id_pais,id_catalogo)
 VALUES
(1,2),
(2,6),
(3,7),
(4,8),
(1,5),
(2,4),
(3,3),
(4,1);

INSERT INTO tb_catalogo_ator(id_catalogo,id_ator) 
 VALUES
 (5,1),
 (6,2),
 (7,3),
 (3,4),
 (4,5),
 (2,1),
 (1,2),
 (3,3);
 
 INSERT INTO tb_catalogo_categoria(id_catalogo,id_categoria)
 VALUES
(5,1),
(6,2),
(7,3),
(8,4),
(4,5),
(9,1),
(3,2),
(2,3);

INSERT INTO tb_catalogo_idioma(id_catalogo,id_idioma)
 VALUES
(5,1),
(6,2),
(7,3),
(8,4),
(4,5),
(3,6),
(2,1),
(1,2);