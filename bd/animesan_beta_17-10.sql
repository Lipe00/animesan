-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2022 às 02:55
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `animesan_beta`;
CREATE DATABASE `animesan_beta`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE `animesan_beta`;


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
(1, 1),
(2, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `animes`
--

CREATE TABLE `animes` (
  `idAnime` int(11) NOT NULL,
  `nomeAnime` varchar(80) NOT NULL,
  `sinopseAnime` varchar(2000) NOT NULL,
  `anoAnime` int(11) NOT NULL,
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
  `pathImgAnime` varchar(500) NOT NULL,
  `bannerAnime` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `animes`
--

INSERT INTO `animes` (`idAnime`, `nomeAnime`, `sinopseAnime`, `anoAnime`, `gen1_FK`, `gen2_FK`, `gen3_FK`, `gen4_FK`, `gen5_FK`, `avaliacaoAnime`, `favoritosAnime`, `estudioAnime`, `produtorAnime`, `imagemAnime`, `pathImgAnime`, `bannerAnime`) VALUES
(1, 'Fumetsu no anata e', 'Essa obra &eacute; protagonizada por uma entidade misteriosa que o telespectador acompanha por diversas eras e formas. Embora estas primeiras palavras possam parecer estranhas, esta est&oacute;ria cativa e emociona grande de seu p&uacute;blico. Fushi, intrigante protagonista cuja jornada testemunhamos, desenvolve seus primeiros sentimentos no decorrer de sua aventura, a qual &eacute; assinalada por momentos marcantes e dolorosos em demasia. E &eacute; este sofrimento que molda sua maturidade.', 0, 2, 5, 28, 1, 1, 0, 0, 'Brain&#039;s Base', 'NHK e Kodansha', '900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg', './img/bd img/anime/900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg', ''),
(2, 'Assassination Classroom', 'A est&oacute;ria gira em torno de uma turma lecionada por um professor extraterrestre extremamente talentoso e multifacetado. Por conta de um plano de defesa mundial, a sala &eacute; diariamente treinada para matar seu pr&oacute;prio professor.', 0, 7, 3, 4, 1, 1, 0, 0, 'Lerche', 'Dentsu, Studio Hibari, Fuji TV, DAX Production, BS', '32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg', './img/bd img/anime/32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg', ''),
(3, 'Jibaku Shounen Hanako-kun', 'Essa obra materializa-se no Col&eacute;gio Kamome, um local assombrado por mist&eacute;rios escolares que apenas poucos alunos veem. Um destes alunos &eacute; uma das personagens principais da obra, Yashiro Nene, que conhece Hanako-san, a entidade misteriosa que d&aacute; nome &agrave; est&oacute;ria. Embora o visual da est&oacute;ria deixe uma impress&atilde;o leve para que depara com ela inicialmente, o enredo de Hanako-kun se desenvolve em uma sucess&atilde;o de situa&ccedil;&otilde;es cabisbaixas e reflexivas.', 0, 4, 7, 28, 1, 1, 0, 0, 'Lerche', 'Square Enix, Studio Hibari, Pony Canyon, TBS, Half', '4589e361b6750e28d3a731920ff71c99hanako-kun.jpg', './img/bd img/anime/4589e361b6750e28d3a731920ff71c99hanako-kun.jpg', ''),
(4, 'Mob Psycho 100', 'Vivendo em uma realidade onde algumas pessoas nascem com poderes paranormais, Mob, um jovem com dificuldades para expressar seus sentimentos e suprimir seus poderes ps&iacute;quicos tenta viver uma vida de estudante comum, embora exorcize esp&iacute;ritos malignos em suas horas vagas junto ao seu mestre Arataka Reigen.', 0, 3, 4, 28, 1, 1, 0, 0, 'Bones', 'Warner Bros. Japan, KlockWorx, BS Fuji, Hakuhodo D', '61deecd60f88dcf827e50097e145cc68MobPsycho.jpg', './img/bd img/anime/61deecd60f88dcf827e50097e145cc68MobPsycho.jpg', ''),
(5, 'Howl no Ugoku Shiro', 'Sophie, filha de um chapeleiro comum, vive sem esperar muito de seu futuro e se contenta a monotonia de trabalhar e reprimir seus desejos. Um dia ela &eacute; visitada por uma feiticeira que a amaldi&ccedil;oa, transformando-a em uma velha de 90 anos. A fim de se livrar dessa maldi&ccedil;&atilde;o, Sophie vai em busca de um castelo andante, onde habita um feiticeiro misterioso que tem o poder de reverter o feiti&ccedil;o.', 0, 2, 5, 9, 22, 1, 0, 0, 'Ghibli', 'd-rights , Tokuma Shoten', '768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg', './img/bd img/anime/768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg', ''),
(6, 'Death Note', 'Nosso protagonista &eacute; Light Yagami, um jovem universit&aacute;rio idealista, com grandes ambi&ccedil;&otilde;es de justi&ccedil;a. Certo dia, Light encontra o misterioso &ldquo;Death Note&rdquo;, um caderno com poderes sobrenaturais. Conveniente aos desejos do protagonista, o Death Note concedeu a ele poder sobre a morte de qualquer um cujo nome fosse escrito no caderno, possibilitando sua grande jornada para tornar-se um deus da justi&ccedil;a.', 0, 28, 29, 20, 1, 1, 0, 0, 'Madhouse', 'VAP, Konami, Ashi Productions, Nippon Television N', '7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg', './img/bd img/anime/7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg', ''),
(7, 'Hotaru no Haka', 'Essa est&oacute;ria ambientada no per&iacute;odo em que o Jap&atilde;o foi derrotado pelos os Estados Unidos. Ela &eacute; protagonizada por uma dupla irm&atilde;os rec&eacute;m-&oacute;rf&atilde;os pela guerra, que tentam sobreviver em uma na&ccedil;&atilde;o assolada pelos horrores da Segunda Guerra Mundial. A obra possui car&aacute;ter s&eacute;rio e apresenta a perspectiva de um adolescente japon&ecirc;s educado sob uma doutrina pr&eacute;-guerra sobre a rendi&ccedil;&atilde;o incondicional do Jap&atilde;o em 1945.', 0, 5, 12, 17, 1, 1, 0, 0, 'Ghibli', 'Ghibli', '9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg', './img/bd img/anime/9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg', ''),
(8, 'Tokyo Revengers', 'Hanagaki Takemichi, aos 26 anos, descobre que seu primeiro amor, Tachibana Hinata, foi assassinada em um conflito de gangues. Em um dia qualquer, voltando de seu trabalho, ele &eacute; empurrado na trilha do metr&ocirc; e volta no tempo. Agora, como um viajante do tempo, Takemichi est&aacute; convicto de mudar o passado e manter Hinata viva no futuro.', 0, 3, 5, 28, 1, 1, 0, 0, 'LIDENFILMS', 'Mainichi Broadcasting System, Pony Canyon, Kodansh', '34961ee090553520ea29a99ef3bfa7aaTokyoRevengers.jpg', './img/bd img/anime/34961ee090553520ea29a99ef3bfa7aaTokyoRevengers.jpg', '../img/bd img/anime/banner/tokyo_revengers.png'),
(9, 'Chainsaw Man', 'Denji &eacute; um jovem &oacute;rf&atilde;o e pobre, que herdou uma enorme d&iacute;vida de seu pai com a Yakuza e para paga-la, ele junto de seu parceiro Pochita, um c&atilde;o-dem&ocirc;nio motosserra, realizam servi&ccedil;os &agrave; famosa m&aacute;fia japonesa. Denji &eacute; um garoto carente de desejos simples: um sandu&iacute;che de manteiga de amendoim; uma namorada para ama-lo; seios para apalpar. No entanto, a Yakuza traiu-o e assassinou-o cruelmente. Pochita, a fim de salvar seu fiel amigo, se funde ao seu cad&aacute;ver e o proporciona-lhe uma nova vida, sendo ele agora o &ldquo;Chainsaw Man&rdquo;.', 0, 3, 28, 1, 1, 1, 0, 0, 'MAPPA', 'Shueisha', '07f5d0bd0b821c1c1f62a0294287469bChainsawMan.png', './img/bd img/anime/07f5d0bd0b821c1c1f62a0294287469bChainsawMan.png', '../img/bd img/anime/banner/chainsaw_man.png'),
(10, 'Tokyo Ghoul', 'Neste mundo, a cidade de T&oacute;quio &eacute; habitada por criaturas que devoram carne humana, os Ghouls. Em meio a essa realidade, Kaneki Ken, um jovem universit&aacute;rio, encontra-se com a misteriosa Kamishiro Rize, que acaba se revelando como uma dessas criaturas, deixando-o gravemente ferido. Para salva-lo, os m&eacute;dicos transplantam os &oacute;rg&atilde;os da Rize para Kaneki, o transformando-o num meio ghoul. Agora, Kaneki Ken tem que decidir qual lado quer permanecer: humanos ou ghouls.', 0, 21, 30, 28, 1, 1, 0, 0, 'Pierrot', 'Marvelous AQL, TC Entertainment, Shueisha', '0248e9c0d2a0158946aacc21e6109f07TokyoGhoul.jpg', './img/bd img/anime/0248e9c0d2a0158946aacc21e6109f07TokyoGhoul.jpg', '../img/bd img/anime/banner/tokyo_ghoul.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `idAvaliacao` int(11) NOT NULL,
  `id_Anime_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL,
  `likesAvaliacao` int(11) NOT NULL,
  `notaAvaliacao` int(11) NOT NULL,
  `textoComentario` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `avaliacao`
--



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
  `idFav` int(11) NOT NULL,
  `id_Anime_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `favoritos`
--


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
-- Estrutura da tabela `ranking`
--

CREATE TABLE `ranking` (
  `idRanking` int(11) NOT NULL,
  `id_Anime_FK` int(11) NOT NULL,
  `avaMediaAnime` decimal(8,2) NOT NULL,
  `favAnime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ranking`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta`
--

CREATE TABLE `resposta` (
  `idResp` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL,
  `id_Avaliacao_FK` int(11) NOT NULL,
  `likesResp` int(11) NOT NULL,
  `textoResp` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, '1conta12a', 'conta13@gmail.com', '$2y$10$sS7YLOClSEeLEZ54Cj52q.Rsq7jLbd2r/Uz.aLtsgK1j.6YzkONVi', './img/bd img/user/foto/1conta12a_fushiguro.jpg', './img/bd img/user/banner/1conta12a_660691.jpg'),
(2, 'conta1', 'conta1@gmail.com', '$2y$10$l0FXgbHiFsZG2h0vdM0NkOK.e.Nf8fhuV81ua6ZwOG9sp7iQNjrRS', './img/bd img/user/foto/conta1_douma_oni.jpg', './img/bd img/user/banner/conta1_wallpaperflare.com_temple.jpg'),
(3, 'MaylonWolf', 'britojeremias1@gmail.com', '$2y$10$Y/gU4M0gFQaa8qhZZp.AROHUrr/lg02.jmbWiFwHXclfZ2FqqO5TG', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(4, 'Doggoshikage_Kira', 'doggoshikagekira@gmail.com', '$2y$10$zfkKF1CdoLBOAi.YhEaWeO5HwtOheDEMFW/SRHPs.t8Z43nbi/oP.', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(5, 'Lyzaran', 'diogodesouzap.barbosa@gmail.com', '$2y$10$gTZ1NyiMYsoCVmRW05FQRO1V2dw0Tb3YBjaFf0Ux3UlJ3WfM.q5ZO', './img/bd img/user/foto/Lyzaran_504f33e3094b3f0d98287ed7b91b9e49.jpg', './img/bd img/user/banner/_semfoto.jpg');

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
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`idAvaliacao`),
  ADD KEY `avaliacao_ibfk_1` (`id_Anime_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

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
  ADD PRIMARY KEY (`idFav`),
  ADD KEY `id_Anime_FK` (`id_Anime_FK`,`id_User_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

--
-- Índices para tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idGenero`);

--
-- Índices para tabela `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`idRanking`),
  ADD KEY `ranking_ibfk_1` (`id_Anime_FK`);

--
-- Índices para tabela `resposta`
--
ALTER TABLE `resposta`
  ADD PRIMARY KEY (`idResp`),
  ADD KEY `id_Anime_FK` (`id_User_FK`,`id_Avaliacao_FK`),
  ADD KEY `id_Avaliacao_FK` (`id_Avaliacao_FK`);

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
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `animes`
--
ALTER TABLE `animes`
  MODIFY `idAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de tabela `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `idDenuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `idFav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `ranking`
--
ALTER TABLE `ranking`
  MODIFY `idRanking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT de tabela `resposta`
--
ALTER TABLE `resposta`
  MODIFY `idResp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_Anime_FK`) REFERENCES `animes` (`idAnime`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`);

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

--
-- Limitadores para a tabela `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_Anime_FK`) REFERENCES `animes` (`idAnime`);

--
-- Limitadores para a tabela `resposta`
--
ALTER TABLE `resposta`
  ADD CONSTRAINT `resposta_ibfk_1` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`),
  ADD CONSTRAINT `resposta_ibfk_2` FOREIGN KEY (`id_Avaliacao_FK`) REFERENCES `avaliacao` (`idAvaliacao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
