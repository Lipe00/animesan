SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `animesan_beta`;
CREATE DATABASE `animesan_beta`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE `animesan_beta`;

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
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `avaliacao` (
  `idAvaliacao` int(11) NOT NULL,
  `id_Anime_FK` int(11) NOT NULL,
  `notaAvaliacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `favoritos`
--

INSERT INTO `avaliacao` (`idAvaliacao`, `id_Anime_FK`, `notaAvaliacao`) VALUES
(1, 9, 5),
(2, 9, 3);

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
(9, 'Fumetsu no anata e', 'Essa obra &eacute; protagonizada por uma entidade misteriosa que o telespectador acompanha por diversas eras e formas. Embora estas primeiras palavras possam parecer estranhas, esta est&oacute;ria cativa e emociona grande de seu p&uacute;blico. Fushi, intrigante protagonista cuja jornada testemunhamos, desenvolve seus primeiros sentimentos no decorrer de sua aventura, a qual &eacute; assinalada por momentos marcantes e dolorosos em demasia. E &eacute; este sofrimento que molda sua maturidade.', 2, 5, 28, 1, 1, 0, 0, 'Brain&#039;s Base', 'NHK e Kodansha', '900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg', './img/bd img/anime/900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg'),
(10, 'Assassination Classroom', 'A est&oacute;ria gira em torno de uma turma lecionada por um professor extraterrestre extremamente talentoso e multifacetado. Por conta de um plano de defesa mundial, a sala &eacute; diariamente treinada para matar seu pr&oacute;prio professor.', 7, 3, 4, 1, 1, 0, 0, 'Lerche', 'Dentsu, Studio Hibari, Fuji TV, DAX Production, BS', '32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg', './img/bd img/anime/32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg'),
(11, 'Jibaku Shounen Hanako-kun', 'Essa obra materializa-se no Col&eacute;gio Kamome, um local assombrado por mist&eacute;rios escolares que apenas poucos alunos veem. Um destes alunos &eacute; uma das personagens principais da obra, Yashiro Nene, que conhece Hanako-san, a entidade misteriosa que d&aacute; nome &agrave; est&oacute;ria. Embora o visual da est&oacute;ria deixe uma impress&atilde;o leve para que depara com ela inicialmente, o enredo de Hanako-kun se desenvolve em uma sucess&atilde;o de situa&ccedil;&otilde;es cabisbaixas e reflexivas.', 4, 7, 28, 1, 1, 0, 0, 'Lerche', 'Square Enix, Studio Hibari, Pony Canyon, TBS, Half', '4589e361b6750e28d3a731920ff71c99hanako-kun.jpg', './img/bd img/anime/4589e361b6750e28d3a731920ff71c99hanako-kun.jpg'),
(12, 'Mob Psycho 100', 'Vivendo em uma realidade onde algumas pessoas nascem com poderes paranormais, Mob, um jovem com dificuldades para expressar seus sentimentos e suprimir seus poderes ps&iacute;quicos tenta viver uma vida de estudante comum, embora exorcize esp&iacute;ritos malignos em suas horas vagas junto ao seu mestre Arataka Reigen.', 3, 4, 28, 1, 1, 0, 0, 'Bones', 'Warner Bros. Japan, KlockWorx, BS Fuji, Hakuhodo D', '61deecd60f88dcf827e50097e145cc68MobPsycho.jpg', './img/bd img/anime/61deecd60f88dcf827e50097e145cc68MobPsycho.jpg'),
(13, 'Howl no Ugoku Shiro', 'Sophie, filha de um chapeleiro comum, vive sem esperar muito de seu futuro e se contenta a monotonia de trabalhar e reprimir seus desejos. Um dia ela &eacute; visitada por uma feiticeira que a amaldi&ccedil;oa, transformando-a em uma velha de 90 anos. A fim de se livrar dessa maldi&ccedil;&atilde;o, Sophie vai em busca de um castelo andante, onde habita um feiticeiro misterioso que tem o poder de reverter o feiti&ccedil;o.', 2, 5, 9, 22, 1, 0, 0, 'Ghibli', 'd-rights , Tokuma Shoten', '768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg', './img/bd img/anime/768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg'),
(14, 'Death Note', 'Nosso protagonista &eacute; Light Yagami, um jovem universit&aacute;rio idealista, com grandes ambi&ccedil;&otilde;es de justi&ccedil;a. Certo dia, Light encontra o misterioso &ldquo;Death Note&rdquo;, um caderno com poderes sobrenaturais. Conveniente aos desejos do protagonista, o Death Note concedeu a ele poder sobre a morte de qualquer um cujo nome fosse escrito no caderno, possibilitando sua grande jornada para tornar-se um deus da justi&ccedil;a.', 28, 29, 20, 1, 1, 0, 0, 'Madhouse', 'VAP, Konami, Ashi Productions, Nippon Television N', '7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg', './img/bd img/anime/7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg'),
(15, 'Hotaru no Haka', 'Essa est&oacute;ria ambientada no per&iacute;odo em que o Jap&atilde;o foi derrotado pelos os Estados Unidos. Ela &eacute; protagonizada por uma dupla irm&atilde;os rec&eacute;m-&oacute;rf&atilde;os pela guerra, que tentam sobreviver em uma na&ccedil;&atilde;o assolada pelos horrores da Segunda Guerra Mundial. A obra possui car&aacute;ter s&eacute;rio e apresenta a perspectiva de um adolescente japon&ecirc;s educado sob uma doutrina pr&eacute;-guerra sobre a rendi&ccedil;&atilde;o incondicional do Jap&atilde;o em 1945.', 5, 12, 17, 1, 1, 0, 0, 'Ghibli', 'Ghibli', '9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg', './img/bd img/anime/9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg');

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

--
-- Extraindo dados da tabela `denuncias`
--


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

INSERT INTO `favoritos` (`idFav`, `id_Anime_FK`, `id_User_FK`) VALUES
(3, 9, 1),
(4, 9, 3);

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
(1, '1conta12a', 'conta13@gmail.com', '$2y$10$sS7YLOClSEeLEZ54Cj52q.Rsq7jLbd2r/Uz.aLtsgK1j.6YzkONVi', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(2, 'conta1', 'conta1@gmail.com', '$2y$10$l0FXgbHiFsZG2h0vdM0NkOK.e.Nf8fhuV81ua6ZwOG9sp7iQNjrRS', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(3, 'MaylonWolf', 'britojeremias1@gmail.com', '$2y$10$Y/gU4M0gFQaa8qhZZp.AROHUrr/lg02.jmbWiFwHXclfZ2FqqO5TG', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(4, 'Doggoshikage_Kira', 'doggoshikagekira@gmail.com', '$2y$10$zfkKF1CdoLBOAi.YhEaWeO5HwtOheDEMFW/SRHPs.t8Z43nbi/oP.', './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg');


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
-- Índices para tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`idAvaliacao`),
  ADD KEY `avaliacao_ibfk_1` (`id_Anime_FK`);

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
  ADD PRIMARY KEY (`idFav`),
  ADD KEY `id_Anime_FK` (`id_Anime_FK`,`id_User_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

--
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
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `animes`
--
ALTER TABLE `animes`
  MODIFY `idAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `idFav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_user_FK`) REFERENCES `usuario` (`idUser`);
--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_Anime_FK`) REFERENCES `animes` (`idAnime`);

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
COMMIT;
--
-- Limitadores para a tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_Anime_FK`) REFERENCES `animes` (`idAnime`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`);
COMMIT;

