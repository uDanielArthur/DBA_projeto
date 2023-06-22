CREATE DATABASE  IF NOT EXISTS `db_streaming` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_streaming`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_streaming
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_ator`
--

DROP TABLE IF EXISTS `tb_ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ator` (
  `id_ator` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `sobrenome` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_ator`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ator`
--

LOCK TABLES `tb_ator` WRITE;
/*!40000 ALTER TABLE `tb_ator` DISABLE KEYS */;
INSERT INTO `tb_ator` VALUES (1,'anthony','mackie','1978-09-23','https://br.web.img3.acsta.net/c_310_420/pictures/19/04/16/18/24/1258711.jpg'),(2,'will','smith','1968-09-25','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg/640px-TechCrunch_Disrupt_2019_%2848834434641%29_%28cropped%29.jpg'),(3,'ana','de armas','1988-04-30','https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Ana_de_Armas%2C_March_2018%2C_GQ_Mexico_04_cropped.jpg/250px-Ana_de_Armas%2C_March_2018%2C_GQ_Mexico_04_cropped.jpg'),(4,'elizabeth','banks','1974-02-10','https://static.wikia.nocookie.net/jogosvorazes/images/f/fb/Elizabeth-banks.jpg/revision/latest?cb=20161002010327&path-prefix=pt-br'),(5,'dave','bautista','1969-01-18','https://br.web.img3.acsta.net/c_310_420/pictures/18/09/04/19/30/2609205.jpg'),(6,'katheryn','winnick','1977-12-17','https://pbs.twimg.com/profile_images/1628866098002296834/iLeN3zd__400x400.jpg');
/*!40000 ALTER TABLE `tb_ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cartao_credito`
--

DROP TABLE IF EXISTS `tb_cartao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cartao_credito` (
  `id_cartao` int NOT NULL AUTO_INCREMENT,
  `numero` char(20) COLLATE utf8mb4_general_ci NOT NULL,
  `data_vencimento` date NOT NULL,
  `cod_seguranca` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `nome_cartao` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_cartao`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartao_credito`
--

LOCK TABLES `tb_cartao_credito` WRITE;
/*!40000 ALTER TABLE `tb_cartao_credito` DISABLE KEYS */;
INSERT INTO `tb_cartao_credito` VALUES (1,'4444555555668887','2024-07-15','870','Carolina Araújo'),(2,'8884499900001111','2023-10-31','335','Fernando Alves'),(3,'2211333344445555','2024-02-28','618','Camilla Rodrigues'),(4,'6699777788889999','2023-12-31','312','Rafaela Silva'),(5,'5555666676778888','2024-06-30','243','Luis Mendes');
/*!40000 ALTER TABLE `tb_cartao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo`
--

DROP TABLE IF EXISTS `tb_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo` (
  `id_catalogo` int NOT NULL AUTO_INCREMENT,
  `pais_origem` varchar(130) COLLATE utf8mb4_general_ci NOT NULL,
  `imagem_capa` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `titulo` varchar(170) COLLATE utf8mb4_general_ci NOT NULL,
  `sinopse` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ano_lancamento` year NOT NULL,
  `duracao` time NOT NULL,
  `avaliacao` enum('1','2','3','4','5') COLLATE utf8mb4_general_ci NOT NULL,
  `data_atualizacao` date NOT NULL,
  `id_classificacao` int NOT NULL,
  `id_idioma` int NOT NULL,
  `tipo_midia` enum('F','S') COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_catalogo`),
  KEY `FK_id_classificacao` (`id_classificacao`),
  KEY `FK_id_idioma` (`id_idioma`),
  CONSTRAINT `FK_id_classificacao` FOREIGN KEY (`id_classificacao`) REFERENCES `tb_classificacao` (`id_classificacao`),
  CONSTRAINT `FK_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo`
--

LOCK TABLES `tb_catalogo` WRITE;
/*!40000 ALTER TABLE `tb_catalogo` DISABLE KEYS */;
INSERT INTO `tb_catalogo` VALUES (1,'estados unidos da américa','https://cinema10.com.br/upload/featuredImage.php?url=https%3A%2F%2Fcinema10.com.br%2Fupload%2Fseries%2Fseries_5_MV5BZTczMjRjNDItNmFhOS00NmU3LTllMTAtMTk1ZWU0NWJmNzUxXkEyXkFqcGdeQXVyNTA4NzY1MzY%40._V1_SY1000_CR0%2C0%2C701%2C1000_AL_.jpg','friends','seis amigos, três homens e três mulheres, enfrentam a vida e os amores em nova york e adoram passar o tempo livre na cafeteria central park.',1994,'00:30:00','4','2023-06-22',3,3,NULL),(2,'alemanha','https://resizing.flixster.com/lpJkDxnEFNQT1OWJjnmYfvpAHJ0=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvUlRUVjI2NjgyOS53ZWJw','dark','os mistérios sombrios de uma pequena cidade alemã são expostos quando duas crianças desaparecem. enquanto as famílias procuram os dois desaparecidos, eles descobrem uma trama de indivíduos conectados com a história conturbada da cidade.',2017,'01:00:00','4','2023-06-22',4,13,NULL),(3,'turquia','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS8ZpUnbnm-JGnAn1cCSxTXL9cEFmO_NcuKvjfRcjpfSMxwzW8S','o último guardião','descobrindo seus laços com uma ordem secreta antiga, um jovem de istambul embarca em uma missão para salvar a cidade de um inimigo imortal.',2018,'00:46:00','3','2023-06-22',3,11,NULL),(4,'brasil','https://i0.wp.com/jornalcomunicacao.ufpr.br/wp-content/uploads/2015/09/21939810.jpg?ssl=1','narcos','conheça a notória e infame história dos mais violentos cartéis de drogas da colômbia.',2015,'00:50:00','5','2023-06-22',5,2,NULL),(5,'frança','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQaP8TqXAxW2gsObYG6un9xMX9rOYGP3Pgyg8CRaEbhNLnTGO7j','lupin','inspirado pelas aventuras de arsène lupin, o ladrão gentil assane diop quer se vingar de uma família rica por uma injustiça cometida contra o pai dele.',2021,'00:41:00','5','2023-06-22',3,7,NULL),(6,'estados unidos da américa','https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ7t9b0ixwBWfuade5ehS5PQqZL5_oYUhyDNOa5cQikhrDrqoCP','guerra ao terror','jt sanborn, brian geraghty e matt thompson integram o esquadrão antibombas do exército americano em missão no iraque. eles trabalham na destruição de um explosivo, para que seja detonado sem atingir alguém.',2010,'02:04:00','4','2023-06-22',4,3,NULL),(7,'frança','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL6g90YvMslOD-T6wi0t9Z_BJDesrL0ZlWbQgpfQZbEQx28LD0','amor','georges e anne são dois idosos apaixonados pela arte e, principalmente, um pelo outro. os desafios da terceira idade afetam sua forma de viver e o modo como se relacionam com a filha, mas o amor entre eles segue inabalável.',2012,'02:12:00','4','2023-06-22',4,7,NULL),(8,'brasil','https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQEuGqzqbuqNJxbBunRYMRTjFzroETQjfVTuFjX9SZ2Z8RJpoZq','cidade de deus','buscapé é um jovem pobre, negro e sensível, que cresce em um universo de muita violência. ele vive na cidade de deus, favela carioca conhecida por ser um dos locais mais violentos do rio.',2002,'02:15:00','4','2023-06-22',4,2,NULL),(9,'espanha','https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT2Sa82fwsPqpufCGR71t3QrhgohkjqDFiTMTIbDVtDU740XT17','silenciadas','país basco, 1609. um grupo de mulheres acusadas de bruxaria tenta provar sua inocência ao realizar a celebração do sabbath para seus inquisidores.',2020,'01:32:00','3','2023-06-22',1,8,NULL),(10,'thailândes','https://pics.filmaffinity.com/The_Trapped_13_How_We_Survived_the_Thai_Cave-255423550-large.jpg','os 13 sobreviventes da caverna','segue-se o resgate da caverna tham luang, uma missão de 2018 que salvou um time de futebol da associação júnior de uma caverna inundada.',2022,'01:41:00','5','2023-06-22',2,10,NULL);
/*!40000 ALTER TABLE `tb_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_ator`
--

DROP TABLE IF EXISTS `tb_catalogo_ator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo_ator` (
  `id_catalogo_ator` int NOT NULL AUTO_INCREMENT,
  `id_catalogo` int NOT NULL,
  `id_ator` int NOT NULL,
  PRIMARY KEY (`id_catalogo_ator`),
  KEY `FK_id_catalogo_1` (`id_catalogo`),
  KEY `FK_id_ator` (`id_ator`),
  CONSTRAINT `FK_id_ator` FOREIGN KEY (`id_ator`) REFERENCES `tb_ator` (`id_ator`),
  CONSTRAINT `FK_id_catalogo_1` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_ator`
--

LOCK TABLES `tb_catalogo_ator` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_ator` DISABLE KEYS */;
INSERT INTO `tb_catalogo_ator` VALUES (1,5,1),(2,6,2),(3,7,3),(4,3,4),(5,4,5),(6,2,1),(7,1,2),(8,3,3);
/*!40000 ALTER TABLE `tb_catalogo_ator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_categoria`
--

DROP TABLE IF EXISTS `tb_catalogo_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo_categoria` (
  `id_catalogo_categoria` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `id_catalogo` int NOT NULL,
  PRIMARY KEY (`id_catalogo_categoria`),
  KEY `FK_id_categoria_1` (`id_categoria`),
  KEY `FK_id_catalogo_2` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_2` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_categoria_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_categoria`
--

LOCK TABLES `tb_catalogo_categoria` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_categoria` DISABLE KEYS */;
INSERT INTO `tb_catalogo_categoria` VALUES (1,1,5),(2,2,6),(3,3,7),(4,4,8),(5,5,4),(6,1,9),(7,2,3),(8,3,2);
/*!40000 ALTER TABLE `tb_catalogo_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_catalogo_idioma`
--

DROP TABLE IF EXISTS `tb_catalogo_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_catalogo_idioma` (
  `id_catalogo_idioma` int NOT NULL AUTO_INCREMENT,
  `id_catalogo` int NOT NULL,
  `id_idioma` int NOT NULL,
  PRIMARY KEY (`id_catalogo_idioma`),
  KEY `FK_id_idioma_1` (`id_idioma`),
  KEY `FK_id_catalogo_3` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_3` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_idioma_1` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_catalogo_idioma`
--

LOCK TABLES `tb_catalogo_idioma` WRITE;
/*!40000 ALTER TABLE `tb_catalogo_idioma` DISABLE KEYS */;
INSERT INTO `tb_catalogo_idioma` VALUES (1,5,1),(2,6,2),(3,7,3),(4,8,4),(5,4,5),(6,3,6),(7,2,1),(8,1,2);
/*!40000 ALTER TABLE `tb_catalogo_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'ação'),(2,'comédia'),(3,'drama'),(4,'ficção científica'),(5,'suspense'),(6,'aventura'),(7,'romance'),(8,'terror'),(9,'infantil'),(10,'religião');
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_classificacao`
--

DROP TABLE IF EXISTS `tb_classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_classificacao` (
  `id_classificacao` int NOT NULL AUTO_INCREMENT,
  `idade` int NOT NULL,
  `descricao` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_classificacao`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classificacao`
--

LOCK TABLES `tb_classificacao` WRITE;
/*!40000 ALTER TABLE `tb_classificacao` DISABLE KEYS */;
INSERT INTO `tb_classificacao` VALUES (1,10,'não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock\'n\'roll'),(2,12,' não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes '),(3,14,' contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas'),(4,16,' não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo'),(5,18,'não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas'),(6,10,'não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock\'n\'roll'),(7,12,' não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes '),(8,14,' contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas'),(9,16,' não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo'),(10,18,'não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas'),(11,10,'não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock\'n\'roll'),(12,12,' não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes '),(13,14,' contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas'),(14,16,' não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo'),(15,18,'não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas'),(16,10,'não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock\'n\'roll'),(17,12,'não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes'),(18,14,'contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas'),(19,16,'não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo'),(20,18,'não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas');
/*!40000 ALTER TABLE `tb_classificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_plano` int NOT NULL,
  `data_vencimento_plano` date DEFAULT NULL,
  `id_cartao` int NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `FK_id_usuario` (`id_usuario`),
  KEY `FK_id_plano` (`id_plano`),
  KEY `FK_id_cartao` (`id_cartao`),
  CONSTRAINT `FK_id_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `tb_cartao_credito` (`id_cartao`),
  CONSTRAINT `FK_id_plano` FOREIGN KEY (`id_plano`) REFERENCES `tb_plano` (`id_plano`),
  CONSTRAINT `FK_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,1,2,'2024-07-15',1,'2023-05-09'),(2,2,1,'2023-10-31',2,'2023-05-09'),(3,3,3,'2024-02-28',3,'2023-05-09'),(4,4,1,'2023-12-31',4,'2023-05-09'),(5,5,2,'2024-06-30',5,'2023-05-09');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `id_endereco` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rua` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quadra` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero` int NOT NULL,
  `id_pais` int NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_endereco`),
  KEY `FK_id_pais_endereco` (`id_pais`),
  CONSTRAINT `FK_id_pais_endereco` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,'12345-678','Centro','Rua A','Quadra 1',10,1,'2023-06-14'),(2,'54321-098','Vila Nova','Rua B','Quadra 2',20,1,'2023-06-14'),(3,'98765-432','Jardim das Flores','Rua C','Quadra 3',30,2,'2023-06-14'),(4,'45678-901','Bairro Novo','Rua D','Quadra 4',40,3,'2023-06-14'),(5,'56789-012','Centro','Rua E','Quadra 5',50,4,'2023-06-14'),(6,'87654-321','Vila Nova','Rua F','Quadra 6',60,1,'2023-06-14'),(7,'23456-789','Jardim das Flores','Rua G','Quadra 7',70,3,'2023-06-14'),(8,'78901-234','Bairro Novo','Rua H','Quadra 8',80,2,'2023-06-14'),(9,'34567-890','Centro','Rua I','Quadra 9',90,4,'2023-06-14'),(10,'67890-123','Vila Nova','Rua J','Quadra 10',100,1,'2023-06-14');
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_episodio`
--

DROP TABLE IF EXISTS `tb_episodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_episodio` (
  `id_episodio` int NOT NULL AUTO_INCREMENT,
  `numero_episodio` int NOT NULL,
  `id_catalogo` int NOT NULL,
  `id_temporada` int NOT NULL,
  PRIMARY KEY (`id_episodio`),
  KEY `FK_id_temporada` (`id_temporada`),
  KEY `FK_id_catalogo_5` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_5` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_temporada` FOREIGN KEY (`id_temporada`) REFERENCES `tb_temporada` (`id_temporada`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_episodio`
--

LOCK TABLES `tb_episodio` WRITE;
/*!40000 ALTER TABLE `tb_episodio` DISABLE KEYS */;
INSERT INTO `tb_episodio` VALUES (1,1,5,1),(2,2,7,2),(3,1,9,2),(4,2,2,1),(5,1,3,2),(6,2,4,2),(7,1,6,1),(8,2,10,2);
/*!40000 ALTER TABLE `tb_episodio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_filme`
--

DROP TABLE IF EXISTS `tb_filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_filme` (
  `id_filme` int NOT NULL AUTO_INCREMENT,
  `oscar` int NOT NULL,
  `id_catalogo` int NOT NULL,
  PRIMARY KEY (`id_filme`),
  KEY `FK_id_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_filme`
--

LOCK TABLES `tb_filme` WRITE;
/*!40000 ALTER TABLE `tb_filme` DISABLE KEYS */;
INSERT INTO `tb_filme` VALUES (1,6,6),(2,1,7),(3,0,8),(4,0,9),(5,2,10);
/*!40000 ALTER TABLE `tb_filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `foto_funcionario` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data_atualizacao` date NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `FK_id_usuario_2` (`id_usuario`),
  CONSTRAINT `FK_id_usuario_2` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
INSERT INTO `tb_funcionario` VALUES (1,'caminho1/foto1.jpg','2023-05-09',1),(2,'caminho2/foto2.jpg','2023-05-09',2),(3,'caminho3/foto3.jpg','2023-05-09',3),(4,'caminho4/foto4.jpg','2023-05-09',4),(5,'caminho5/foto5.jpg','2023-05-09',5);
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_idioma`
--

DROP TABLE IF EXISTS `tb_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_idioma` (
  `id_idioma` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_idioma`
--

LOCK TABLES `tb_idioma` WRITE;
/*!40000 ALTER TABLE `tb_idioma` DISABLE KEYS */;
INSERT INTO `tb_idioma` VALUES (1,'português'),(2,'português brasileiro'),(3,'inglês'),(4,'japonês'),(5,'mandarim'),(6,'italiano'),(7,'francês'),(8,'espanhol'),(9,'russo'),(10,'tailandês'),(11,'turco'),(12,'coreano'),(13,'alemão');
/*!40000 ALTER TABLE `tb_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `data_pagamento` date NOT NULL,
  `id_cliente` int NOT NULL,
  `id_tipo_pagamento` int NOT NULL,
  `id_cartao` int NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `FK_id_cartao_1` (`id_cartao`),
  KEY `FK_id_cliente_1` (`id_cliente`),
  KEY `FK_id_tipo_pagamento` (`id_tipo_pagamento`),
  CONSTRAINT `FK_id_cartao_1` FOREIGN KEY (`id_cartao`) REFERENCES `tb_cartao_credito` (`id_cartao`),
  CONSTRAINT `FK_id_cliente_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  CONSTRAINT `FK_id_tipo_pagamento` FOREIGN KEY (`id_tipo_pagamento`) REFERENCES `tb_tipo_pagamento` (`id_tipo_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
INSERT INTO `tb_pagamento` VALUES (1,35,'2023-06-10',1,2,1),(2,45,'2023-06-05',2,2,2),(3,55,'2023-06-01',3,3,3),(4,55,'2023-06-02',4,2,4),(5,35,'2023-06-03',5,1,5);
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais`
--

DROP TABLE IF EXISTS `tb_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(140) COLLATE utf8mb4_general_ci NOT NULL,
  `codigo` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais`
--

LOCK TABLES `tb_pais` WRITE;
/*!40000 ALTER TABLE `tb_pais` DISABLE KEYS */;
INSERT INTO `tb_pais` VALUES (1,'brasil','bra'),(2,'estados unidos da américa','eua'),(3,'argentina','arg'),(4,'frança','fra'),(5,'austrália','aus'),(6,'espanha','esp'),(7,'tailândia','tha'),(8,'alemanha','ale');
/*!40000 ALTER TABLE `tb_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pais_catalogo`
--

DROP TABLE IF EXISTS `tb_pais_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pais_catalogo` (
  `id_pais_catalogo` int NOT NULL AUTO_INCREMENT,
  `id_pais` int NOT NULL,
  `id_catalogo` int NOT NULL,
  PRIMARY KEY (`id_pais_catalogo`),
  KEY `FK_id_pais_3` (`id_pais`),
  KEY `FK_id_catalogo_6` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_6` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`),
  CONSTRAINT `FK_id_pais_3` FOREIGN KEY (`id_pais`) REFERENCES `tb_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pais_catalogo`
--

LOCK TABLES `tb_pais_catalogo` WRITE;
/*!40000 ALTER TABLE `tb_pais_catalogo` DISABLE KEYS */;
INSERT INTO `tb_pais_catalogo` VALUES (1,1,2),(2,2,6),(3,3,7),(4,4,8),(5,1,5),(6,2,4),(7,3,3),(8,4,1);
/*!40000 ALTER TABLE `tb_pais_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_perfil`
--

DROP TABLE IF EXISTS `tb_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `foto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` enum('A','C') COLLATE utf8mb4_general_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `data_atualizacao` date NOT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `FK_id_cliente` (`id_cliente`),
  CONSTRAINT `FK_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_perfil`
--

LOCK TABLES `tb_perfil` WRITE;
/*!40000 ALTER TABLE `tb_perfil` DISABLE KEYS */;
INSERT INTO `tb_perfil` VALUES (1,'/caminho/foto1.jpg','Perfil A','A',1,'2023-06-10'),(2,'/caminho/foto2.jpg','Perfil B','C',2,'2023-06-11'),(3,'/caminho/foto3.jpg','Perfil C','C',3,'2023-06-12'),(4,'/caminho/foto4.jpg','Perfil D','A',4,'2023-06-13'),(5,'/caminho/foto5.jpg','Perfil E','C',5,'2023-06-14');
/*!40000 ALTER TABLE `tb_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_plano`
--

DROP TABLE IF EXISTS `tb_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_plano` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_plano`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_plano`
--

LOCK TABLES `tb_plano` WRITE;
/*!40000 ALTER TABLE `tb_plano` DISABLE KEYS */;
INSERT INTO `tb_plano` VALUES (1,35,'plano básico, contém conteúdo básico'),(2,45,'plano plus, alguns bônus adicionais'),(3,55,'plano master, acesso à tudo');
/*!40000 ALTER TABLE `tb_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_serie`
--

DROP TABLE IF EXISTS `tb_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_serie` (
  `id_serie` int NOT NULL AUTO_INCREMENT,
  `quant_episodio_total` int NOT NULL,
  `quantidade_temporada` int NOT NULL,
  `id_catalogo` int NOT NULL,
  PRIMARY KEY (`id_serie`),
  KEY `FK_id_catalogo_4` (`id_catalogo`),
  CONSTRAINT `FK_id_catalogo_4` FOREIGN KEY (`id_catalogo`) REFERENCES `tb_catalogo` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_serie`
--

LOCK TABLES `tb_serie` WRITE;
/*!40000 ALTER TABLE `tb_serie` DISABLE KEYS */;
INSERT INTO `tb_serie` VALUES (1,236,10,1),(2,26,3,2),(3,32,4,3),(4,30,3,4),(5,10,2,5);
/*!40000 ALTER TABLE `tb_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_temporada`
--

DROP TABLE IF EXISTS `tb_temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_temporada` (
  `id_temporada` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(145) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `quantidade_episodio` int NOT NULL,
  `id_serie` int NOT NULL,
  `numero_temporada` int DEFAULT NULL,
  PRIMARY KEY (`id_temporada`),
  KEY `FK_id_serie` (`id_serie`),
  CONSTRAINT `FK_id_serie` FOREIGN KEY (`id_serie`) REFERENCES `tb_serie` (`id_serie`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_temporada`
--

LOCK TABLES `tb_temporada` WRITE;
/*!40000 ALTER TABLE `tb_temporada` DISABLE KEYS */;
INSERT INTO `tb_temporada` VALUES (1,'o início','aonde começa a série',24,1,NULL),(2,'piloto','início da temporada',8,2,NULL);
/*!40000 ALTER TABLE `tb_temporada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_pagamento`
--

DROP TABLE IF EXISTS `tb_tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_pagamento` (
  `id_tipo_pagamento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo_pagamento`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_pagamento`
--

LOCK TABLES `tb_tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tb_tipo_pagamento` VALUES (3,'boleto'),(1,'cartão de crédito'),(2,'cartão de débito'),(5,'paypal'),(4,'pix');
/*!40000 ALTER TABLE `tb_tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `data_atualizacao` date NOT NULL,
  `sobrenome` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('A','I') COLLATE utf8mb4_general_ci NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `senha` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `id_endereco` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_id_endereco` (`id_endereco`),
  CONSTRAINT `FK_id_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `tb_endereco` (`id_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'carolina','2023-05-09','mendes','carolina.mendes@example.com','A','1990-01-01','2023-05-01','e10adc3949ba59abbe56e057f20f883e',1),(2,'fernando','2023-05-09','costa','fernando.costa@example.com','I','1985-02-15','2023-04-27','d7427ac624e8e73cedb8f0c6a90073a2',2),(3,'camila','2023-05-09','rodrigues','camila.rodrigues@example.com','A','1992-07-10','2023-05-03','6e92ba35f3e174865bf2958d90cb7750',3),(4,'rafaela','2023-05-09','santos','rafaela.santos@example.com','A','1994-04-20','2023-05-05','2a9d119df47ff993b662a8ef36f9ea20',4),(5,'gustavo','2023-05-09','lima','gustavo.lima@example.com','I','1998-09-30','2023-04-29','myPass123',5),(6,'laura','2023-06-14','ribeiro','laura.ribeiro@example.com','A','1993-03-25','2023-06-14','senha123',6),(7,'rafael','2023-06-14','gomes','rafael.gomes@example.com','A','1987-11-12','2023-06-14','senha456',7),(8,'camila','2023-06-14','almeida','camila.almeida@example.com','I','1994-08-05','2023-06-14','senha789',8),(9,'mariana','2023-06-14','melo','mariana.melo@example.com','A','1989-06-30','2023-06-14','senhaabc',9),(10,'gustavo','2023-06-14','costa','gustavo.costa@example.com','A','1996-04-18','2023-06-14','senhadef',10);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_ator`
--

DROP TABLE IF EXISTS `vw_ator`;
/*!50001 DROP VIEW IF EXISTS `vw_ator`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ator` AS SELECT 
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `data_nascimento`,
 1 AS `foto`,
 1 AS `qtd_filmes`,
 1 AS `qtd_series`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_catalogo`
--

DROP TABLE IF EXISTS `vw_catalogo`;
/*!50001 DROP VIEW IF EXISTS `vw_catalogo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_catalogo` AS SELECT 
 1 AS `id_catalogo`,
 1 AS `pais_origem`,
 1 AS `imagem_capa`,
 1 AS `titulo`,
 1 AS `sinopse`,
 1 AS `ano_lancamento`,
 1 AS `duracao`,
 1 AS `avaliacao`,
 1 AS `data_atualizacao`,
 1 AS `id_idioma`,
 1 AS `idioma_original`,
 1 AS `classificacao`,
 1 AS `categoria`,
 1 AS `Quant_idioma_disponivel`,
 1 AS `Tipo_catalogo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_episodio`
--

DROP TABLE IF EXISTS `vw_episodio`;
/*!50001 DROP VIEW IF EXISTS `vw_episodio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_episodio` AS SELECT 
 1 AS `nome_serie`,
 1 AS `numero_temporada`,
 1 AS `nome_temporada`,
 1 AS `quantidade_episodio`,
 1 AS `numero_episodio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pagamento`
--

DROP TABLE IF EXISTS `vw_pagamento`;
/*!50001 DROP VIEW IF EXISTS `vw_pagamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pagamento` AS SELECT 
 1 AS `id_pagamento`,
 1 AS `valor`,
 1 AS `data_pagamento`,
 1 AS `id_cartao`,
 1 AS `id_plano`,
 1 AS `nome_cliente`,
 1 AS `tipo_pagamento`,
 1 AS `nome_plano`,
 1 AS `data_vencimento_plano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_perfil`
--

DROP TABLE IF EXISTS `vw_perfil`;
/*!50001 DROP VIEW IF EXISTS `vw_perfil`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_perfil` AS SELECT 
 1 AS `foto_perfil`,
 1 AS `nome_perfil`,
 1 AS `tipo_perfil`,
 1 AS `nome_cliente`,
 1 AS `id_usuario`,
 1 AS `id_cartao`,
 1 AS `id_plano`,
 1 AS `data_vencimento_plano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_temporada`
--

DROP TABLE IF EXISTS `vw_temporada`;
/*!50001 DROP VIEW IF EXISTS `vw_temporada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_temporada` AS SELECT 
 1 AS `numero_temporada`,
 1 AS `nome_temporada`,
 1 AS `descricao`,
 1 AS `quantidade_episodio`,
 1 AS `nome_serie`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usuario`
--

DROP TABLE IF EXISTS `vw_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nome`,
 1 AS `data_atualizacao`,
 1 AS `sobrenome`,
 1 AS `email`,
 1 AS `status`,
 1 AS `data_nascimento`,
 1 AS `data_cadastro`,
 1 AS `endereco`,
 1 AS `cep`,
 1 AS `nome_pais`,
 1 AS `descricao`,
 1 AS `tipo_usuario`,
 1 AS `qtd_perfis`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_streaming'
--

--
-- Dumping routines for database 'db_streaming'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_minuscula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` FUNCTION `fn_minuscula`(texto VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
DECLARE resultado VARCHAR (255);
SET resultado = lower (texto);
RETURN resultado ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_valida_texto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` FUNCTION `fn_valida_texto`( texto VARCHAR(255), parametro INT) RETURNS tinyint(1)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_ator`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_categoria`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_classificacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_classificacao`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao FROM tb_classificacao WHERE id_classificacao = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao
		WHERE id_classificacao = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_idioma`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_pais`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_plano`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_delete_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_delete_tipo_pagamento`(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_ator`(nome_ator VARCHAR(45), sobrenome_ator VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_categoria`(nome_categoria VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_classificacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_classificacao`(idade_valor INT, descricao_texto VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_idioma`(nome_idioma VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_pais`(nome_pais VARCHAR(45), cod_pais CHAR(3))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_plano`(nome_plano VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_insert_tipo_pagamento`(nome_valor VARCHAR(30))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_ator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_ator`(valor_id INT, nome_ator VARCHAR(45), sobrenome_ator  VARCHAR(255), data_nascimento_ator VARCHAR(255), FOTO_ATOR VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_categoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_categoria`(valor_id INT, nome_valor VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_classificacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_classificacao`(valor_id INT, idade_valor INT, descricao_texto VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_idioma` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_idioma`(valor_id INT, nome_valor VARCHAR(45))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_pais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_pais`(valor_id INT, nome_pais VARCHAR(45), cod_pais CHAR(3))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_plano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_plano`(valor_id INT, nome_plano VARCHAR(45), valor FLOAT, descricao_plano  VARCHAR(255))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_tipo_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`udanielarthur`@`%` PROCEDURE `sp_update_tipo_pagamento`(valor_id INT, nome_valor VARCHAR(30))
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
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_ator`
--

/*!50001 DROP VIEW IF EXISTS `vw_ator`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ator` AS select `a`.`nome` AS `nome`,`a`.`sobrenome` AS `sobrenome`,`a`.`data_nascimento` AS `data_nascimento`,`a`.`foto` AS `foto`,count(`f`.`id_catalogo`) AS `qtd_filmes`,count(`s`.`id_catalogo`) AS `qtd_series` from ((((`tb_ator` `a` left join `tb_catalogo_ator` `ca` on((`ca`.`id_ator` = `a`.`id_ator`))) left join `tb_catalogo` `c` on((`c`.`id_catalogo` = `ca`.`id_catalogo`))) left join `tb_filme` `f` on((`f`.`id_catalogo` = `c`.`id_catalogo`))) left join `tb_serie` `s` on((`s`.`id_catalogo` = `c`.`id_catalogo`))) group by `a`.`nome`,`a`.`sobrenome`,`a`.`data_nascimento`,`a`.`foto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_catalogo`
--

/*!50001 DROP VIEW IF EXISTS `vw_catalogo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_catalogo` AS select `c`.`id_catalogo` AS `id_catalogo`,`c`.`pais_origem` AS `pais_origem`,`c`.`imagem_capa` AS `imagem_capa`,`c`.`titulo` AS `titulo`,`c`.`sinopse` AS `sinopse`,`c`.`ano_lancamento` AS `ano_lancamento`,`c`.`duracao` AS `duracao`,`c`.`avaliacao` AS `avaliacao`,`c`.`data_atualizacao` AS `data_atualizacao`,`c`.`id_idioma` AS `id_idioma`,`i`.`nome` AS `idioma_original`,`cla`.`descricao` AS `classificacao`,`cat`.`nome` AS `categoria`,(select count(0) from `tb_catalogo_idioma` where (`tb_catalogo_idioma`.`id_catalogo` = `c`.`id_catalogo`)) AS `Quant_idioma_disponivel`,(case when (`c`.`tipo_midia` = 'F') then 'Filme' when (`c`.`tipo_midia` = 'S') then 'Serie' else 'N/A' end) AS `Tipo_catalogo` from ((((`tb_catalogo` `c` left join `tb_idioma` `i` on((`i`.`id_idioma` = `c`.`id_idioma`))) left join `tb_classificacao` `cla` on((`cla`.`id_classificacao` = `c`.`id_classificacao`))) left join `tb_catalogo_categoria` `cc` on((`cc`.`id_catalogo` = `c`.`id_catalogo`))) left join `tb_categoria` `cat` on((`cat`.`id_categoria` = `cc`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_episodio`
--

/*!50001 DROP VIEW IF EXISTS `vw_episodio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_episodio` AS select `c`.`titulo` AS `nome_serie`,`t`.`numero_temporada` AS `numero_temporada`,`t`.`titulo` AS `nome_temporada`,`t`.`quantidade_episodio` AS `quantidade_episodio`,`e`.`numero_episodio` AS `numero_episodio` from ((`tb_catalogo` `c` join `tb_episodio` `e` on((`e`.`id_catalogo` = `c`.`id_catalogo`))) left join `tb_temporada` `t` on((`t`.`id_temporada` = `e`.`id_temporada`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pagamento`
--

/*!50001 DROP VIEW IF EXISTS `vw_pagamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pagamento` AS select `p`.`id_pagamento` AS `id_pagamento`,`p`.`valor` AS `valor`,`p`.`data_pagamento` AS `data_pagamento`,`p`.`id_cartao` AS `id_cartao`,`c`.`id_plano` AS `id_plano`,`u`.`nome` AS `nome_cliente`,`tp`.`nome` AS `tipo_pagamento`,`pl`.`descricao` AS `nome_plano`,`c`.`data_vencimento_plano` AS `data_vencimento_plano` from ((((`tb_pagamento` `p` left join `tb_tipo_pagamento` `tp` on((`tp`.`id_tipo_pagamento` = `p`.`id_tipo_pagamento`))) left join `tb_cliente` `c` on((`p`.`id_cliente` = `c`.`id_cliente`))) left join `tb_usuario` `u` on((`u`.`id_usuario` = `c`.`id_usuario`))) left join `tb_plano` `pl` on((`pl`.`id_plano` = `c`.`id_plano`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_perfil`
--

/*!50001 DROP VIEW IF EXISTS `vw_perfil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_perfil` AS select `p`.`foto` AS `foto_perfil`,`p`.`nome` AS `nome_perfil`,`p`.`tipo` AS `tipo_perfil`,`u`.`nome` AS `nome_cliente`,`c`.`id_usuario` AS `id_usuario`,`c`.`id_cartao` AS `id_cartao`,`c`.`id_plano` AS `id_plano`,`c`.`data_vencimento_plano` AS `data_vencimento_plano` from ((`tb_perfil` `p` join `tb_cliente` `c` on((`p`.`id_cliente` = `c`.`id_cliente`))) left join `tb_usuario` `u` on((`u`.`id_usuario` = `c`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_temporada`
--

/*!50001 DROP VIEW IF EXISTS `vw_temporada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_temporada` AS select `t`.`numero_temporada` AS `numero_temporada`,`t`.`titulo` AS `nome_temporada`,`t`.`descricao` AS `descricao`,`t`.`quantidade_episodio` AS `quantidade_episodio`,`c`.`titulo` AS `nome_serie` from (((`tb_catalogo` `c` join `tb_episodio` `e` on((`e`.`id_catalogo` = `c`.`id_catalogo`))) left join `tb_temporada` `t` on((`t`.`id_temporada` = `e`.`id_temporada`))) left join `tb_serie` `s` on((`s`.`id_serie` = `t`.`id_serie`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`udanielarthur`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuario` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nome` AS `nome`,`u`.`data_atualizacao` AS `data_atualizacao`,`u`.`sobrenome` AS `sobrenome`,`u`.`email` AS `email`,`u`.`status` AS `status`,`u`.`data_nascimento` AS `data_nascimento`,`u`.`data_cadastro` AS `data_cadastro`,concat(`e`.`rua`,', ',`e`.`bairro`,', ',`e`.`quadra`,', ',`e`.`numero`) AS `endereco`,`e`.`cep` AS `cep`,`p`.`nome` AS `nome_pais`,`pl`.`descricao` AS `descricao`,(case when (`f`.`id_funcionario` is not null) then 'Funcionário' when (`c`.`id_cliente` is not null) then 'Cliente' else 'N/A' end) AS `tipo_usuario`,(select count(0) from `tb_perfil` where (`tb_perfil`.`id_cliente` = `c`.`id_cliente`)) AS `qtd_perfis` from (((((`tb_usuario` `u` left join `tb_funcionario` `f` on((`f`.`id_usuario` = `u`.`id_usuario`))) left join `tb_cliente` `c` on((`c`.`id_usuario` = `u`.`id_usuario`))) left join `tb_endereco` `e` on((`e`.`id_endereco` = `u`.`id_endereco`))) left join `tb_pais` `p` on((`p`.`id_pais` = `e`.`id_pais`))) left join `tb_plano` `pl` on((`pl`.`id_plano` = `c`.`id_plano`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-22  3:29:34
