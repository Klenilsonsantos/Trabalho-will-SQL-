-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para controle_de_animais_para_adocao
CREATE DATABASE IF NOT EXISTS `controle_de_animais_para_adocao` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `controle_de_animais_para_adocao`;

-- Copiando estrutura para tabela controle_de_animais_para_adocao.animais
CREATE TABLE IF NOT EXISTS `animais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `tipo_do_animal` varchar(50) DEFAULT NULL,
  `raca` varchar(50) DEFAULT NULL,
  `porte` varchar(50) DEFAULT NULL,
  `data_de_nascimento` date DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela controle_de_animais_para_adocao.animais: ~7 rows (aproximadamente)
INSERT INTO `animais` (`id`, `nome`, `tipo_do_animal`, `raca`, `porte`, `data_de_nascimento`, `sexo`) VALUES
	(13, 'bolacha', 'cachorro', 'poodle', 'pequeno', '2020-05-12', 'masc'),
	(14, 'osvaldo', 'gato', 'srd', 'pequeno', '2019-04-05', 'masc'),
	(15, 'bela', 'gato', 'srd', 'pequeno', '2022-11-22', 'fem'),
	(16, 'negao', 'cachorro', 'labrador', 'grande', '2010-05-10', 'masc'),
	(17, 'fenix', 'gato', 'siames', 'pequeno', '2012-05-25', 'fem'),
	(18, 'gute', 'cachorro', 'pincher', 'pequeno', '2021-11-30', 'masc'),
	(19, 'caramelo', 'cachorro', 'srd', 'grande', '2018-08-11', 'masc');

-- Copiando estrutura para tabela controle_de_animais_para_adocao.animais_disponiveis
CREATE TABLE IF NOT EXISTS `animais_disponiveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_animaisdisp` int(11) DEFAULT NULL,
  `cachorros` int(100) DEFAULT NULL,
  `gatos` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_animaisdisp` (`id_animaisdisp`),
  CONSTRAINT `FK_animais_disponiveis_animais` FOREIGN KEY (`id_animaisdisp`) REFERENCES `animais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela controle_de_animais_para_adocao.animais_disponiveis: ~7 rows (aproximadamente)
INSERT INTO `animais_disponiveis` (`id`, `id_animaisdisp`, `cachorros`, `gatos`) VALUES
	(1, 15, 0, 1),
	(2, 13, 1, NULL),
	(3, 17, NULL, 1),
	(4, 18, 1, NULL),
	(5, 16, 1, NULL),
	(6, 14, 1, NULL),
	(7, 19, 1, NULL);

-- Copiando estrutura para tabela controle_de_animais_para_adocao.tutores
CREATE TABLE IF NOT EXISTS `tutores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tutores` int(11) DEFAULT NULL,
  `nome_completo` varchar(50) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `id_tutores` (`id_tutores`),
  CONSTRAINT `FK_tutores_animais` FOREIGN KEY (`id_tutores`) REFERENCES `animais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela controle_de_animais_para_adocao.tutores: ~4 rows (aproximadamente)
INSERT INTO `tutores` (`id`, `id_tutores`, `nome_completo`, `cpf`, `telefone`, `endereco`) VALUES
	(1, 14, 'Rafael Ricardo', 2147483647, 2147483647, 'Rua Dos Cedros,100'),
	(2, 16, 'Klenilson', 2145789635, 2147483647, 'Rua Das flores Vivas,200'),
	(3, 15, 'Maria', 214589635, 665698478, 'Rua Dos Cajueiros200'),
	(5, 18, 'Michelle', 1547896398, 2147483647, 'Rua Florenca 152');

-- Copiando estrutura para tabela controle_de_animais_para_adocao.vacinas
CREATE TABLE IF NOT EXISTS `vacinas` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `id_vacina` int(50) DEFAULT NULL,
  `nome_vacina` varchar(50) DEFAULT NULL,
  `data_de_vacinacao` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_vacina` (`id_vacina`),
  CONSTRAINT `FK_vacinas_animais` FOREIGN KEY (`id_vacina`) REFERENCES `animais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela controle_de_animais_para_adocao.vacinas: ~4 rows (aproximadamente)
INSERT INTO `vacinas` (`id`, `id_vacina`, `nome_vacina`, `data_de_vacinacao`) VALUES
	(1, 15, 'antirrabica', '2022-11-22'),
	(2, 15, 'fiv', '2022-11-22'),
	(3, 16, 'tetano', '2022-05-12'),
	(4, 17, 'fiv', '2022-11-22');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
