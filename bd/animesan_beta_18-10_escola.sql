-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2022 às 22:52
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6
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
  `avaliacaoAnime` decimal(8,2) NOT NULL,
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
(1, 'Fumetsu no anata e', 'Essa obra &eacute; protagonizada por uma entidade misteriosa que o telespectador acompanha por diversas eras e formas. Embora estas primeiras palavras possam parecer estranhas, esta est&oacute;ria cativa e emociona grande de seu p&uacute;blico. Fushi, intrigante protagonista cuja jornada testemunhamos, desenvolve seus primeiros sentimentos no decorrer de sua aventura, a qual &eacute; assinalada por momentos marcantes e dolorosos em demasia. E &eacute; este sofrimento que molda sua maturidade.', 0, 2, 5, 28, 1, 1, '0.00', 0, 'Brain&#039;s Base', 'NHK e Kodansha', '900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg', './img/bd img/anime/900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg', ''),
(2, 'Assassination Classroom', 'A est&oacute;ria gira em torno de uma turma lecionada por um professor extraterrestre extremamente talentoso e multifacetado. Por conta de um plano de defesa mundial, a sala &eacute; diariamente treinada para matar seu pr&oacute;prio professor.', 0, 7, 3, 4, 1, 1, '0.00', 0, 'Lerche', 'Dentsu, Studio Hibari, Fuji TV, DAX Production, BS', '32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg', './img/bd img/anime/32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg', ''),
(3, 'Jibaku Shounen Hanako-kun', 'Essa obra materializa-se no Col&eacute;gio Kamome, um local assombrado por mist&eacute;rios escolares que apenas poucos alunos veem. Um destes alunos &eacute; uma das personagens principais da obra, Yashiro Nene, que conhece Hanako-san, a entidade misteriosa que d&aacute; nome &agrave; est&oacute;ria. Embora o visual da est&oacute;ria deixe uma impress&atilde;o leve para que depara com ela inicialmente, o enredo de Hanako-kun se desenvolve em uma sucess&atilde;o de situa&ccedil;&otilde;es cabisbaixas e reflexivas.', 0, 4, 7, 28, 1, 1, '0.00', 0, 'Lerche', 'Square Enix, Studio Hibari, Pony Canyon, TBS, Half', '4589e361b6750e28d3a731920ff71c99hanako-kun.jpg', './img/bd img/anime/4589e361b6750e28d3a731920ff71c99hanako-kun.jpg', ''),
(4, 'Mob Psycho 100', 'Vivendo em uma realidade onde algumas pessoas nascem com poderes paranormais, Mob, um jovem com dificuldades para expressar seus sentimentos e suprimir seus poderes ps&iacute;quicos tenta viver uma vida de estudante comum, embora exorcize esp&iacute;ritos malignos em suas horas vagas junto ao seu mestre Arataka Reigen.', 0, 3, 4, 28, 1, 1, '0.00', 0, 'Bones', 'Warner Bros. Japan, KlockWorx, BS Fuji, Hakuhodo D', '61deecd60f88dcf827e50097e145cc68MobPsycho.jpg', './img/bd img/anime/61deecd60f88dcf827e50097e145cc68MobPsycho.jpg', ''),
(5, 'Howl no Ugoku Shiro', 'Sophie, filha de um chapeleiro comum, vive sem esperar muito de seu futuro e se contenta a monotonia de trabalhar e reprimir seus desejos. Um dia ela &eacute; visitada por uma feiticeira que a amaldi&ccedil;oa, transformando-a em uma velha de 90 anos. A fim de se livrar dessa maldi&ccedil;&atilde;o, Sophie vai em busca de um castelo andante, onde habita um feiticeiro misterioso que tem o poder de reverter o feiti&ccedil;o.', 0, 2, 5, 9, 22, 1, '0.00', 0, 'Ghibli', 'd-rights , Tokuma Shoten', '768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg', './img/bd img/anime/768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg', ''),
(6, 'Death Note', 'Nosso protagonista &eacute; Light Yagami, um jovem universit&aacute;rio idealista, com grandes ambi&ccedil;&otilde;es de justi&ccedil;a. Certo dia, Light encontra o misterioso &ldquo;Death Note&rdquo;, um caderno com poderes sobrenaturais. Conveniente aos desejos do protagonista, o Death Note concedeu a ele poder sobre a morte de qualquer um cujo nome fosse escrito no caderno, possibilitando sua grande jornada para tornar-se um deus da justi&ccedil;a.', 0, 28, 29, 20, 1, 1, '0.00', 0, 'Madhouse', 'VAP, Konami, Ashi Productions, Nippon Television N', '7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg', './img/bd img/anime/7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg', ''),
(7, 'Hotaru no Haka', 'Essa est&oacute;ria ambientada no per&iacute;odo em que o Jap&atilde;o foi derrotado pelos os Estados Unidos. Ela &eacute; protagonizada por uma dupla irm&atilde;os rec&eacute;m-&oacute;rf&atilde;os pela guerra, que tentam sobreviver em uma na&ccedil;&atilde;o assolada pelos horrores da Segunda Guerra Mundial. A obra possui car&aacute;ter s&eacute;rio e apresenta a perspectiva de um adolescente japon&ecirc;s educado sob uma doutrina pr&eacute;-guerra sobre a rendi&ccedil;&atilde;o incondicional do Jap&atilde;o em 1945.', 0, 5, 12, 17, 1, 1, '0.00', 0, 'Ghibli', 'Ghibli', '9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg', './img/bd img/anime/9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg', ''),
(8, 'Tokyo Revengers', 'Hanagaki Takemichi, aos 26 anos, descobre que seu primeiro amor, Tachibana Hinata, foi assassinada em um conflito de gangues. Em um dia qualquer, voltando de seu trabalho, ele &eacute; empurrado na trilha do metr&ocirc; e volta no tempo. Agora, como um viajante do tempo, Takemichi est&aacute; convicto de mudar o passado e manter Hinata viva no futuro.', 0, 3, 5, 28, 1, 1, '0.00', 0, 'LIDENFILMS', 'Mainichi Broadcasting System, Pony Canyon, Kodansh', '34961ee090553520ea29a99ef3bfa7aaTokyoRevengers.jpg', './img/bd img/anime/34961ee090553520ea29a99ef3bfa7aaTokyoRevengers.jpg', '../img/bd img/anime/banner/tokyo_revengers.png'),
(9, 'Chainsaw Man', 'Denji &eacute; um jovem &oacute;rf&atilde;o e pobre, que herdou uma enorme d&iacute;vida de seu pai com a Yakuza e para paga-la, ele junto de seu parceiro Pochita, um c&atilde;o-dem&ocirc;nio motosserra, realizam servi&ccedil;os &agrave; famosa m&aacute;fia japonesa. Denji &eacute; um garoto carente de desejos simples: um sandu&iacute;che de manteiga de amendoim; uma namorada para ama-lo; seios para apalpar. No entanto, a Yakuza traiu-o e assassinou-o cruelmente. Pochita, a fim de salvar seu fiel amigo, se funde ao seu cad&aacute;ver e o proporciona-lhe uma nova vida, sendo ele agora o &ldquo;Chainsaw Man&rdquo;.', 0, 3, 28, 1, 1, 1, '0.00', 0, 'MAPPA', 'Shueisha', '07f5d0bd0b821c1c1f62a0294287469bChainsawMan.png', './img/bd img/anime/07f5d0bd0b821c1c1f62a0294287469bChainsawMan.png', '../img/bd img/anime/banner/chainsaw_man.png'),
(10, 'Tokyo Ghoul', 'Neste mundo, a cidade de T&oacute;quio &eacute; habitada por criaturas que devoram carne humana, os Ghouls. Em meio a essa realidade, Kaneki Ken, um jovem universit&aacute;rio, encontra-se com a misteriosa Kamishiro Rize, que acaba se revelando como uma dessas criaturas, deixando-o gravemente ferido. Para salva-lo, os m&eacute;dicos transplantam os &oacute;rg&atilde;os da Rize para Kaneki, o transformando-o num meio ghoul. Agora, Kaneki Ken tem que decidir qual lado quer permanecer: humanos ou ghouls.', 0, 21, 30, 28, 1, 1, '0.00', 0, 'Pierrot', 'Marvelous AQL, TC Entertainment, Shueisha', '0248e9c0d2a0158946aacc21e6109f07TokyoGhoul.jpg', './img/bd img/anime/0248e9c0d2a0158946aacc21e6109f07TokyoGhoul.jpg', '../img/bd img/anime/banner/tokyo_ghoul.png'),
(11, 'Dororo', 'Ambientada na era dos Estados Combatentes do Jap&atilde;o, Dororo &eacute; uma est&oacute;ria de aventura e suspense, trag&eacute;dia e horror &ndash; retrato dos horrores da &eacute;poca. O protagonista &eacute; Hyakkimaru, filho primog&ecirc;nito de Daigo Kagemitsu, o senhor feudal da prov&iacute;ncia de Kaga. Antes do nascimento do protagonista, seu pai realizou um pacto com for&ccedil;as diab&oacute;licas e ofereceu 48 partes do corpo de Hyakkimaru aos 48 dem&ocirc;nios, pedindo em troca a prosperidade de seus dom&iacute;nios feudais. O menino nasce fr&aacute;gil e sem partes importantes de seu corpo, e &eacute; logo descartado em um rio, de onde &eacute; resgatado por um curandeiro que lhe faz pr&oacute;teses e lhe salva a vida. O menino cresce sob o nome de Hyakkimaru e descobre a respeito de sua maldi&ccedil;&atilde;o: cada dem&ocirc;nio daqueles 48 que ele matar o trar&aacute; de volta uma parte de seu corpo, e logo sua humanidade roubada. Ele parte em sua jornada sobrenatural junto a Dororo, um menino ladr&atilde;o, por entre fantasmas e dem&ocirc;nios.', 2007, 3, 2, 12, 28, 1, '0.00', 0, 'Tezuka Productions, MAPPA', 'Twin Engine', 'b49d4085530554150034517bcf80c46fDororo.jpg', './img/bd img/anime/b49d4085530554150034517bcf80c46fDororo.jpg', '../img/bd img/anime/banner/dororo.png'),
(12, 'Jujutsu Kaisen', 'Maldi&ccedil;&otilde;es s&atilde;o energias amaldi&ccedil;oadas que tomam forma atrav&eacute;s do ac&uacute;mulo de emo&ccedil;&otilde;es humanas negativas. Itadori Yuuji &eacute; um estudante do ensino m&eacute;dio que mora com o av&ocirc;. Embora as grandes habilidades f&iacute;sicas, ele acaba entrando para o clube de ocultismo, onde ele e seus amigos encontram um objeto misterioso e retiram o selo que o envolvia, &ldquo;atraindo maldi&ccedil;&otilde;es&rdquo;. Com o desejo de viver uma vida sem arrependimentos, Itadori engole o &ldquo;item amaldi&ccedil;oado&rdquo; para salvar seus amigos, s&oacute; n&atilde;o esperava ser um dos dedos do rei das maldi&ccedil;&otilde;es, Ryomen Sukuna.', 2020, 3, 2, 9, 28, 1, '0.00', 0, 'MAPPA', 'Mainichi Broadcasting System, anima&ccedil;&atilde', 'a1c18af30b18f258db2581555c6f11b9JujutsuKaisen.jpg', './img/bd img/anime/a1c18af30b18f258db2581555c6f11b9JujutsuKaisen.jpg', '../img/bd img/anime/banner/jujutsu_kaisen.png'),
(13, 'Boku no Hero Academia', 'Com 80% da humanidade possuindo algum poder sobre-humano, Midoriya Izuku &eacute; um dos poucos humanos que nasceram sem qualquer individualidade (poder). Apesar do destino injusto, Deku, como &eacute; chamado, sempre teve o sonho de se tornar um super-her&oacute;i igual ao seu &iacute;dolo, All Might. Por&eacute;m, um inesperado momento acontece, e por sua coragem, herda os poderes de seu super-her&oacute;i n&uacute;mero um, que o levar&aacute; a ingressar na t&atilde;o sonhada academia de her&oacute;is, o col&eacute;gio U.A.', 2016, 3, 7, 20, 26, 1, '0.00', 0, 'Bones', 'Dentsu, Mainichi Broadcasting System, Movic, TOHO ', 'e71f5424b36c7bc52d58506fb763366aMyHeroAcademia.jpg', './img/bd img/anime/e71f5424b36c7bc52d58506fb763366aMyHeroAcademia.jpg', '../img/bd img/anime/banner/boku_no_hero_academia.png'),
(14, 'Noragami Aragoto', 'Yato &eacute; um deus menosprezado cujo seu sonho &eacute; ter um santu&aacute;rio e milhares de seguidores. Embora tenha esse sonho, o deus da calamidade n&atilde;o tem sequer um seguidor, e para conseguir construir seu santu&aacute;rio e ser lembrado pelas pessoas, Yato deixa seu n&uacute;mero rabiscado em vermelho pelos lugares oferendo servi&ccedil;os em troca de 5 yenes. Mas toda vida do deus muda quando ele &eacute; salvo de um acidente de carro por uma garota, que acaba se ligando a ele por um tempo indeterminado.', 2014, 3, 9, 28, 1, 1, '0.00', 0, 'Bones', 'Avex Entertainment, Dentsu, Shochiku, Kodansha, Mo', '279e6d517455ef5fe9543cef158e32e8NoragamiAragoto.jpg', './img/bd img/anime/279e6d517455ef5fe9543cef158e32e8NoragamiAragoto.jpg', '../img/bd img/anime/banner/noragami_aragoto.png'),
(15, 'One Punch Man', 'Saitama &eacute; um super-her&oacute;i que treinou durante v&aacute;rios anos para se tornar o mais forte, fazendo todos seus cabelos ca&iacute;rem. Infelizmente, ser o maior de todos acabou o entediando em suas lutas com a aus&ecirc;ncia de um oponente digno, passando apenas a viver a vida de her&oacute;i como um hobby. Certo dia, Saitama encontra Genos, um ciborgue de 19 anos que deseja ser seu disc&iacute;pulo. O jovem prop&otilde;e para que eles entrem na associa&ccedil;&atilde;o de her&oacute;is para que sejam reconhecidos, encaminhando ambos em uma nova jornada, embora o &uacute;nico desejo de Saitama &eacute; voltar a sentir a emo&ccedil;&atilde;o da batalha, e talvez, a fama pelos seus feitos.', 2017, 3, 4, 20, 1, 1, '0.00', 0, 'Madhouse', 'TV Tokyo, Bandai Visual, Lantis, Asatsu DK, Banpre', '2298311356b4d6690a3681b7cca18a6bOnePunchMan.jpg', './img/bd img/anime/2298311356b4d6690a3681b7cca18a6bOnePunchMan.jpg', '../img/bd img/anime/banner/one_punch_man.png'),
(16, 'Haikyuu!!', 'O &ldquo;pequeno gigante&rdquo; foi um habilidoso jogador de v&ocirc;lei, embora tivesse uma altura abaixo da m&eacute;dia no esporte. Shouyou Hinata fica fascinado quando o viu jogar pela primeira vez, ent&atilde;o decide se tornar um jogador de v&ocirc;lei, criando um clube de v&ocirc;lei na sua escola, por&eacute;m, ningu&eacute;m se junta a ele. Com o passar do tempo, Hinata finalmente monta uma equipe e participa de um campeonato, onde acaba perdendo para o time de Kageyama Tobio, o favorito da competi&ccedil;&atilde;o. Quando Shouyou se matricula na Karasuno, ele acredita estar perto de realizar seu sonho, at&eacute; descobrir que Kageyama Tobio, o jogador que o humilhou no passado, ser&aacute; seu companheiro de equipe.', 2014, 4, 7, 8, 1, 1, '0.00', 0, 'Production I.G', 'Dentsu, Mainichi Broadcasting System, Movic, TOHO ', '15afb75c1597fe7420d2054c61ef3d8bhaikyuu.png', './img/bd img/anime/15afb75c1597fe7420d2054c61ef3d8bhaikyuu.png', '../img/bd img/anime/banner/haikyuu!!.png'),
(17, 'Kimetsu no Yaiba', 'Desde a morte de seu pai, Kamado Tanjiro se torna o suporte de sua fam&iacute;lia, vendendo carv&atilde;o para ajudar com as despesas. Na volta do dia seguinte, ap&oacute;s pousar na casa de um homem desconhecido quando voltava da cidade, Tanjiro descobre que sua fam&iacute;lia foi massacrada por um dem&ocirc;nio, e a &uacute;nica sobrevivente, sua irm&atilde; Nezuko, se transforma em um dem&ocirc;nio. Buscando vingan&ccedil;a e a cura para sua irm&atilde;, Tanjiro se torna um ca&ccedil;ador.', 2019, 3, 12, 28, 1, 1, '0.00', 0, 'Ufotable', 'Aniplex, Shueisha', 'e38158ad008d9825206a7c9622b2b581KimetsuNoYaiba.jpg', './img/bd img/anime/e38158ad008d9825206a7c9622b2b581KimetsuNoYaiba.jpg', '../img/bd img/anime/banner/kimetsu_no_yaiba.png'),
(18, 'Hunter &times; Hunter', 'Hunters s&atilde;o ca&ccedil;adores de tesouros, que desbravam o continente em lugares perigosos, com criaturas estranhas e itens amaldi&ccedil;oados. O jovem Gon Freecs, de apenas 12 anos, tem o sonho de se tornar um Hunter para encontrar seu pai, um dos Hunters mais famosos do mundo. Mas essa tarefa n&atilde;o &eacute; f&aacute;cil, e para praticar essa profiss&atilde;o, Gon passa pelo exame Hunter, onde faz amizades com o estudante de medicina Leorio Paladiknight, o misterioso Kurapika e um jovem de sua idade, Killua Zoldyck, dando in&iacute;cio a sua jornada.', 1999, 3, 2, 9, 1, 1, '0.00', 0, 'Madhouse', 'VAP, Nippon Television Network, Shueisha', '77374a346f45d62b59ada6e9a479e667HunterxHunter.png', './img/bd img/anime/77374a346f45d62b59ada6e9a479e667HunterxHunter.png', '../img/bd img/anime/banner/hunter_&times;_hunter.png'),
(19, 'Vanitas no Karte', 'Em Paris no s&eacute;culo XIX, o protagonista No&eacute; Archiviste est&aacute; &agrave; procura do famoso Livro de Vanitas. A caminho da capital francesa, No&eacute; conhece um rapaz humano que se apresenta como &quot;um m&eacute;dico especializado em vampiros&quot;, autointitulado Vanitas e herdeiro do Livro. Intrigado pelo potencial do artefato e pela pr&oacute;pria figura de Vanitas, No&eacute; decide acompanh&aacute;-lo e se v&ecirc; envolvido em uma trama mais complexa do que esperava.', 2021, 4, 12, 28, 26, 1, '0.00', 0, 'Bones', 'Aniplex, Square Enix, Hakuhodo DY Music &amp; Pict', 'bea09237cce45ff0b2c3f2db7109cb64VanitasNoCarte.jpg', './img/bd img/anime/bea09237cce45ff0b2c3f2db7109cb64VanitasNoCarte.jpg', '../img/bd img/anime/banner/vanitas_no_karte.png'),
(20, 'Toradora', 'Takasu Ryuuji &eacute; um colegial gentil fascinado por trabalhos dom&eacute;sticos; mas em contraste a sua personalidade, seu rosto intimidador muitas vezes o rotula como deliquente. Por outro lado, Aisaka Taiga, uma colegial de estatura baixa e apar&ecirc;ncia fr&aacute;gil de &ldquo;personalidade dif&iacute;cil&rdquo;, toma atitudes rudes e agressivas, divergindo de sua apar&ecirc;ncia. Os dois se tornam amigos e este relacionamento se estreita a ponto de tornar-se um romance, envolto de frustra&ccedil;&otilde;es e complexos v&iacute;nculos com antigos amantes e amasias. A obra entret&eacute;m o visualizador com cenas c&ocirc;micas; abranda-o com cenas meigas; e prende-o em cenas dram&aacute;ticas que envolvem os sentimentos e emo&ccedil;&otilde;es de bons amigos.', 2008, 5, 7, 22, 1, 1, '0.00', 0, 'J.C.Staff', 'Genco, Starchild Records, Magic Capsule, Yomiuri A', '06ca1011418cd92efe2acdd16690ec54Toradora.jpg', './img/bd img/anime/06ca1011418cd92efe2acdd16690ec54Toradora.jpg', '../img/bd img/anime/banner/toradora.png'),
(21, 'Vinland Saga', 'O jovem Thorfinn cresceu ouvindo hist&oacute;rias de velhos marinheiros que viajaram pelo oceano e atingiram um lugar lend&aacute;rio, Vinland. &Eacute; dito ser uma terra quente e f&eacute;rtil, um para&iacute;so terrestre onde h&aacute; guerras e lutas &ndash; o completo contr&aacute;rio da g&eacute;lida vila islandesa onde ele nasceu, e certamente muito diferente de sua vida atual como mercen&aacute;rio. A guerra chegou a sua casa. Seu pai o ensinara que ele n&atilde;o tinha inimigos, mas Thorfinn desvia-se desde princ&iacute;pios pacifistas e envolve-se na hist&oacute;rica invas&atilde;o dinamarquesa da Inglaterra do final do s&eacute;culo X. Vinland Saga apresenta-nos os cru&eacute;is saques e massacres realizados pelos vikings nos vilarejos da Europa Ocidental. Por esses meios, os vikings auferiram renome e os esp&oacute;lios da guerra que sustentavam seu povo. Em meio aos massacres e cenas de extrema viol&ecirc;ncia, Thorfinn almeja realizar sua vingan&ccedil;a ao matar Askeladd, o assassino de seu pai. O &uacute;nico para&iacute;so para os vikings, ao que parece, &eacute; a permanente era da guerra e das carnificinas sem fim.', 2019, 3, 2, 5, 12, 24, '0.00', 0, 'Wit Studio', 'Production I.G, Dentsu, Kodansha, Twin Engine', 'e839a502b0dc20098a7d91be1b544619VinlanSaga.jpg', './img/bd img/anime/e839a502b0dc20098a7d91be1b544619VinlanSaga.jpg', '../img/bd img/anime/banner/vinland_saga.png'),
(22, 'Bleach', 'Bleach &eacute; um Anime que conta a hist&oacute;ria de um garoto de quinze anos, Kurosaki Ichigo. Ele n&atilde;o &eacute; como os garotos comuns de sua idade, ele tem a habilidade de ver fantasmas e espiritos, al&eacute;m de se comunicar com eles. Certo dia Ichigo encontra Kuchiki Rukia (uma ceifadora de almas) que est&aacute; em apuros e para ajud&aacute;-la, Ichigo absorve a energia espiritual de Rukia atrav&eacute;s de sua espada, se tornando um ceifador de almas substituto.', 2012, 3, 2, 9, 1, 1, '0.00', 0, 'Pierrot', 'TV Tokyo, Aniplex, Dentsu, TV Tokyo Music, Studio ', 'fb14b8222ed0c1a2b193de161626910aBleach.jpg', './img/bd img/anime/fb14b8222ed0c1a2b193de161626910aBleach.jpg', '../img/bd img/anime/banner/bleach.png');

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

INSERT INTO `avaliacao` (`idAvaliacao`, `id_Anime_FK`, `id_User_FK`, `likesAvaliacao`, `notaAvaliacao`, `textoComentario`) VALUES
(14, 1, 2, 0, 1, 'Sou esquizofrenico'),
(15, 1, 1, 0, 5, 'aaaaaaaaaaa');

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
  MODIFY `idAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `idDenuncia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `idFav` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
