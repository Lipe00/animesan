-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Set-2022 às 16:10
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `animesan_beta`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `idAdmin` int(11) NOT NULL,
  `id_user_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`idAdmin`, `id_user_FK`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `animes`
--

CREATE TABLE `animes` (
  `idAnime` int(11) NOT NULL,
  `nomeAnime` varchar(80) NOT NULL,
  `sinopseAnime` varchar(2000) NOT NULL,
  `gen1_FK` int(11) NOT NULL,
  `gen2_FK` int(11) DEFAULT NULL,
  `gen3_FK` int(11) DEFAULT NULL,
  `gen4_FK` int(11) DEFAULT NULL,
  `gen5_FK` int(11) DEFAULT NULL,
  `avaliacaoAnime` int(10) NOT NULL,
  `favoritosAnime` int(10) NOT NULL,
  `estudioAnime` varchar(50) NOT NULL,
  `produtorAnime` varchar(50) NOT NULL,
  `imagemAnime` varchar(500) NOT NULL,
  `pathImgAnime` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `animes`
--

INSERT INTO `animes` (`idAnime`, `nomeAnime`, `sinopseAnime`, `gen1_FK`, `gen2_FK`, `gen3_FK`, `gen4_FK`, `gen5_FK`, `avaliacaoAnime`, `favoritosAnime`, `estudioAnime`, `produtorAnime`, `imagemAnime`, `pathImgAnime`) VALUES
(4, 'Teste', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 2, 15, 6, 7, 11, 0, 0, 'Sunlight', 'abc', '', ''),
(5, 'abcde', 'aaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsdsaaaaaaaaaaaaaaascsds', 6, 3, 7, 10, 19, 0, 0, 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaascsds', 'c8d96286c058559dce22b291c3da50fdfab72dca83888763a5a602c6070df34aTokyoRevengers.jpg', './img/bd img/anime/c8d96286c058559dce22b291c3da50fdfab72dca83888763a5a602c6070df34aTokyoRevengers.jpg'),
(6, 'aaaaaaaaaaaaaaaaaaaabbbbbbbbbb', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 20, 9, 13, 1, 1, 0, 0, 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaa', '3ddf5c67b2fd6ccd073e840f18f7e484a875555f0732481acdb706e51876a61dMobPsycho.jpg', './img/bd img/anime/3ddf5c67b2fd6ccd073e840f18f7e484a875555f0732481acdb706e51876a61dMobPsycho.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL,
  `id_user_FK` int(11) NOT NULL,
  `id_anime_FK` int(11) NOT NULL,
  `textoComentario` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncias`
--

CREATE TABLE `denuncias` (
  `idDenuncia` int(11) NOT NULL,
  `categoriaDenuncia` int(11) NOT NULL,
  `textoDenuncia` varchar(200) NOT NULL,
  `id_denunciante_FK` int(11) NOT NULL,
  `id_denunciado_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `idFavoritos` int(11) NOT NULL,
  `id_Anime_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL,
  `nomeGenero` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`idGenero`, `nomeGenero`) VALUES
(1, '-----'),
(2, 'Aventura'),
(3, 'Ação'),
(4, 'Comédia'),
(5, 'Drama'),
(6, 'Ecchi'),
(7, 'Escolar'),
(8, 'Esporte'),
(9, 'Fantasia'),
(10, 'Ficção'),
(11, 'Harém'),
(12, 'Histórico'),
(13, 'Jogo'),
(14, 'Josei'),
(15, 'Magia'),
(16, 'Mecha'),
(17, 'Militar'),
(18, 'Mistério'),
(19, 'OVA'),
(20, 'Poderes'),
(21, 'Psicológico'),
(22, 'Romance'),
(23, 'Sci-fi'),
(24, 'Seinen'),
(25, 'Shoujo'),
(26, 'Shounen'),
(27, 'Slice of Life'),
(28, 'Sobrenatural'),
(29, 'Suspense'),
(30, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `nomeUser` varchar(80) NOT NULL,
  `emailUser` varchar(245) NOT NULL,
  `senhaUser` varchar(255) NOT NULL,
  `fotoUser` varchar(500) NOT NULL,
  `bannerUser` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `nomeUser`, `emailUser`, `senhaUser`, `fotoUser`, `bannerUser`) VALUES
(1, 'conta132223as', 'conta13@gmail.com', '$2y$10$sS7YLOClSEeLEZ54Cj52q.Rsq7jLbd2r/Uz.aLtsgK1j.6YzkONVi', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD KEY `admin_ibfk_1` (`id_user_FK`);

--
-- Índices para tabela `animes`
--
ALTER TABLE `animes`
  ADD PRIMARY KEY (`idAnime`),
  ADD KEY `genero1Anime` (`gen1_FK`,`gen2_FK`,`gen3_FK`,`gen4_FK`,`gen5_FK`),
  ADD KEY `genero2Anime` (`gen2_FK`),
  ADD KEY `genero3Anime` (`gen3_FK`),
  ADD KEY `genero4Anime` (`gen4_FK`),
  ADD KEY `genero5Anime` (`gen5_FK`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `comentarios_ibfk_1` (`id_anime_FK`),
  ADD KEY `comentarios_ibfk_2` (`id_user_FK`);

--
-- Índices para tabela `denuncias`
--
ALTER TABLE `denuncias`
  ADD PRIMARY KEY (`idDenuncia`),
  ADD KEY `denuncias_ibfk_1` (`id_denunciante_FK`),
  ADD KEY `denuncias_ibfk_2` (`id_denunciado_FK`);

--
-- Índices para tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`idFavoritos`),
  ADD KEY `id_Anime_FK` (`id_Anime_FK`,`id_User_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idGenero`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `animes`
--
ALTER TABLE `animes`
  MODIFY `idAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `idDenuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `idFavoritos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_user_FK`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `animes`
--
ALTER TABLE `animes`
  ADD CONSTRAINT `animes_ibfk_1` FOREIGN KEY (`gen1_FK`) REFERENCES `genero` (`idGenero`),
  ADD CONSTRAINT `animes_ibfk_2` FOREIGN KEY (`gen2_FK`) REFERENCES `genero` (`idGenero`),
  ADD CONSTRAINT `animes_ibfk_3` FOREIGN KEY (`gen3_FK`) REFERENCES `genero` (`idGenero`),
  ADD CONSTRAINT `animes_ibfk_4` FOREIGN KEY (`gen4_FK`) REFERENCES `genero` (`idGenero`),
  ADD CONSTRAINT `animes_ibfk_5` FOREIGN KEY (`gen5_FK`) REFERENCES `genero` (`idGenero`);

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_anime_FK`) REFERENCES `animes` (`idAnime`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_user_FK`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `denuncias`
--
ALTER TABLE `denuncias`
  ADD CONSTRAINT `denuncias_ibfk_1` FOREIGN KEY (`id_denunciante_FK`) REFERENCES `usuario` (`idUser`),
  ADD CONSTRAINT `denuncias_ibfk_2` FOREIGN KEY (`id_denunciado_FK`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_Anime_FK`) REFERENCES `animes` (`idAnime`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
