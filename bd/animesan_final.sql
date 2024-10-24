-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Maio-2023 às 13:17
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `rankingAnime` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `animes`
--

INSERT INTO `animes` (`idAnime`, `nomeAnime`, `sinopseAnime`, `anoAnime`, `rankingAnime`, `gen1_FK`, `gen2_FK`, `gen3_FK`, `gen4_FK`, `gen5_FK`, `avaliacaoAnime`, `favoritosAnime`, `estudioAnime`, `produtorAnime`, `imagemAnime`, `pathImgAnime`, `bannerAnime`) VALUES
(1, 'Fumetsu no anata e', 'Essa obra &eacute; protagonizada por uma entidade misteriosa que o telespectador acompanha por diversas eras e formas. Embora estas primeiras palavras possam parecer estranhas, esta est&oacute;ria cativa e emociona grande de seu p&uacute;blico. Fushi, intrigante protagonista cuja jornada testemunhamos, desenvolve seus primeiros sentimentos no decorrer de sua aventura, a qual &eacute; assinalada por momentos marcantes e dolorosos em demasia. E &eacute; este sofrimento que molda sua maturidade.', 0, 2, 2, 5, 28, 1, 1, '3.00', 2, 'Brain&#039;s Base', 'NHK e Kodansha', './img/bd img/anime/fumetsu_no_anata_e.jpg', './img/bd img/anime/900c1dcf01013ed4f2fe039a0b1e2835Anatae.jpg', ''),
(2, 'Assassination Classroom', 'A est&oacute;ria gira em torno de uma turma lecionada por um professor extraterrestre extremamente talentoso e multifacetado. Por conta de um plano de defesa mundial, a sala &eacute; diariamente treinada para matar seu pr&oacute;prio professor.', 0, 4, 7, 3, 4, 1, 1, '0.00', 1, 'Lerche', 'Dentsu, Studio Hibari, Fuji TV, DAX Production, BS', './img/bd img/anime/assassination_classroom.jpg', './img/bd img/anime/32b4f7cd5de8b487fb0e4eecb0d8fb2cAssasinationClassroom.jpg', ''),
(3, 'Jibaku Shounen Hanako-kun', 'Essa obra materializa-se no Col&eacute;gio Kamome, um local assombrado por mist&eacute;rios escolares que apenas poucos alunos veem. Um destes alunos &eacute; uma das personagens principais da obra, Yashiro Nene, que conhece Hanako-san, a entidade misteriosa que d&aacute; nome &agrave; est&oacute;ria. Embora o visual da est&oacute;ria deixe uma impress&atilde;o leve para que depara com ela inicialmente, o enredo de Hanako-kun se desenvolve em uma sucess&atilde;o de situa&ccedil;&otilde;es cabisbaixas e reflexivas.', 0, 5, 4, 7, 28, 1, 1, '0.00', 1, 'Lerche', 'Square Enix, Studio Hibari, Pony Canyon, TBS, Half', './img/bd img/anime/jibaku_shounen_hanako-kun.jpg', './img/bd img/anime/4589e361b6750e28d3a731920ff71c99hanako-kun.jpg', ''),
(4, 'Mob Psycho 100', 'Vivendo em uma realidade onde algumas pessoas nascem com poderes paranormais, Mob, um jovem com dificuldades para expressar seus sentimentos e suprimir seus poderes ps&iacute;quicos tenta viver uma vida de estudante comum, embora exorcize esp&iacute;ritos malignos em suas horas vagas junto ao seu mestre Arataka Reigen.', 0, 6, 3, 4, 28, 1, 1, '0.00', 1, 'Bones', 'Warner Bros. Japan, KlockWorx, BS Fuji, Hakuhodo D', './img/bd img/anime/mob_psycho_100.jpg', './img/bd img/anime/61deecd60f88dcf827e50097e145cc68MobPsycho.jpg', ''),
(5, 'Howl no Ugoku Shiro', 'Sophie, filha de um chapeleiro comum, vive sem esperar muito de seu futuro e se contenta a monotonia de trabalhar e reprimir seus desejos. Um dia ela &eacute; visitada por uma feiticeira que a amaldi&ccedil;oa, transformando-a em uma velha de 90 anos. A fim de se livrar dessa maldi&ccedil;&atilde;o, Sophie vai em busca de um castelo andante, onde habita um feiticeiro misterioso que tem o poder de reverter o feiti&ccedil;o.', 0, 24, 2, 5, 9, 22, 1, '0.00', 0, 'Ghibli', 'd-rights , Tokuma Shoten', './img/bd img/anime/howl_no_ugoku_shiro.jpg', './img/bd img/anime/768502d20e0a4fb2b64b0d1b6a76ce6eCasteloAnimado.jpg', ''),
(6, 'Death Note', 'Nosso protagonista &eacute; Light Yagami, um jovem universit&aacute;rio idealista, com grandes ambi&ccedil;&otilde;es de justi&ccedil;a. Certo dia, Light encontra o misterioso &ldquo;Death Note&rdquo;, um caderno com poderes sobrenaturais. Conveniente aos desejos do protagonista, o Death Note concedeu a ele poder sobre a morte de qualquer um cujo nome fosse escrito no caderno, possibilitando sua grande jornada para tornar-se um deus da justi&ccedil;a.', 0, 3, 28, 29, 20, 1, 1, '0.00', 2, 'Madhouse', 'VAP, Konami, Ashi Productions, Nippon Television N', './img/bd img/anime/death_note.jpg', './img/bd img/anime/7e26cfb68b2b6a4ad1c2daa008893921DeathNote.jpg', ''),
(7, 'Hotaru no Haka', 'Essa est&oacute;ria ambientada no per&iacute;odo em que o Jap&atilde;o foi derrotado pelos os Estados Unidos. Ela &eacute; protagonizada por uma dupla irm&atilde;os rec&eacute;m-&oacute;rf&atilde;os pela guerra, que tentam sobreviver em uma na&ccedil;&atilde;o assolada pelos horrores da Segunda Guerra Mundial. A obra possui car&aacute;ter s&eacute;rio e apresenta a perspectiva de um adolescente japon&ecirc;s educado sob uma doutrina pr&eacute;-guerra sobre a rendi&ccedil;&atilde;o incondicional do Jap&atilde;o em 1945.', 0, 25, 5, 12, 17, 1, 1, '0.00', 0, 'Ghibli', 'Ghibli', './img/bd img/anime/hotaru_no_haka.jpg', './img/bd img/anime/9b83269e95a915a10d135a155755205dTumuloDosVagalumes.jpg', ''),
(8, 'Tokyo Revengers', 'Hanagaki Takemichi, aos 26 anos, descobre que seu primeiro amor, Tachibana Hinata, foi assassinada em um conflito de gangues. Em um dia qualquer, voltando de seu trabalho, ele &eacute; empurrado na trilha do metr&ocirc; e volta no tempo. Agora, como um viajante do tempo, Takemichi est&aacute; convicto de mudar o passado e manter Hinata viva no futuro.', 0, 26, 3, 5, 28, 1, 1, '0.00', 0, 'LIDENFILMS', 'Mainichi Broadcasting System, Pony Canyon, Kodansh', './img/bd img/anime/tokyo_revengers.jpg', './img/bd img/anime/34961ee090553520ea29a99ef3bfa7aaTokyoRevengers.jpg', '../img/bd img/anime/banner/tokyo_revengers.png'),
(9, 'Chainsaw Man', 'Denji &eacute; um jovem &oacute;rf&atilde;o e pobre, que herdou uma enorme d&iacute;vida de seu pai com a Yakuza e para paga-la, ele junto de seu parceiro Pochita, um c&atilde;o-dem&ocirc;nio motosserra, realizam servi&ccedil;os &agrave; famosa m&aacute;fia japonesa. Denji &eacute; um garoto carente de desejos simples: um sandu&iacute;che de manteiga de amendoim; uma namorada para ama-lo; seios para apalpar. No entanto, a Yakuza traiu-o e assassinou-o cruelmente. Pochita, a fim de salvar seu fiel amigo, se funde ao seu cad&aacute;ver e o proporciona-lhe uma nova vida, sendo ele agora o &ldquo;Chainsaw Man&rdquo;.', 0, 27, 3, 28, 1, 1, 1, '0.00', 0, 'MAPPA', 'Shueisha', './img/bd img/anime/chainsaw_man.png', './img/bd img/anime/07f5d0bd0b821c1c1f62a0294287469bChainsawMan.png', '../img/bd img/anime/banner/chainsaw_man.png'),
(10, 'Tokyo Ghoul', 'Neste mundo, a cidade de T&oacute;quio &eacute; habitada por criaturas que devoram carne humana, os Ghouls. Em meio a essa realidade, Kaneki Ken, um jovem universit&aacute;rio, encontra-se com a misteriosa Kamishiro Rize, que acaba se revelando como uma dessas criaturas, deixando-o gravemente ferido. Para salva-lo, os m&eacute;dicos transplantam os &oacute;rg&atilde;os da Rize para Kaneki, o transformando-o num meio ghoul. Agora, Kaneki Ken tem que decidir qual lado quer permanecer: humanos ou ghouls.', 0, 1, 21, 30, 28, 1, 1, '4.00', 2, 'Pierrot', 'Marvelous AQL, TC Entertainment, Shueisha', './img/bd img/anime/tokyo_ghoul.jpg', './img/bd img/anime/0248e9c0d2a0158946aacc21e6109f07TokyoGhoul.jpg', '../img/bd img/anime/banner/tokyo_ghoul.png'),
(11, 'Dororo', 'Ambientada na era dos Estados Combatentes do Jap&atilde;o, Dororo &eacute; uma est&oacute;ria de aventura e suspense, trag&eacute;dia e horror &ndash; retrato dos horrores da &eacute;poca. O protagonista &eacute; Hyakkimaru, filho primog&ecirc;nito de Daigo Kagemitsu, o senhor feudal da prov&iacute;ncia de Kaga. Antes do nascimento do protagonista, seu pai realizou um pacto com for&ccedil;as diab&oacute;licas e ofereceu 48 partes do corpo de Hyakkimaru aos 48 dem&ocirc;nios, pedindo em troca a prosperidade de seus dom&iacute;nios feudais. O menino nasce fr&aacute;gil e sem partes importantes de seu corpo, e &eacute; logo descartado em um rio, de onde &eacute; resgatado por um curandeiro que lhe faz pr&oacute;teses e lhe salva a vida. O menino cresce sob o nome de Hyakkimaru e descobre a respeito de sua maldi&ccedil;&atilde;o: cada dem&ocirc;nio daqueles 48 que ele matar o trar&aacute; de volta uma parte de seu corpo, e logo sua humanidade roubada. Ele parte em sua jornada sobrenatural junto a Dororo, um menino ladr&atilde;o, por entre fantasmas e dem&ocirc;nios.', 2007, 28, 3, 2, 12, 28, 1, '0.00', 0, 'Tezuka Productions, MAPPA', 'Twin Engine', './img/bd img/anime/dororo.jpg', './img/bd img/anime/b49d4085530554150034517bcf80c46fDororo.jpg', '../img/bd img/anime/banner/dororo.png'),
(12, 'Jujutsu Kaisen', 'Maldi&ccedil;&otilde;es s&atilde;o energias amaldi&ccedil;oadas que tomam forma atrav&eacute;s do ac&uacute;mulo de emo&ccedil;&otilde;es humanas negativas. Itadori Yuuji &eacute; um estudante do ensino m&eacute;dio que mora com o av&ocirc;. Embora as grandes habilidades f&iacute;sicas, ele acaba entrando para o clube de ocultismo, onde ele e seus amigos encontram um objeto misterioso e retiram o selo que o envolvia, &ldquo;atraindo maldi&ccedil;&otilde;es&rdquo;. Com o desejo de viver uma vida sem arrependimentos, Itadori engole o &ldquo;item amaldi&ccedil;oado&rdquo; para salvar seus amigos, s&oacute; n&atilde;o esperava ser um dos dedos do rei das maldi&ccedil;&otilde;es, Ryomen Sukuna.', 2020, 7, 3, 2, 9, 28, 1, '0.00', 1, 'MAPPA', 'Mainichi Broadcasting System, anima&ccedil;&atilde', './img/bd img/anime/jujutsu_kaisen.jpg', './img/bd img/anime/a1c18af30b18f258db2581555c6f11b9JujutsuKaisen.jpg', '../img/bd img/anime/banner/jujutsu_kaisen.png'),
(13, 'Boku no Hero Academia', 'Com 80% da humanidade possuindo algum poder sobre-humano, Midoriya Izuku &eacute; um dos poucos humanos que nasceram sem qualquer individualidade (poder). Apesar do destino injusto, Deku, como &eacute; chamado, sempre teve o sonho de se tornar um super-her&oacute;i igual ao seu &iacute;dolo, All Might. Por&eacute;m, um inesperado momento acontece, e por sua coragem, herda os poderes de seu super-her&oacute;i n&uacute;mero um, que o levar&aacute; a ingressar na t&atilde;o sonhada academia de her&oacute;is, o col&eacute;gio U.A.', 2016, 29, 3, 7, 20, 26, 1, '0.00', 0, 'Bones', 'Dentsu, Mainichi Broadcasting System, Movic, TOHO ', './img/bd img/anime/boku_no_hero_academia.jpg', './img/bd img/anime/e71f5424b36c7bc52d58506fb763366aMyHeroAcademia.jpg', '../img/bd img/anime/banner/boku_no_hero_academia.png'),
(14, 'Noragami Aragoto', 'Yato &eacute; um deus menosprezado cujo seu sonho &eacute; ter um santu&aacute;rio e milhares de seguidores. Embora tenha esse sonho, o deus da calamidade n&atilde;o tem sequer um seguidor, e para conseguir construir seu santu&aacute;rio e ser lembrado pelas pessoas, Yato deixa seu n&uacute;mero rabiscado em vermelho pelos lugares oferendo servi&ccedil;os em troca de 5 yenes. Mas toda vida do deus muda quando ele &eacute; salvo de um acidente de carro por uma garota, que acaba se ligando a ele por um tempo indeterminado.', 2014, 30, 3, 9, 28, 1, 1, '0.00', 0, 'Bones', 'Avex Entertainment, Dentsu, Shochiku, Kodansha, Mo', './img/bd img/anime/noragami_aragoto.jpg', './img/bd img/anime/279e6d517455ef5fe9543cef158e32e8NoragamiAragoto.jpg', '../img/bd img/anime/banner/noragami_aragoto.png'),
(15, 'One Punch Man', 'Saitama &eacute; um super-her&oacute;i que treinou durante v&aacute;rios anos para se tornar o mais forte, fazendo todos seus cabelos ca&iacute;rem. Infelizmente, ser o maior de todos acabou o entediando em suas lutas com a aus&ecirc;ncia de um oponente digno, passando apenas a viver a vida de her&oacute;i como um hobby. Certo dia, Saitama encontra Genos, um ciborgue de 19 anos que deseja ser seu disc&iacute;pulo. O jovem prop&otilde;e para que eles entrem na associa&ccedil;&atilde;o de her&oacute;is para que sejam reconhecidos, encaminhando ambos em uma nova jornada, embora o &uacute;nico desejo de Saitama &eacute; voltar a sentir a emo&ccedil;&atilde;o da batalha, e talvez, a fama pelos seus feitos.', 2017, 8, 3, 4, 20, 1, 1, '0.00', 1, 'Madhouse', 'TV Tokyo, Bandai Visual, Lantis, Asatsu DK, Banpre', './img/bd img/anime/one_punch_man.jpg', './img/bd img/anime/2298311356b4d6690a3681b7cca18a6bOnePunchMan.jpg', '../img/bd img/anime/banner/one_punch_man.png'),
(16, 'Haikyuu!!', 'O &ldquo;pequeno gigante&rdquo; foi um habilidoso jogador de v&ocirc;lei, embora tivesse uma altura abaixo da m&eacute;dia no esporte. Shouyou Hinata fica fascinado quando o viu jogar pela primeira vez, ent&atilde;o decide se tornar um jogador de v&ocirc;lei, criando um clube de v&ocirc;lei na sua escola, por&eacute;m, ningu&eacute;m se junta a ele. Com o passar do tempo, Hinata finalmente monta uma equipe e participa de um campeonato, onde acaba perdendo para o time de Kageyama Tobio, o favorito da competi&ccedil;&atilde;o. Quando Shouyou se matricula na Karasuno, ele acredita estar perto de realizar seu sonho, at&eacute; descobrir que Kageyama Tobio, o jogador que o humilhou no passado, ser&aacute; seu companheiro de equipe.', 2014, 9, 4, 7, 8, 1, 1, '0.00', 1, 'Production I.G', 'Dentsu, Mainichi Broadcasting System, Movic, TOHO ', './img/bd img/anime/haikyuu!!.png', './img/bd img/anime/15afb75c1597fe7420d2054c61ef3d8bhaikyuu.png', '../img/bd img/anime/banner/haikyuu!!.png'),
(17, 'Kimetsu no Yaiba', 'Desde a morte de seu pai, Kamado Tanjiro se torna o suporte de sua fam&iacute;lia, vendendo carv&atilde;o para ajudar com as despesas. Na volta do dia seguinte, ap&oacute;s pousar na casa de um homem desconhecido quando voltava da cidade, Tanjiro descobre que sua fam&iacute;lia foi massacrada por um dem&ocirc;nio, e a &uacute;nica sobrevivente, sua irm&atilde; Nezuko, se transforma em um dem&ocirc;nio. Buscando vingan&ccedil;a e a cura para sua irm&atilde;, Tanjiro se torna um ca&ccedil;ador.', 2019, 31, 3, 12, 28, 1, 1, '0.00', 0, 'Ufotable', 'Aniplex, Shueisha', './img/bd img/anime/kimetsu_no_yaiba.jpg', './img/bd img/anime/e38158ad008d9825206a7c9622b2b581KimetsuNoYaiba.jpg', '../img/bd img/anime/banner/kimetsu_no_yaiba.png'),
(18, 'Hunter &times; Hunter', 'Hunters s&atilde;o ca&ccedil;adores de tesouros, que desbravam o continente em lugares perigosos, com criaturas estranhas e itens amaldi&ccedil;oados. O jovem Gon Freecs, de apenas 12 anos, tem o sonho de se tornar um Hunter para encontrar seu pai, um dos Hunters mais famosos do mundo. Mas essa tarefa n&atilde;o &eacute; f&aacute;cil, e para praticar essa profiss&atilde;o, Gon passa pelo exame Hunter, onde faz amizades com o estudante de medicina Leorio Paladiknight, o misterioso Kurapika e um jovem de sua idade, Killua Zoldyck, dando in&iacute;cio a sua jornada.', 1999, 10, 3, 2, 9, 1, 1, '0.00', 1, 'Madhouse', 'VAP, Nippon Television Network, Shueisha', './img/bd img/anime/hunter_&times;_hunter.png', './img/bd img/anime/77374a346f45d62b59ada6e9a479e667HunterxHunter.png', '../img/bd img/anime/banner/hunter_&times;_hunter.png'),
(19, 'Vanitas no Karte', 'Em Paris no s&eacute;culo XIX, o protagonista No&eacute; Archiviste est&aacute; &agrave; procura do famoso Livro de Vanitas. A caminho da capital francesa, No&eacute; conhece um rapaz humano que se apresenta como &quot;um m&eacute;dico especializado em vampiros&quot;, autointitulado Vanitas e herdeiro do Livro. Intrigado pelo potencial do artefato e pela pr&oacute;pria figura de Vanitas, No&eacute; decide acompanh&aacute;-lo e se v&ecirc; envolvido em uma trama mais complexa do que esperava.', 2021, 32, 4, 12, 28, 26, 1, '0.00', 0, 'Bones', 'Aniplex, Square Enix, Hakuhodo DY Music &amp; Pict', './img/bd img/anime/vanitas_no_karte.jpg', './img/bd img/anime/bea09237cce45ff0b2c3f2db7109cb64VanitasNoCarte.jpg', '../img/bd img/anime/banner/vanitas_no_karte.png'),
(20, 'Toradora', 'Takasu Ryuuji &eacute; um colegial gentil fascinado por trabalhos dom&eacute;sticos; mas em contraste a sua personalidade, seu rosto intimidador muitas vezes o rotula como deliquente. Por outro lado, Aisaka Taiga, uma colegial de estatura baixa e apar&ecirc;ncia fr&aacute;gil de &ldquo;personalidade dif&iacute;cil&rdquo;, toma atitudes rudes e agressivas, divergindo de sua apar&ecirc;ncia. Os dois se tornam amigos e este relacionamento se estreita a ponto de tornar-se um romance, envolto de frustra&ccedil;&otilde;es e complexos v&iacute;nculos com antigos amantes e amasias. A obra entret&eacute;m o visualizador com cenas c&ocirc;micas; abranda-o com cenas meigas; e prende-o em cenas dram&aacute;ticas que envolvem os sentimentos e emo&ccedil;&otilde;es de bons amigos.', 2008, 33, 5, 7, 22, 1, 1, '0.00', 0, 'J.C.Staff', 'Genco, Starchild Records, Magic Capsule, Yomiuri A', './img/bd img/anime/toradora.jpg', './img/bd img/anime/06ca1011418cd92efe2acdd16690ec54Toradora.jpg', '../img/bd img/anime/banner/toradora.png'),
(21, 'Vinland Saga', 'O jovem Thorfinn cresceu ouvindo hist&oacute;rias de velhos marinheiros que viajaram pelo oceano e atingiram um lugar lend&aacute;rio, Vinland. &Eacute; dito ser uma terra quente e f&eacute;rtil, um para&iacute;so terrestre onde h&aacute; guerras e lutas &ndash; o completo contr&aacute;rio da g&eacute;lida vila islandesa onde ele nasceu, e certamente muito diferente de sua vida atual como mercen&aacute;rio. A guerra chegou a sua casa. Seu pai o ensinara que ele n&atilde;o tinha inimigos, mas Thorfinn desvia-se desde princ&iacute;pios pacifistas e envolve-se na hist&oacute;rica invas&atilde;o dinamarquesa da Inglaterra do final do s&eacute;culo X. Vinland Saga apresenta-nos os cru&eacute;is saques e massacres realizados pelos vikings nos vilarejos da Europa Ocidental. Por esses meios, os vikings auferiram renome e os esp&oacute;lios da guerra que sustentavam seu povo. Em meio aos massacres e cenas de extrema viol&ecirc;ncia, Thorfinn almeja realizar sua vingan&ccedil;a ao matar Askeladd, o assassino de seu pai. O &uacute;nico para&iacute;so para os vikings, ao que parece, &eacute; a permanente era da guerra e das carnificinas sem fim.', 2019, 11, 3, 2, 5, 12, 24, '0.00', 1, 'Wit Studio', 'Production I.G, Dentsu, Kodansha, Twin Engine', './img/bd img/anime/vinland_saga.jpg', './img/bd img/anime/e839a502b0dc20098a7d91be1b544619VinlanSaga.jpg', '../img/bd img/anime/banner/vinland_saga.png'),
(22, 'Bleach', 'Bleach &eacute; um Anime que conta a hist&oacute;ria de um garoto de quinze anos, Kurosaki Ichigo. Ele n&atilde;o &eacute; como os garotos comuns de sua idade, ele tem a habilidade de ver fantasmas e espiritos, al&eacute;m de se comunicar com eles. Certo dia Ichigo encontra Kuchiki Rukia (uma ceifadora de almas) que est&aacute; em apuros e para ajud&aacute;-la, Ichigo absorve a energia espiritual de Rukia atrav&eacute;s de sua espada, se tornando um ceifador de almas substituto.', 2012, 12, 3, 2, 9, 1, 1, '0.00', 1, 'Pierrot', 'TV Tokyo, Aniplex, Dentsu, TV Tokyo Music, Studio ', './img/bd img/anime/bleach.jpg', './img/bd img/anime/fb14b8222ed0c1a2b193de161626910aBleach.jpg', '../img/bd img/anime/banner/bleach.png'),
(23, 'Ao no Exorcist', 'Rin Okumura e seu irm&atilde;o Yukio s&atilde;o &oacute;rf&atilde;os criados em um monast&eacute;rio por seu pai adotivo, Shiro Fujimoto. Em um dia qualquer, em meio a uma briga, Rin desperta seus poderes e descobre ser filho de Sat&atilde;, que deseja seu retorno &agrave; Gheena, &ndash; local onde os dem&ocirc;nios habitam - e que seu pai adotivo era um famoso exorcista. N&atilde;o querendo se juntar ao trono com Sat&atilde;, Rin ingressa no col&eacute;gio Vera Cruz para se tornar um exorcista e lutar contra o mal ao lado de seu irm&atilde;o.', 172011, 13, 3, 7, 28, 1, 1, '0.00', 1, 'A-1 Pictures', 'Aniplex , Dentsu , Mainichi Broadcasting System , ', './img/bd img/anime/ao_no_exorcist.jpg', './img/bd img/anime/25e995da19570508b023987c1a3f80b3AoNoExorcist.jpg', '../img/bd img/anime/banner/ao_no_exorcist.png'),
(24, 'Sonny Boy', 'Em agosto, no meio das f&eacute;rias de ver&atilde;o, 36 alunos s&atilde;o transportados misteriosamente de suas casas para uma escola &agrave; deriva em outra dimens&atilde;o. Nesse lugar, alguns alunos despertam superpoderes, de forma a sobrevirem nessa dimens&atilde;o alternativa. Sem escolhas, esses estudantes v&atilde;o em busca de alguma maneira de sa&iacute;rem da deriva e se adaptarem as novas regras desse novo mundo.', 2021, 34, 7, 18, 5, 23, 1, '0.00', 0, 'Madhouse', 'Shochiku, Marui Group, BS Asahi', './img/bd img/anime/sonny_boy.png', './img/bd img/anime/c4bc0ebdd53dc34f531735f0bcff1decSonnyBoy.png', '../img/bd img/anime/banner/sonny_boy.png'),
(25, 'Spy x Family', 'H&aacute; d&eacute;cadas as na&ccedil;&otilde;es de Ostania e Westalis promovem uma guerra fria sem t&eacute;rmino. Para dar um fim nessa guerra, o agente secreto mais conhecido como Twilight, tem a miss&atilde;o de adentrar em Ostania para investigar os movimentos de Donovan Desmond, um influente pol&iacute;tico. Para conseguir tal feito, nosso agente precisa se infiltrar na escola do filho de Donovan, academia &eacute;den, mas al&eacute;m disso, Twilight deve montar uma fam&iacute;lia falsa para conseguir participar dos eventos promovidos pela academia, mas por um acaso do destino, Twilight acaba adotando Anya, uma jovem com poderes telep&aacute;ticos, e se &quot;casando&quot; com Yor, uma assassina profissional. Assim, os tr&ecirc;s come&ccedil;am a morar juntos, tendo que esconder suas verdadeiras identidades uns dos outros.', 2022, 14, 3, 4, 1, 1, 1, '0.00', 1, 'Wit Studio, CloverWorks', 'TV Tokyo, Shogakukan-Shueisha Productions, TOHO an', './img/bd img/anime/spy_x_family.jpg', './img/bd img/anime/84a2846315e3b0e1586e9d631f8d54caSpyxFamily.jpg', '../img/bd img/anime/banner/spy_x_family.png'),
(26, 'Deadman Wonderland', 'Deadman Wonderland &eacute; uma s&eacute;rie de mang&aacute; escrita por Jinsei Kataoka e ilustrado por Koundou Kazuma, que conta a hist&oacute;ria de Igarashi Ganta, um adolescente que &eacute; mandado para a Deadman Wonderland, uma pris&atilde;o, sendo o principal suspeito pelo assassinato de todos os alunos de sua classe. Para sobreviver e provar sua inoc&ecirc;ncia, Ganta tem que passar por provas mortais junto a outros condenados, no entanto, l&aacute; ele conhece uma garota, que pode ter uma forte liga&ccedil;&atilde;o com o verdadeiro assassino.', 2011, 35, 3, 23, 28, 30, 1, '0.00', 0, 'Manglobe', 'Kadokawa Shoten, Kadokawa Pictures Japan, KlockWor', './img/bd img/anime/deadman_wonderland.png', './img/bd img/anime/d5b9dd2836ba6e9b66b453a27e2e7ddaDeadmanWonderland.png', '../img/bd img/anime/banner/deadman_wonderland.png'),
(27, 'Cyberpunk: Edgerunners', 'Night City &eacute; uma megacidade americana localizada no Estado Livre da Calif&oacute;rnia do Norte, controlada por corpora&ccedil;&otilde;es. A todo momento gangues e corpora&ccedil;&otilde;es que buscam dominar a cidade entram em conflito entre si. Na hist&oacute;ria acompanhamos a vida de David Martinez, um estudante da Arasaka que ao decorrer de tr&aacute;gicos acontecimentos se atira no submundo de Night City como um mercen&aacute;rio.', 2022, 36, 3, 23, 1, 1, 1, '0.00', 0, 'Trigger', 'CD Projekt Red', './img/bd img/anime/cyberpunk:_edgerunners.jpg', './img/bd img/anime/09c0c936a168f0465f54a6141363ca32Cyberpunk.jpg', '../img/bd img/anime/banner/cyberpunk:_edgerunners.png'),
(28, 'Black Clover', 'Dois &oacute;rf&atilde;os, Asta e Yuno, s&atilde;o abandonados no mesmo dia em uma igreja no reino de Clover. Nascidos em uma regi&atilde;o onde predomina a magia e seus usu&aacute;rios, eles crescem juntos com um mesmo sonho: se tornar um Rei mago. Conforme os anos se passam, Yuno desenvolve seus poderes m&aacute;gicos, cada vez mais demonstrando aptid&atilde;o para a magia; j&aacute; Asta, desesperado por n&atilde;o ser capaz de usar magia, treina constantemente seu f&iacute;sico para suprir a falta de suas habilidades. Aos 15 anos, todos as crian&ccedil;as do reino participam de uma cerim&ocirc;nia para conseguir seu grim&oacute;rio. Yuno acaba recebendo um grim&oacute;rio lend&aacute;rio com um trevo de 4 folhas, enquanto Asta n&atilde;o consegue nenhum.  Em um dia, quando atacados, Asta libera suas emo&ccedil;&otilde;es a fim de salvar Yuno e acaba conquistando um raro grim&oacute;rio com um trevo de 5 folhas que lhe concede poderes da antimagia. Mesmo obtendo esse tipo de poder, Asta n&atilde;o desiste de seus sonhos e percorre sua jornada para se tornar um Rei mago.', 2017, 37, 3, 4, 9, 1, 1, '0.00', 0, 'Pierrot', 'TV Tokyo, Avex Pictures, Shueisha', './img/bd img/anime/black_clover.png', './img/bd img/anime/dfbc317d9703127f61614f187fdc9f8eBlackClover.png', '../img/bd img/anime/banner/black_clover.png'),
(29, 'Kuroko no Basket', 'A &ldquo;Gera&ccedil;&atilde;o dos milagres&rdquo; foi um grupo de cinco jogadores prod&iacute;gios de basquete com um sexto jogador fantasma da escola secund&aacute;ria Teiko. Seus feitos chegaram a ser reconhecidos mundialmente, no entanto, pela falta de desafios em quadra, fez com que o grupo se separasse e cada jogador trilhasse caminhos diferentes. Kagami Taiga e Kuroko Tetsuya s&atilde;o dois calouros que s&atilde;o recrutados para o time de basquete da escola Seirin High. Taiga &eacute; um habilidoso jogador que veio dos Estados Unidos com desejo de se tornar reconhecido mundialmente; j&aacute; Kuroko &eacute; conhecido como um jogador mediano sem qualquer destaque. Mas o que todos n&atilde;o esperavam era que Kuroko pertencia a gera&ccedil;&atilde;o dos milagres como o sexto jogador fantasma. Para conquistar o campeonato InterHigh e vencer seus ex-companheiros de equipe, Kuroko firma um pacto de apoiar a &lsquo;luz&rsquo; de Kagami Taiga como sua &lsquo;sombra&rsquo;.', 2012, 38, 7, 8, 1, 1, 1, '0.00', 0, 'Production I.G', 'Bandai Visual , Lantis , Nihon Ad Systems , Mainic', './img/bd img/anime/kuroko_no_basket.jpg', './img/bd img/anime/c48f8bc56e3a157207c8d87731b55ad9Kuroko_no_Basket.jpg', '../img/bd img/anime/banner/kuroko_no_basket.png'),
(30, 'Uzaki-chan wa Asobitai!', 'Sakurai Shinichi &eacute; um jovem universit&aacute;rio de 20 anos que quer passar seus anos na faculdade em paz, totalmente exclu&iacute;do de todos, sem qualquer contato. Entretanto, com a entrada de Uzaki Hana - uma caloura energ&eacute;tica e bem-dotada - no mesmo clube de Sakurai, todo seu plano &eacute; arruinado. Uzaki faz de tudo para evitar que Sakurai fique sozinho, o convidando sempre para sair e acabar zombando dele. Mesmo assim, com o passar do tempo, Uzaki e Sakurai se tornam mais pr&oacute;ximos, ao ponto de serem comparados como um casal por quem os observa. Mas de qualquer forma, tudo que Uzaki quer &eacute; passar seu tempo bagun&ccedil;ando e perturbando a vida &lsquo;tranquila&rsquo; de Sakurai.', 2020, 39, 4, 22, 6, 1, 1, '0.00', 0, 'ENGI', 'Movic, AT-X, Enterbrain, Sammy, ABC Animation, Kad', './img/bd img/anime/uzaki-chan_wa_asobitai!.png', './img/bd img/anime/7cbe6717a21cc564e4e6cdf7a799209eUzaki-chan.png', '../img/bd img/anime/banner/uzaki-chan_wa_asobitai!.png'),
(31, 'No Game no Life', 'No Game No Life conta a hist&oacute;ria de dois irm&atilde;os gamers e Hikikomoris, isto &eacute;, se mantem isolados do mundo, sem nunca sair de casa. Sora, de 18 anos, e shiro, uma menina de 11 anos, possuem &oacute;timas habilidades em games dominando v&aacute;rios jogos sob o nome de usu&aacute;rio &ldquo;Blank&rdquo;, &ndash; Kuuhaku - acreditando que a vida &eacute; mais um jogo chato com que eles t&ecirc;m que lidar. Um dia, por&eacute;m, a vida deles muda completamente, que ap&oacute;s responderem a mensagem de um usu&aacute;rio desconhecido, eles s&atilde;o transportados para um mundo t&iacute;pico de fantasia isekai, com elfos, magos, ra&ccedil;as fant&aacute;sticas..., mas al&eacute;m disso, nessa nova dimens&atilde;o tudo &eacute; resolvido atrav&eacute;s de jogos. Entretanto, Sora e Shiro chegam em um momento em que a exist&ecirc;ncia da humanidade est&aacute; em risco e os irm&atilde;os t&ecirc;m que estar prontos para defender e lutar juntos para impedir sua extin&ccedil;&atilde;o.', 2014, 15, 4, 9, 6, 1, 1, '0.00', 1, 'Madhouse', 'Frontier Works, Media Factory, Movic, AT-X', './img/bd img/anime/no_game_no_life.png', './img/bd img/anime/bd4b798d0fff30d13f9c58f68dd5006eNoGameNoLife.png', '../img/bd img/anime/banner/no_game_no_life.png'),
(32, 'Devilman Crybaby', 'Dem&ocirc;nios n&atilde;o podem tomar forma sem um hospedeiro vivo. Fraco e despretensioso, o emp&aacute;tico Fudou Akira reencontra seu amigo de inf&acirc;ncia Asuka Ryou, que por sua vez pede sua ajuda para descobrir esses dem&ocirc;nios, Akira aceita sem hesita&ccedil;&atilde;o. No entanto, para surpresa de Akira, o local para onde v&atilde;o &eacute; o sabbath: uma festa imoral de devassid&atilde;o e degenera&ccedil;&atilde;o, no meio da festa humanos come&ccedil;am a ser possu&iacute;dos, transformando seus corpos em monstros grotescos, em uma tentativa de salvar seu amigo, Akira se atira na frente de Ryou, nosso protagonista tem seu corpo invadido por Amon um dos dem&ocirc;nios mais poderosos. Para a surpresa de todos Akira se funde ao dem&ocirc;nio, abandonando aquele corpo fr&aacute;gil e adquirindo o poder de acabar com toda a amea&ccedil;a a terra.', 2018, 16, 3, 28, 1, 1, 1, '0.00', 1, 'Science SARU', 'Aniplex, Dynamic Planning, Netflix', './img/bd img/anime/devilman_crybaby.jpg', './img/bd img/anime/853074b0fec031e454f4e3f95c94edceDevilmanCrybaby.jpg', '../img/bd img/anime/banner/devilman_crybaby.png'),
(33, 'Blue Lock', '300 jovens promissores no futebol s&atilde;o selecionados para viver juntos num centro de treinamento chamado Blue Lock, que ser&aacute; o palco de uma batalha para descobrir qual deles ser&aacute; o novo centro avante da sele&ccedil;&atilde;o japonesa. Os criadores desse centro de treinamento buscam um atacante ego&iacute;sta e com &acirc;nsia pela vit&oacute;ria, para levar o Jap&atilde;o a sua primeira conquista da copa do mundo, e detalhe, os outros 299 que n&atilde;o conseguirem cumprir com o objetivo, nunca poder&atilde;o ter a oportunidade de jogar na sele&ccedil;&atilde;o japonesa no futuro.', 2022, 40, 3, 8, 5, 1, 1, '0.00', 0, '8bit', 'TV Asahi, Kodansha, Toy&#039;s Factory, Crunchyrol', './img/bd img/anime/blue_lock.jpg', './img/bd img/anime/96b30cd15b59fff0e162442ac10243f8Bluelock.jpg', '../img/bd img/anime/banner/blue_lock.png'),
(34, 'Junjou Romantica', 'Junjou Romantica re&uacute;ne tr&ecirc;s hist&oacute;rias de amor, narrando o romance de cada casal. O primeiro ato foca no relacionamento de Takahashi Misaki e Usami Akihiko. Misaki &eacute; um jovem que sonha em entrar na mesma universidade de seu irm&atilde;o. Sabendo de suas p&eacute;ssimas notas, seu irm&atilde;o pede ao seu melhor amigo, Usami, para ajud&aacute;-lo nessa tarefa, se tornando seu professor particular. O problema &eacute; que Akihiko &eacute; um romancista apaixonado, sempre usando o nome de Takahiro - irm&atilde;o de Misaki - em suas hist&oacute;rias adultas, e para piorar, seu irm&atilde;o est&aacute; para se casar. Agora, Takahashi tem que aprender a lidar com seu sedutor tutor, que sem qualquer pudor, o assedia e zomba de si, tornando sua vida uma confus&atilde;o.', 2008, 41, 5, 22, 4, 1, 1, '0.00', 0, 'Studio Deen', 'Frontier Works, Kadokawa Shoten, Memory-Tech, Roma', './img/bd img/anime/junjou_romantica.jpg', './img/bd img/anime/0ce36d42abb46e8e7b39dc53fe9095a8JunjouRomantica.jpg', '../img/bd img/anime/banner/junjou_romantica.png'),
(35, 'Psycho-Pass', 'Em um Jap&atilde;o futurista, a tecnologia desenvolvida Sibyl System tem o objetivo de determinar o n&iacute;vel de amea&ccedil;a de cada cidad&atilde;o, examinando seu estado mental e medindo a possibilidade de a&ccedil;&otilde;es perigosas, conhecidas como psycho-pass. Para subjug&aacute;-los, os inspetores foram criados; j&aacute; os executores s&atilde;o criminosos latentes que concordaram em ajudar em troca de uma liberdade limitada. Desde o lan&ccedil;amento dessa rede de computadores, houve uma mudan&ccedil;a na justi&ccedil;a e no significado de uma sociedade livre. Tsunemori Akane &eacute; uma nova agente do sistema, com o desejo de defender a verdadeira justi&ccedil;a. Ao lado do executor Kougami Shinya, ela come&ccedil;a a perceber falhas no julgamento da Sibyl Systems. Com tudo conturbado, Akane entra em quest&otilde;es como a condena&ccedil;&atilde;o de uma sociedade por sentir emo&ccedil;&otilde;es erradas e um poss&iacute;vel sistema que j&aacute; pode estar corrompido.', 2012, 17, 3, 23, 29, 1, 1, '0.00', 1, 'Production I.G', 'Dentsu, Fuji TV, Nitroplus, Sony Music Entertainme', './img/bd img/anime/psycho-pass.jpg', './img/bd img/anime/3f9991e6ed0750613db60fdad5dd98a3psypass.jpg', '../img/bd img/anime/banner/psycho-pass.png'),
(36, 'Overlord', 'O famoso jogo online Yggdrasil est&aacute; prestes a acabar. Entretanto, um de seus ass&iacute;duos jogadores, Momonga, um poderoso mago com a apar&ecirc;ncia de um esqueleto e l&iacute;der da guilda Ainz Ooal Gown, deseja passar os &uacute;ltimos momentos dentro do jogo enquanto os servidores v&atilde;o desligando. Por&eacute;m, quando passa da meia-noite, Momonga percebe que n&atilde;o perdeu a conex&atilde;o com o personagem, e que os NPC&rsquo;s criaram vontades pr&oacute;prias. Confuso pela situa&ccedil;&atilde;o, mas decidido a n&atilde;o sair do jogo, Momonga ordena aos seus servos da guilda para protegerem a base, convicto em dominar esse mundo e descobrir se h&aacute; outros jogadores em sua mesma situa&ccedil;&atilde;o.', 2015, 18, 3, 9, 6, 1, 1, '0.00', 1, 'Madhouse', 'AT-X, Grooove, Hakuhodo DY Music &amp; Pictures, K', './img/bd img/anime/overlord.jpg', './img/bd img/anime/89bdf218d80052af732a67067abde4b0Overlord_(1).jpg', '../img/bd img/anime/banner/overlord.png'),
(37, 'Baki', 'Ap&oacute;s sair vitorioso de um violento torneio subterr&acirc;neo, Hanma Baki continua seu caminho para derrotar seu pai, Hanma Yujiro, o homem mais forte do mundo. Decidido a conquistar o t&iacute;tulo de seu pai, Baki se submete a diversos treinos para super&aacute;-lo. Por&eacute;m, sua determina&ccedil;&atilde;o e for&ccedil;a acaba atraindo a aten&ccedil;&atilde;o de 5 condenados no corredor da morte que escaparam da pris&atilde;o, que est&atilde;o dispostos a derrota-lo de todas as formas.', 2018, 19, 3, 8, 1, 1, 1, '0.00', 1, 'TMS Entertainment', 'Sem produtora', './img/bd img/anime/baki.jpg', './img/bd img/anime/4486877c4df4fa2d9536b85d326cdddcBaki.jpg', '../img/bd img/anime/banner/baki.png'),
(38, 'Ijirainade, Nagatoro-san', 'Hayase Nagatoro &eacute; uma estudante do primeiro ano que passa seu tempo importunando e provocando Naoto Hachiouji, seu senpai, ap&oacute;s t&ecirc;-lo conhecido na biblioteca, enquanto ele trabalhava em seu mang&aacute;. Depois de ler seu mang&aacute; e observar seu comportamento ao abuso verbal de outras garotas maliciosas, Nagatoro passa a provoc&aacute;-lo tamb&eacute;m. No entanto, mesmo com as brincadeiras inc&ocirc;modas e vergonhosas, Nagatoro e seu senpai acabam desenvolvendo uma estranha amizade, e que a vida ao lado de Hachiouji pode ser at&eacute; divertida.', 2021, 42, 4, 7, 22, 1, 1, '0.00', 0, 'Telecom Animation Film', 'TMS Entertainment , Mainichi Broadcasting System ,', './img/bd img/anime/ijirainade,_nagatoro-san.jpg', './img/bd img/anime/602d5a54a088e368b3365eea84fb87f8Nagatoro.jpg', '../img/bd img/anime/banner/ijirainade,_nagatoro-san.png'),
(39, 'Hajime no Ippo', 'O t&iacute;mido e ing&ecirc;nuo adolescente Makunouchi Ippo divide seu tempo trabalhando duro na loja de alugu&eacute;is de barcos de pesca de sua m&atilde;e e seus estudos. Ippo tem 16 anos e nunca fez algo de sua idade, sempre com sua vida ocupada com os afazeres do trabalho, n&atilde;o possuindo amigos e sendo alvo de Umezawa e sua gangue, que o espancam desde a inf&acirc;ncia. Certo dia Ippo &eacute; cercado por Umezawa e seus amigos, mas &eacute; salvo por Takamura, um boxeador veterano vencedor do torneio de novatos do Jap&atilde;o. Desmaiado e cheio de feridas, Takamura leva Ippo para seu gin&aacute;sio para tratar de seus ferimentos. Quando desperta, Ippo &eacute; incentivado a golpear um saco de areia e impressiona a todas em sua volta. Naquela oportunidade, Takamura empresta fitas com lutas de boxes, que incentivam o desejo pelo boxe em Ippo. Determinado a entender o que &eacute; ser realmente forte, Ippo convence o treinador Genji Kamogawa a trein&aacute;-lo para sua trajet&oacute;ria em se tornar vitorioso em sua carreira como pugilista.', 2000, 43, 3, 8, 1, 1, 1, '0.00', 0, 'Madhouse', 'VAP', './img/bd img/anime/hajime_no_ippo.png', './img/bd img/anime/851ba88e7fb48a7606db2def8d17471bHajimenoIppo.png', '../img/bd img/anime/banner/hajime_no_ippo.png'),
(40, 'Magi: The Labyrinth of Magic', 'Um Magi &eacute; um mago com imenso poder m&aacute;gico, capaz de transformar o mundo. Com sua grande influ&ecirc;ncia, eles escolhem uma pessoa digna o suficiente para ser rei. Entretanto, para conquistar poder e for&ccedil;a, os escolhidos t&ecirc;m que passar por uma Dungeon: labirintos imensos com seu pr&oacute;prio mundo que existem h&aacute; 14 anos, que escondem um Djinn, que tem o poder de tornar uma pessoa rei. Aladdin &eacute; um garotinho que vive sua jornada ao lado de Ugo, um Djinn que habita na flauta que ele carrega consigo, em busca de outros g&ecirc;nios. Em suas viagens, ele acaba conhecendo Alibaba Saluja, um jovem com sede de riqueza e poder, que tem o desejo de conquistar uma Dungeon. Os dois partem para uma masmorra pr&oacute;xima, dando in&iacute;cio a uma amizade com aventuras &eacute;picas cheias de perigos.', 2012, 44, 3, 2, 9, 1, 1, '0.00', 0, 'A-1 Pictures', 'Aniplex, Dentsu, Shogakukan-Shueisha Productions, ', './img/bd img/anime/magi:_the_labyrinth_of_magic.jpg', './img/bd img/anime/da2c92f486419d8187ec8d549003c240Magi.jpg', '../img/bd img/anime/banner/magi:_the_labyrinth_of_magic.png'),
(41, 'Dr. Stone', 'Ap&oacute;s 5 anos mantendo seus sentimentos guardados, o colegial Ooki Taiju finalmente consegue coragem suficiente para confessar seu amor por Ogawa Yuzuriha. Entretanto, quando Taiju come&ccedil;a a se declarar, um clar&atilde;o verde atinge a terra petrificando toda a humanidade. At&eacute; que certo dia, 3700 anos depois da cat&aacute;strofe, Taiju desperta da sua petrifica&ccedil;&atilde;o. Agora, em um mundo moderno completamente transformado pela natureza que floresceu durante os anos que a humanidade parou, Taiju descobre que seu amigo, Senku, um jovem amante da ci&ecirc;ncia, tamb&eacute;m despertou h&aacute; algum tempo e que planeja dar in&iacute;cio ao renascimento completo da civiliza&ccedil;&atilde;o com ci&ecirc;ncia. E com sua for&ccedil;a e a intelig&ecirc;ncia de seu amigo, eles foram capazes de descobrir um m&eacute;todo para reviver os petrificados. Por&eacute;m, os planos de Senku s&atilde;o contrariados por aqueles que despertam.', 2019, 45, 2, 4, 23, 1, 1, '0.00', 0, 'TMS Entertainment', 'TOHO animation, Shueisha, 8PAN', './img/bd img/anime/dr._stone.jpg', './img/bd img/anime/8a1a4092ed3e4c1a7e5ba0ea67a88fbaDrStone.jpg', '../img/bd img/anime/banner/dr._stone.png'),
(42, 'Horimiya (Hori-san to Miyamura-kun)', 'Embora Kyouko Hori seja considerada uma aluna popular, bonita e inteligente em sua escola, Hori esconde outro lado. Como seus pais passam muito tempo fora a trabalho, os afazeres dom&eacute;sticos e os cuidados com o seu irm&atilde;o mais novo, Souta, ficam em suas m&atilde;os, fazendo com que n&atilde;o tenha tempo para socializar ou para si mesma, mantendo uma apar&ecirc;ncia desleixada fora da escola que tenta esconder a todo custo. Certo dia, Souta volta para casa machucado acompanhado de um estranho cheio de piercings que o ajudou. De primeira, Hori n&atilde;o o reconhece e o convida para entrar em sua casa, mas s&oacute; depois percebe que esse garoto &eacute; Miyamura, um colega de sala, com uma apar&ecirc;ncia completamente diferente do normal! No col&eacute;gio, o garoto parece um Otaku antisocial, com cabelo comprido e &oacute;culos, mas fora, ele &eacute; repleto de piercings, roupas descoladas e cabelo preso. Agora, Hori e Miyamura s&atilde;o aproximados pelos segredos que compartilham, encontrando semelhan&ccedil;as em comum e evoluindo uma rela&ccedil;&atilde;o de cumplicidade em amizade.', 2021, 46, 7, 27, 22, 1, 1, '0.00', 0, 'CloverWorks', 'Aniplex, Square Enix, Mainichi Broadcasting System', './img/bd img/anime/horimiya_(hori-san_to_miyamura-kun).jpg', './img/bd img/anime/bc16f6b5f7888aec4568c0549550671chorimya.jpg', '../img/bd img/anime/banner/horimiya_(hori-san_to_miyamura-kun).png'),
(43, 'Gake no Ue no Ponyo', 'Certa manh&atilde;, enquanto brincava na praia, Sousuke encontra uma peixinha dourada presa em uma garrafa e resolve levar ela para a sua casa para cuidar dela. Ap&oacute;s ela lamber um machucado em seu dedo, Sousuke a nomeia como Ponyo e promete proteg&ecirc;-la para sempre. O problema &eacute; que Ponyo &eacute; filha de Fujimoto, um poderoso feiticeiro que abandonou a humanidade para viver embaixo d&rsquo;&aacute;gua. Seu pai a captura e a leva para &agrave;s profundezas do mar. Por&eacute;m, Ponyo decidida a viver ao lado de seu novo amigo, acaba criando bra&ccedil;os e pernas devido ao sangue de Sousuke e foge novamente para a superf&iacute;cie, derramando acidentalmente uma po&ccedil;&atilde;o m&aacute;gica no mar, causando grandes ondas que amea&ccedil;am inundar a vila onde Sousuke mora. Uma amizade formada entre o oceano e a humanidade agora sofre as responsabilidades de seus la&ccedil;os e que para restaurar a ordem do mundo novamente, tem que passar por antigo teste para deixar Ponyo viver como uma humana.', 2008, 47, 2, 9, 1, 1, 1, '0.00', 0, 'Ghibli', 'Dentsu, d-rights, Toho', './img/bd img/anime/gake_no_ue_no_ponyo.jpg', './img/bd img/anime/9588ea4aea4de875821a19e328f81519Ponyo.jpg', '../img/bd img/anime/banner/gake_no_ue_no_ponyo.png'),
(44, 'Tonari no Totoro', 'No Jap&atilde;o p&oacute;s-guerra rural, um professor e suas duas filhas, Satsuki e Mei, se mudam para o campo para ficar mais perto do hospital onde sua m&atilde;e est&aacute; internada devido a uma doen&ccedil;a prolongada. Um dia, enquanto a pequena Mei estava brincando no jardim, ela acaba encontrando uma pequena passagem que a leva a um lend&aacute;rio esp&iacute;rito da floresta conhecido como Totoro, que se torna amigo das duas irm&atilde;s. Com o tempo, a vida dessas garotas se transforma em uma verdadeira aventura fant&aacute;stica repleta de criaturas m&iacute;sticas da floresta.', 1988, 20, 2, 9, 28, 1, 1, '0.00', 1, 'Ghibli', 'Studio Fantasia, Streamline Pictures', './img/bd img/anime/tonari_no_totoro.jpg', './img/bd img/anime/08ce999e604c9590eeeea3420e7a8f88totoro.jpg', '../img/bd img/anime/banner/tonari_no_totoro.png'),
(45, 'Sen to Chihiro no Kamikakushi', 'Chihiro &eacute; uma garota de 10 anos ing&ecirc;nua, mimada e teimosa. Ela fica nada contente por saber que vai se mudar de cidade, e durante o caminho para a nova casa, ela e seus pais se deparam com uma cidade abandonada, onde no caminho encontram uma mesa repleta de comida. Aventurando-se pelas ruas, Chihiro encontra Haku, um garoto que lhe diz para ir embora imediatamente e ao reencontrar seus pais, ela fica surpresa ao v&ecirc;-los transformados em porcos. Ao anoitecer, apari&ccedil;&otilde;es fantasmag&oacute;ricas come&ccedil;am a aparecer e Chihiro, involuntariamente, cruza para o mundo espiritual. Agora, ela precisa ganhar coragem para trabalhar e se aventurar entre os esp&iacute;ritos para conseguir salvar seus pais e sair desse mundo.', 2001, 48, 2, 9, 28, 1, 1, '0.00', 0, 'Ghibli', 'Toho', './img/bd img/anime/sen_to_chihiro_no_kamikakushi.jpg', './img/bd img/anime/f949d25da234c8c56a018aa009566656Chihiro.jpg', '../img/bd img/anime/banner/sen_to_chihiro_no_kamikakushi.png'),
(46, 'Dragon Ball Super', 'Sete anos se passaram ap&oacute;s os acontecimentos do Dragon Ball Z, o mundo est&aacute; em paz, e nenhum perigo impede a vida dos humanos. Mas a paz n&atilde;o durou, um inimigo poderos&iacute;ssimo desperta nos confina do universo: Beerus, o implac&aacute;vel Deus da Destrui&ccedil;&atilde;o. Perturbado por uma profecia que visava sua derrota pelas m&atilde;os de um &ldquo;Super Saiyajin Deus&rdquo;, Beerus e seu atendente angelical Whis come&ccedil;ou a explorar o universo para encontrar o dito cujo que lhe derrotaria. N&atilde;o obstante, eles alcan&ccedil;am a Terra e encontram-se com Son Goku, a figura mais poderosa do planeta.', 2015, 49, 3, 2, 4, 9, 26, '0.00', 0, 'Toei Animation', 'Yomiko Advertising, Fuji TV', './img/bd img/anime/dragon_ball_super.jpg', './img/bd img/anime/f1d937acafb45dbc6e40b7efdab600f2dragonballsuper.jpg', '../img/bd img/anime/banner/dragon_ball_super.png'),
(47, 'Steins;Gate', 'No ver&atilde;o de 2010, Rintarou Okabe, autoproclamado como &lsquo;cientista louco&rsquo;, funda o laborat&oacute;rio de Experimentos do Futuro com seu amigo do col&eacute;gio, Itaru Hashida e sua amiga de inf&acirc;ncia, Mayuri Shiina. Com uma sede infinita de explora&ccedil;&atilde;o cient&iacute;fica, Okabe passa seu tempo tentando desenvolver suas inven&ccedil;&otilde;es no laborat&oacute;rio, na busca de se tornar um cientista famoso. No entanto, o &uacute;nico experimento que tinham era um micro-ondas que transformava alimentos em gosma. Ap&oacute;s participar da confer&ecirc;ncia do neurocientista Kurisu Makise sobre viagens no tempo, Okabe percebe que seu &ldquo;telefone micro-ondas&rdquo; &eacute; mais do que aparenta. Ele descobre que sua inven&ccedil;&atilde;o tem a capacidade de mandar mensagens para o passado, se envolvendo cada vez mais com essa &lsquo;m&aacute;quina do tempo&rsquo;. Por&eacute;m, isso acaba atraindo a aten&ccedil;&atilde;o de uma perigosa organiza&ccedil;&atilde;o, a SERN.', 2011, 50, 5, 23, 29, 18, 21, '0.00', 0, 'White Fox', 'Frontier Works, Media Factory, Movic, AT-X, Kadoka', 'bx9253-7pdcVzQSkKxT.jpg', './img/bd img/anime/bx9253-7pdcVzQSkKxT.jpg', '../img/bd img/anime/banner/steins;gate.png'),
(48, 'Monster', 'Dr. Tenma &eacute; um renomado neurocirurgi&atilde;o descendente de japoneses que trabalha em um famoso hospital na Europa. Com toda a sua reputa&ccedil;&atilde;o, o cirurgi&atilde;o &eacute; frequentemente elogiado por outros profissionais como uma das grandes mentes que ir&atilde;o revolucionar a medicina. Tenma est&aacute; &agrave; beira de se casar e receber uma grande promo&ccedil;&atilde;o no hospital onde trabalha, no entanto, de repente ele se v&ecirc; em uma situa&ccedil;&atilde;o cr&iacute;tica onde precisa escolher entre a vida de uma crian&ccedil;a ou a do prefeito Roedecker. Apesar de ter sido pressionado por seus superiores a realizar a cirurgia no prefeito, sua moral o for&ccedil;a a deix&aacute;-lo morrer e salvar a crian&ccedil;a. Nesse momento, a vida do neurocirurgi&atilde;o toma outro rumo, perdendo tudo que ele obteve. Por&eacute;m, a cren&ccedil;a do doutor de que toda vida tem o mesmo valor &eacute; posta em prova quando uma s&eacute;rie de assassinatos ocorrem nas proximidades dele, onde todas as evid&ecirc;ncias apontam para a crian&ccedil;a que ele salvou.', 2004, 51, 5, 29, 18, 24, 1, '0.00', 0, 'Madhouse', 'VAP, Shogakukan-Shueisha Productions, Nippon Telev', 'bx19-ham53gnijfiN.jpg', './img/bd img/anime/bx19-ham53gnijfiN.jpg', '../img/bd img/anime/banner/monster.png'),
(49, 'Ajin', 'H&aacute; 17 anos na &Aacute;frica, surgiu uma ra&ccedil;a nova de humanos imortais, chamados de aijin, que se tornaram ilegais na sociedade e se caso encontrados, deveriam ser levados sob cust&oacute;dia imediatamente. Kei Nagai &eacute; um estudande de 17 anos que almeja se tornar um m&eacute;dico. Nunca tendo procurado saber sobre os aijins, Kei nutri uma vis&atilde;o ignorante sobre essa ra&ccedil;a, n&atilde;o se importando com as aulas da escola que demonizam esses humanos imortais. No entanto, em um dia comum, Kei &eacute; atropelado e morre. Mas para a surpresa de todos, ele renasceu como ajin. Agora, com sua vida ca&oacute;tica, fugindo de todos, Kei logo percebe que sua esp&eacute;cie pode estar muito mais pr&oacute;xima do que ele imagina.', 2016, 52, 3, 4, 18, 28, 24, '0.00', 0, 'Polygon Pictures', 'Mainichi Broadcasting System, Kodansha, KlockWorx,', 'bx21341-Pyc7SkMEuGsl.jpg', './img/bd img/anime/bx21341-Pyc7SkMEuGsl.jpg', '../img/bd img/anime/banner/ajin.png'),
(50, 'Odd Taxi', 'Hiroshi Odokawa &eacute; uma morsa antissocial cabe&ccedil;a-dura, que vive uma vida mundana como motorista de taxi, sempre conhecendo clientes peculiares, como: Kabasawa, o estudante de faculdade que quer ser famoso online; Shirakawa, a enfermeira cheia de segredos; Homosapiens, uma dupla de humoristas numa mar&eacute; de azar; Dobu, um malandro da vizinhan&ccedil;a e Mystery Kiss, um grupo idol rec&eacute;m-formado. E &eacute; nessas conversas nada normais durante seu trabalho, que Hiroshi v&ecirc; sua vida ligada ao desaparecimento de uma garota.', 2021, 53, 18, 4, 1, 1, 1, '0.00', 0, 'OLM, P.I.C.S.', 'TV Tokyo, Dentsu, Pony Canyon, AT-X, Crunchyroll, ', 'bx128547-TWRVIu5zRTYx.jpg', './img/bd img/anime/bx128547-TWRVIu5zRTYx.jpg', '../img/bd img/anime/banner/odd_taxi.png'),
(51, 'Mirai Nikki', 'Yukiteru Amano &eacute; um jovem um tanto estranho, sem habilidades sociais, que passa seu tempo escrevendo em seu di&aacute;rio ou dentro de seu mundo imagin&aacute;rio conversando com seus dois amigos inventados, o Deus do tempo e espa&ccedil;o, Ex Machina, e sua assistente Muru-Muru. Por&eacute;m, certo dia, sua fantasia viram realidade, quando Yukiteru ganha desse &lsquo;Deus&rsquo; o poder de prever o futuro no di&aacute;rio do seu celular. No entanto, ele n&atilde;o &eacute; o &uacute;nico, ao descobrir que sua colega, Yuno Gasai, tamb&eacute;m possui um di&aacute;rio semelhante, e que eles devem se unir para sobreviver em um jogo sangrento envolvendo outros usu&aacute;rios de di&aacute;rio, onde o vencedor se torna o novo sucessor de Ex Machina.', 2011, 54, 3, 29, 21, 28, 1, '0.00', 0, 'Asread', 'Lantis, Kadokawa Shoten, Rakuonsha, Kadokawa Pictu', 'bx10620-OMnOMuZBgEKy.png', './img/bd img/anime/bx10620-OMnOMuZBgEKy.png', '../img/bd img/anime/banner/mirai_nikki.png');
INSERT INTO `animes` (`idAnime`, `nomeAnime`, `sinopseAnime`, `anoAnime`, `rankingAnime`, `gen1_FK`, `gen2_FK`, `gen3_FK`, `gen4_FK`, `gen5_FK`, `avaliacaoAnime`, `favoritosAnime`, `estudioAnime`, `produtorAnime`, `imagemAnime`, `pathImgAnime`, `bannerAnime`) VALUES
(52, 'Death Parade', 'Ap&oacute;s a morte, o c&eacute;u ou o inferno aguardam a maiorias das almas humanas. No entanto, quando duas pessoas morrem ao mesmo tempo, elas s&atilde;o mandadas para o Quindecim, um bar onde o bartender de cabelos brancos, chamado Decim, trabalha e atua como &aacute;rbitro. Nesse lugar, todos que v&atilde;o parar nele s&atilde;o desafiados a v&aacute;rios jogos mortais, onde suas personalidades s&atilde;o reveladas e no final, o juiz decide se eles ser&atilde;o mandados para a reencarna&ccedil;&atilde;o ou para o vazio.', 2015, 55, 5, 28, 18, 21, 29, '0.00', 0, 'Madhouse', 'VAP, DAX Production, Nippon Television Network', 'nx20931-bktYqOcxPERi.jpg', './img/bd img/anime/nx20931-bktYqOcxPERi.jpg', '../img/bd img/anime/banner/death_parade.png'),
(53, 'Yakusoku no Neverland', 'Cercada por uma floresta, o orfanato Grace Field &eacute; habitado por crian&ccedil;as &oacute;rf&atilde;os que vivem felizes sua vida como uma fam&iacute;lia, cuidada por Isabella, sua &lsquo;mam&atilde;e&rsquo;. Embora a vida doce e aconchegante, eles passam seus dias fazendo testes rigorosos para testar suas capacidades. Al&eacute;m disso, todo o m&ecirc;s uma crian&ccedil;a &eacute; adotada e nunca mais &eacute; vista. Norman e Emma, os dois &oacute;rf&atilde;os com as maiores pontua&ccedil;&otilde;es nos testes, descobrem a verdadeira realidade sombria desse orfanato e por isso, lideram sua fam&iacute;lia em uma jornada de fuga sem que a &lsquo;mam&atilde;e&rsquo; descubra seus planos.', 2019, 21, 18, 23, 29, 28, 1, '0.00', 1, 'CloverWorks', 'Aniplex, Dentsu, Fuji TV, Shueisha, CA-Cygames Ani', 'bx101759-NhSwxv7HY9y9.jpg', './img/bd img/anime/bx101759-NhSwxv7HY9y9.jpg', '../img/bd img/anime/banner/yakusoku_no_neverland.png'),
(54, 'Bastard!! Ankoku no Hakaishin', 'No reino de metallicana acompanhamos a aventura de Yoko, a filha do grande sacerdote e seu amigo de inf&acirc;ncia Lucien, um menino que divide seu corpo com um poderoso mago. Para salvar o reino de for&ccedil;as malignas que amea&ccedil;am sua destrui&ccedil;&atilde;o, Tia Noto Yoko precisa decidir se deve ou n&atilde;o ressuscitar um antigo e poderoso mago que no passado tentou dominar o mundo e agora est&aacute; preso no corpo de Lucien, e a &uacute;nica coisa que pode libert&aacute;-lo &eacute; o beijo de uma virgem.', 2022, 56, 3, 2, 6, 4, 9, '0.00', 0, 'LIDENFILMS', 'Warner Bros. Japan, Shueisha', 'Bastard.jpg', './img/bd img/anime/Bastard.jpg', '../img/bd img/anime/banner/bastard!!_ankoku_no_hakaishin.png'),
(55, 'Highschool DxD', 'O estudante est&uacute;pido e pervertido Issei Hyoudou passa sua vida espiando garotas nos banheiros sem nenhuma perspectiva de vida, e que sonha em conquistar uma garota. As coisas finalmente melhoram quando Issei &eacute; convidado para sair por uma linda colegial da sua escola. Por&eacute;m, em seu primeiro encontro, ela se revela como um ano ca&iacute;do chamado Reinare, que o mata brutalmente. No entanto, em seus &uacute;ltimos momentos, ele &eacute; salvo pela garota mais bonita da escola, Rias Gremory, um dem&ocirc;nio de primeira classe que o revive como um dem&ocirc;nio subordinado a ela. Agora, sob as ordens de sua senpai, Issei deve treinar para sobreviver nesse novo mundo e realizar seu novo desejo de se tornar rei de um Har&eacute;m.', 2012, 57, 3, 4, 7, 11, 6, '0.00', 0, 'TNK', 'Genco, Lenses, AT-X, PRA, Showgate, Moses Workshop', 'HighschoolDXD.jpg', './img/bd img/anime/HighschoolDXD.jpg', '../img/bd img/anime/banner/highschool_dxd.png'),
(56, 'Yuri!!! on Ice', 'Ap&oacute;s sofrer uma amarga derrota no Grand Prix Finale e perder a chance de levar o Jap&atilde;o &agrave; vit&oacute;ria na competi&ccedil;&atilde;o de patina&ccedil;&atilde;o de gelo, Yuuri Katsuki, um jovem atleta promissor, entra em uma dualidade se deve ou n&atilde;o continuar sua carreira na patina&ccedil;&atilde;o. De volta ao seu lar em Kyushu, Yuuri confina-se na casa de seus pais, engordando e deixando-se desmotivar de seus sonhos no esporte. Por&eacute;m, tudo parece mudar quando um v&iacute;deo de Yuuri executando uma das performances do pentacampe&atilde;o, Victor Nikiforov, se torna viral na internet. Chamando a aten&ccedil;&atilde;o de seu &iacute;dolo, Victor aparece de repente em sua casa, propondo ser seu novo t&eacute;cnico para prepar&aacute;-lo para o cen&aacute;rio mundial de patina&ccedil;&atilde;o. No entanto, sua jornada n&atilde;o &eacute; f&aacute;cil e est&aacute; repleta de fortes atletas, como Yuri Plisetsky, que est&aacute; determinado a derrot&aacute;-lo e conseguir seu mentor novamente.', 2016, 58, 4, 8, 22, 27, 1, '0.00', 0, 'MAPPA', 'Dentsu, TV Asahi, Movic, Avex Pictures, CIC, Cygam', 'YuriOnIce.png', './img/bd img/anime/YuriOnIce.png', '../img/bd img/anime/banner/yuri!!!_on_ice.png'),
(57, 'Shokugeki no Soma', 'Desde muito novo, Yukihira Souma trabalhou ao lado de seu pai, Jouichirou, na cozinha como sous chef no restaurante da fam&iacute;lia. Ao longo dos anos, Souma foi desenvolvendo uma paix&atilde;o pela culin&aacute;ria, e o sonho de se tornar o chef principal do restaurante de seu pai, o Yukihira, se tornou mais forte. Por&eacute;m, de repente, Jouichirou decide fechar o restaurante para testar suas habilidades na Europa e envia a Souma uma proposta: Sobreviver na Academia Culin&aacute;ria Tootsuki, uma escola de gastronomia renomada, que apenas 10% dos alunos conseguem se formar. Esse col&eacute;gio &eacute; famoso pelo &quot;Shougeki&quot;, uma competi&ccedil;&atilde;o de comida feita para resolver discuss&otilde;es ou debates. Agora, com seu sonho novamente reacendido pelo desafio de seu pai, Souma e seus colegas ter&atilde;o que sobreviver a nova vida na Tootsuki se eles quiserem ter a chance de realizar seus sonhos.', 2015, 59, 4, 7, 6, 1, 1, '0.00', 0, 'J.C.Staff', 'Dentsu, Frontier Works, Mainichi Broadcasting Syst', 'ShokugekiNoSouma.jpg', './img/bd img/anime/ShokugekiNoSouma.jpg', '../img/bd img/anime/banner/shokugeki_no_soma.png'),
(58, 'Blood-C', 'Levando uma vida pacata de colegial durante o dia, Saya Kisaragi, uma jovem que mora sozinha em um templo com o pai, esconde uma vida dividida: ao anoitecer, ela se torna uma tem&iacute;vel ca&ccedil;adora de monstros, chamados Furukimonos. Usando a espada cerimonial sagrada dada por seu pai, Saya cumpri seu dever em proteger sua vila contra essas criaturas bizarras. Por&eacute;m, sua realidade e tudo o que acredita &eacute; colocado &agrave; prova, onde Saya parte para encontrar um caminho para descobrir a verdade e sua real amea&ccedil;a.', 2011, 60, 3, 24, 30, 18, 28, '0.00', 0, 'Production I.G', 'Aniplex, Mainichi Broadcasting System, Dwango', 'Blood-C.jpg', './img/bd img/anime/Blood-C.jpg', '../img/bd img/anime/banner/blood-c.png'),
(59, 'Another', 'Kouichi Sakakibara &eacute; transferido para o col&eacute;gio Yomiyama Norte ap&oacute;s voltar de uma licen&ccedil;a m&eacute;dica. Em sua nova turma, a 3-3, ele se v&ecirc; atra&iacute;do por Misaki Mei, uma colega de sala com um tapa-olho, onde nenhum de seus colegas conseguem ver Misaki, alertando-o a parar de falar com pessoas que n&atilde;o existem. No entanto, a fim de achar respostas, Sakakibara confronta Mei e acaba descobrindo o segredo daquela turma: movidos pelo medo, os alunos acreditam estar presos em uma maldi&ccedil;&atilde;o que come&ccedil;ou h&aacute; 23 anos. Com a sua chegada na escola, a maldi&ccedil;&atilde;o parece ter sido despertada e coisas ruins come&ccedil;am a acontecer, e Sakakibara e Mei precisam desvendar esse mist&eacute;rio para evitar que mais trag&eacute;dias aconte&ccedil;am.', 2012, 61, 30, 18, 21, 29, 7, '0.00', 0, 'P.A Works', 'Lantis, Kadokawa Shoten, Toho, KlockWorx, Bandai N', 'Another.png', './img/bd img/anime/Another.png', '../img/bd img/anime/banner/another.png'),
(60, 'Re: Zero Kara Hajimeru Isekai Seikatsu', 'Enquanto sa&iacute;a de uma loja de conveni&ecirc;ncia, Natsuki Subaru &eacute; convocado para um mundo de fantasia isekai. Sem saber os motivos para aquilo acontecer, Subaru apenas acredita ser o novo her&oacute;i desse lugar, o Reino Lugnica. Entretanto, durante o seu caminho, ele &eacute; espancado por um grupo de bandido, mas &eacute; salvo por uma linda garota de olhos ametista chamada Emillia. Como forma de agradecimento, Subaru decide ajudar a garota a encontrar sua ins&iacute;gnia roubada. No entanto, &agrave; medida que continuam, for&ccedil;as malignas perseguem os dois e eles acabam sendo brutalmente assassinados. Por&eacute;m, Subaru imediatamente desperta no mesmo lugar aonde havia chegado no reino, e conforme ele refaz seus passos, ele &eacute; morto continuamente e retorna sempre so seu ponto de partida, inexplicavelmente.', 2016, 62, 9, 21, 5, 1, 1, '0.00', 0, 'White Fox', 'TV Tokyo, Media Factory, Kadokawa Shoten, AT-X, Ma', 'ReZero.jpg', './img/bd img/anime/ReZero.jpg', '../img/bd img/anime/banner/re:_zero_kara_hajimeru_isekai_seikatsu.png'),
(61, '86:Eighty-Six', 'H&aacute; 9 anos, a rep&uacute;blica de San Magn&oacute;lia vem enfrentando uma guerra brutal contra as m&aacute;quinas do imp&eacute;rio de Giadian. E para manter seus cidad&atilde;os em seguran&ccedil;a dentro das muralhas, o governo e a for&ccedil;as militares desenvolveram uma tropa de drones aut&ocirc;nomos para que sejam enfrentadas sem nenhuma baixa. No entanto, isso &eacute; apenas um discurso, j&aacute; que na verdade esses drones s&atilde;o controlados por humanos de apar&ecirc;ncia diferente da parte privilegiada da popula&ccedil;&atilde;o, os Albas, conhecidos pelos seus cabelos brancos, pele e olhos claros. Essa pequena minoria da rep&uacute;blica &eacute; for&ccedil;ada a lutar por San Magn&oacute;lia, sob o nome de &lsquo;fac&ccedil;&atilde;o oitenta e seis&rsquo;. A Major Vladilena Miliz&eacute;, uma nobre alba e oficial militar, &eacute; designada a comandar a tropa 86, por&eacute;m, diferente de seus colegas, Miliz&eacute; &eacute; contra essa discrimina&ccedil;&atilde;o do governo e apoia os eighty-six. Sob o posto de comandante dessa fac&ccedil;&atilde;o, Miliz&eacute; tem seu destino entrela&ccedil;ado com o &uacute;nico sobrevivente de todos os esquadr&otilde;es, Shinei Nouzen (o coveiro), e isso pode ser o come&ccedil;o da chama para a liberdade e a salva&ccedil;&atilde;o.', 2021, 63, 3, 5, 17, 16, 23, '0.00', 0, 'A-1 Pictures', 'Aniplex, Kadokawa, Bandai Spirits', 'Eighty-Six.jpg', './img/bd img/anime/Eighty-Six.jpg', '../img/bd img/anime/banner/86:eighty-six.png'),
(62, 'Hellsing', 'Hellsing, ou Ordem Real dos Cavaleiros Protestantes, &eacute; uma organiza&ccedil;&atilde;o especializada em lidar com criaturas sobrenaturais que amea&ccedil;am o imp&eacute;rio brit&acirc;nico e a igreja protestante. A nova l&iacute;der da organiza&ccedil;&atilde;o e herdeira da fam&iacute;lia Hellsing, Integra, &eacute; a mestra de Alucard, um vampiro extremamente forte, conhecido como a &ldquo;arma secreta&rdquo; de sua ag&ecirc;ncia, que n&atilde;o hesita em matar at&eacute; mesmo os de sua ra&ccedil;a. Despachado para uma miss&atilde;o da cidade de Cheddar, Alucard conhece uma policial a beira da morte, e lhe d&aacute; a oportunidade de viver como uma vampira. Seras, como &eacute; chamada, deve aprender a viver sua nova vida e sobreviver nessa guerra entre os humanos e as criaturas sobrenaturais.', 2001, 64, 3, 30, 24, 28, 1, '0.00', 0, 'Gonzo', 'Fuji TV, Pioneer LDC', 'Hellsing.jpg', './img/bd img/anime/Hellsing.jpg', '../img/bd img/anime/banner/hellsing.png'),
(63, 'TO Love-Ru', 'O t&iacute;mido Rito Yuuki, de 16 anos, desde o colegial, n&atilde;o consegue confessar seu amor por Haruna Sairenji, sua colega de sala. E para piorar sua situa&ccedil;&atilde;o, em uma noite, enquanto tomava banho, uma misteriosa garota nua cai em sua banheira. Ela, Lala Satalin Deviluke, &eacute; uma princesa herdeira de um poderoso imp&eacute;rio alien&iacute;gena, que fugiu de um casamento arranjado. Infelizmente, Lala n&atilde;o quer retornar ao seu planeta e insiste em se casar com Rito e viver na terra para sempre, transformando a vida de Rito uma luta di&aacute;ria contra bonitas garotas alien&iacute;genas aparecendo inexplicavelmente, que amea&ccedil;am suas tentativas de confiss&atilde;o para Haruna.', 2008, 65, 4, 6, 11, 7, 23, '0.00', 0, 'Xebec', 'Geneon Universal Entertainment, TBS, Shueisha', 'ToLoveRu.png', './img/bd img/anime/ToLoveRu.png', '../img/bd img/anime/banner/to_love-ru.png'),
(64, 'Shinmai Maou no Testament', 'Basara Toujou costumava ser um ex-membro de um cl&atilde; de her&oacute;is, que agora leva uma vida comum de colegial. No entanto, ap&oacute;s seu pai se casar novamente, ele encontra uma estranha garota em seu banheiro. Basara ent&atilde;o descobre que seu pai trouxe para casa suas duas meias-irm&atilde;s, Mio e Maria. Mas essas garotas n&atilde;o s&atilde;o o que parecem, j&aacute; que se revelam como dois dem&ocirc;nios, ra&ccedil;a essa inimiga do cl&atilde; de her&oacute;is. Entretanto, Basara jura proteger suas meias-irm&atilde;s, mas com os her&oacute;is observando-o continuamente e a amea&ccedil;a de perigosos dem&ocirc;nios, Toujou deve se preparar se quiser manter sua nova fam&iacute;lia em seguran&ccedil;a.', 2015, 66, 3, 9, 6, 11, 20, '0.00', 0, 'Production IMS', 'Kadokawa Shoten, AT-X, Nippon Columbia, Kadokawa P', 'ShinmaiMaouNoTestament.png', './img/bd img/anime/ShinmaiMaouNoTestament.png', '../img/bd img/anime/banner/shinmai_maou_no_testament.png'),
(65, 'Xian Wang De Richang Shenghuo', 'Wang Ling &eacute; um humano cujo poder &eacute; praticamente ilimitado. Desde seu nascimento ele vem alcan&ccedil;ando novos dom&iacute;nios a cada 2 anos, obtendo proezas muito al&eacute;m de seu controle. Por&eacute;m, agora ele tem 16 anos e precisa encarar seu maior desafio at&eacute; agora &ndash; o ensino m&eacute;dio. Com um desafio ap&oacute;s o outro, seus planos para uma vida discreta no col&eacute;gio parecem cada vez mais distantes&hellip;', 2020, 67, 4, 9, 27, 20, 2, '0.00', 0, 'Haoliners Animation League', 'Bilibili', 'ImmortalKing.png', './img/bd img/anime/ImmortalKing.png', '../img/bd img/anime/banner/xian_wang_de_richang_shenghuo.png'),
(66, 'Kobayashi-san Chi no Maid Dragon', 'A Srta. Kobayashi &eacute; uma funcion&aacute;ria comum que leva uma vida bem banal, que mora sozinha em um pequeno apartamento, at&eacute; que ela salva a vida de um drag&atilde;o f&ecirc;mea em apuros. Esse drag&atilde;o, chamado Tohru, &eacute; capaz de se transformar numa ador&aacute;vel garota humana (com chifres e um longo rabo) que a partir do momento em que foi salva, decide que fara de tudo para retribuir seu gesto. Com esse persistente e amoroso drag&atilde;o como colega de apartamento, tudo fica mais dif&iacute;cil, e a vida normal da Srta. Kobayashi est&aacute; prestes a ir pelos ares!', 2017, 68, 4, 9, 20, 27, 22, '0.00', 0, 'Kyoto Animation', 'Lantis, Pony Canyon, ABC Animation', 'Kobayashi-san.png', './img/bd img/anime/Kobayashi-san.png', '../img/bd img/anime/banner/kobayashi-san_chi_no_maid_dragon.png'),
(67, 'Full Metal Panic!', 'Em uma era em que o terrorismo mundial amea&ccedil;a a paz da terra, a organiza&ccedil;&atilde;o militar Mithril, que possui e desenvolve dispositivos e m&aacute;quinas de alta tecnologia, &eacute; designada a uma importante miss&atilde;o: proteger Kaname Chidori, denominada como &lsquo;sussurrada&rsquo;, por possuir em sua mente o conhecimento de uma tecnologia avan&ccedil;ada capaz de produzir armas de destrui&ccedil;&atilde;o em massa. O sargento Sousuke Sagara, envolvido na miss&atilde;o, se matricula no col&eacute;gio de Kaname para monitor&aacute;-la de perto. No entanto, sua educa&ccedil;&atilde;o militar o torna dif&iacute;cil de se disfar&ccedil;ar como estudante, fazendo com que Kaname suspeite dele. Para piorar sua situa&ccedil;&atilde;o, diversos grupos terroristas iniciam seus ataques, em tentativas de emboscar e sequestrar a sussurrada, fazendo com que Sousuke abandone suas ordens para proteg&ecirc;-la.', 2002, 69, 3, 4, 17, 16, 23, '0.00', 0, 'Gonzo', 'Kadokawa Shoten, KlockWorx', 'FullMetalPanic.png', './img/bd img/anime/FullMetalPanic.png', '../img/bd img/anime/banner/full_metal_panic!.png'),
(68, 'Code Geass: Hangyaku no Lelouch', 'No ano de 2010, a poderosa Britania declara guerra ao Jap&atilde;o e o vence, anexando-o ao seu imp&eacute;rio, retirando sua liberdade, seus direitos e o renomeando como Area 11. Apesar da resist&ecirc;ncia do Jap&atilde;o, o forte dom&iacute;nio da Britania logo se estabelece, formando duas sociedades totalmente opostas: enquanto os japonese (elevens) vivem na parte miser&aacute;vel conhecida como Gueto, os britannianos residem no outro lado rico e confort&aacute;vel. Lelouch Lamperouge, um estudante britanniano, guarda um grande segredo e uma sede de vingan&ccedil;a contra o imp&eacute;rio da Britania. Infelizmente, ele se v&ecirc; preso em uma das revoltas das for&ccedil;as armadas rebeldes da Area 11, no entanto, ele &eacute; salvo por uma misteriosa mulher chamada CC, que lhe concede o Gueass, &ldquo;O Poder dos Reis&rdquo;. Com seu novo &ldquo;poder da obedi&ecirc;ncia absoluta&rdquo;, Lelouch assume a identidade de um vigilante mascarado autoproclamado Zero, que lidera a nova resist&ecirc;ncia contra o imp&eacute;rio da Britania em busca de sua vingan&ccedil;a e a liberdade do Jap&atilde;o.', 2007, 22, 3, 16, 17, 5, 20, '0.00', 1, 'Sunrise', 'Bandai Visual, Mainichi Broadcasting System, Banda', 'CodeGeass.jpg', './img/bd img/anime/CodeGeass.jpg', '../img/bd img/anime/banner/code_geass:_hangyaku_no_lelouch.png'),
(69, 'Kiseijuu: Sei no Kakuritsu', 'Parasitas alien&iacute;genas invadem o planeta para dominar a ra&ccedil;a humana, se infiltrando em seus corpos e enterrando-se no c&eacute;rebro dos mais vulner&aacute;veis. Izumi Shinichi, um estudante do ensino m&eacute;dio, &eacute; atacado por Migi, um desses extraterrestres, por&eacute;m, ele &eacute; impedido e s&oacute; consegue dominar seu bra&ccedil;o. Incapaz de possuir seu hospedeiro, Migi e Izumi formam uma alian&ccedil;a para poderem coexistirem juntos, onde devem sobreviver aos ataques de parasitas hostis se Izumi quiser erradicar essa nova amea&ccedil;a &aacute; sua esp&eacute;cie e proteger sua fam&iacute;lia.', 2014, 70, 3, 30, 24, 28, 21, '0.00', 0, 'Madhouse', 'VAP, Kodansha, Nippon Television Network, Forecast', 'Kiseijuu.jpg', './img/bd img/anime/Kiseijuu.jpg', '../img/bd img/anime/banner/kiseijuu:_sei_no_kakuritsu.png'),
(70, 'Free!', 'Haruka Nanase ama a nata&ccedil;&atilde;o. Durante a escola prim&aacute;ria, ele e seus amigos, Rin Matsuoka, Nagisa Hazuki e Makoto Tachibana competiram e ganharam um campeonato de nata&ccedil;&atilde;o. Ap&oacute;s reivindicarem sua vit&oacute;ria, os quatros amigos seguiram caminhos separados. Anos depois, agora como estudantes do ensino m&eacute;dio, eles se reencontram; por&eacute;m, al&eacute;m de Rin estudar em outra escola, nada &eacute; mais importante do que provar que ele &eacute; um melhor nadador do que Haruka, prometendo derrotar seus ex-amigos no pr&oacute;ximo torneio de nata&ccedil;&atilde;o. Ap&oacute;s o amargo reencontro, eles se re&uacute;nem e decidem formar o Iwatobi High School Swim Club, trazendo Rei Ryuugazaki, um ex-atleta de atletismo, como o quarto membro da equipe para poderem participar da competi&ccedil;&atilde;o. Uma jornada nada f&aacute;cil, onde devem treinar intensamente para alcan&ccedil;ar o topo e resolver as intrigas entre Rin e Haruka.', 2013, 71, 7, 8, 27, 1, 1, '0.00', 0, 'Kyoto Animation, Animation Do', 'Lantis, Iwatobi High School Swimming Club, Asahi B', 'Free!.png', './img/bd img/anime/Free!.png', '../img/bd img/anime/banner/free!.png'),
(71, 'Gantz', 'Ap&oacute;s muitos anos, Kei Kurono e Katou Masaru, dois amigos de inf&acirc;ncia, se reencontram em uma esta&ccedil;&atilde;o de metr&ocirc;. No entanto, durante o encontro, um mendigo cai nos trilhos do trem e fica preso. Sendo um jovem individualista e ego&iacute;sta, Kei Kurono se v&ecirc; obrigado a ajudar o b&ecirc;bado ao ver seu amigo tentar retir&aacute;-lo dos trilhos, mas o trem come&ccedil;a a se aproximar e antes que conseguissem se salvar, eles s&atilde;o atingidos bruscamente. Ambos morrem e v&atilde;o parar em uma sala com uma esfera negra no centro chamada Gantz, que lhe concedem a chance de viver por uma segunda vez, entretanto, essa d&aacute;diva tem um pre&ccedil;o: participarem de um jogo de sobreviv&ecirc;ncia, onde devem eliminar criaturas perigosas se quiserem voltar para casa at&eacute; serem convocados novamente.', 2004, 72, 3, 6, 24, 30, 21, '0.00', 0, 'Gonzo', 'Fuji TV', 'Gantz.jpg', './img/bd img/anime/Gantz.jpg', '../img/bd img/anime/banner/gantz.png'),
(72, 'Shingeki no Kyojin', 'S&eacute;culos atr&aacute;s, a humanidade foi quase extinta por seres gigantes que se alimentam de carne humana, conhecidos como tit&atilde;s. Os remanescentes da humanidade constru&iacute;ram enormes muralhas para se manterem a salvo dessas criaturas, resultando em cem anos de paz. No entanto, essa calmaria &eacute; quebrada com a chegada do tit&atilde; colossal e o tit&atilde; encoura&ccedil;ado, que provocam a destrui&ccedil;&atilde;o da cidade. A hist&oacute;ria gira em torno de Eren Jaeger, um jovem que promete matar todos os tit&atilde;s ap&oacute;s sua m&atilde;e ser morta no rompimento do port&atilde;o da muralha Maria. Para buscar sua vingan&ccedil;a e libertar a humanidade, ele, sua irm&atilde; adotiva Mikasa e seu amigo de inf&acirc;ncia Armin, se juntam a divis&atilde;o de reconhecimento, um grupo de elite que desvendam o mundo afora lutando contra os tit&atilde;s.', 2013, 23, 3, 12, 17, 26, 5, '0.00', 1, 'Wit Studios', 'Production IG, Dentsu, Mainichi Broadcasting Syste', 'ShingekiNoKyojin.jpg', './img/bd img/anime/ShingekiNoKyojin.jpg', '../img/bd img/anime/banner/shingeki_no_kyojin.png'),
(73, 'Inazuma Eleven', 'Mamoru Endo &eacute; um garoto apaixonado por futebol e tem o sonho de se tornar um dos melhores jogadores do mundo, como seu av&ocirc;. Quando o clube de futebol da escola Raimon est&aacute; quase sendo dissolvido, como neto do ex-goleiro da Inazuma Eleven, Mamoru est&aacute; decidido a colocar o time de volta em forma. Para conseguir isso, ele deposita toda sua esperan&ccedil;a em Shuuya Gouenji, um habilidoso jogador que desistiu do futebol. Com sua determina&ccedil;&atilde;o, Mamoru tenta convencer seus recrutas e Shuuya a reconstitu&iacute;rem o time, convencido a se tornarem os melhores no futebol.', 2008, 73, 8, 4, 20, 26, 1, '0.00', 0, 'OLM', 'TV Tokyo, Dentsu, Half H.P Studio', 'InazumaEleven.png', './img/bd img/anime/InazumaEleven.png', '../img/bd img/anime/banner/inazuma_eleven.png'),
(74, 'Elfen Lied', 'Nesse mundo, uma ra&ccedil;a especial de humanos surgiu inexplicavelmente, conhecidos como &ldquo;Diclonius&rdquo;. Lucy, nascida com pequenos chifres e poderes telecin&eacute;ticos, &eacute; uma diclonius v&iacute;tima de experimentos desumanos do governo. Por&eacute;m, certo dia, se aproveitando da oportunidade de escapar, Lucy, corrompida pelas torturas enfrentadas, extermina todos seus captores enquanto escapa. No entanto, durante sua fuga, ela sofre um traumatismo craniano que a faz desenvolver uma dupla personalidade: inocente e de fala e mem&oacute;ria limitada. Enquanto voltavam da universidade, Kouta e seu primo Yuka se deparam com Lucy bastante debilitada e resolvem lev&aacute;-la para sua casa, sem saber que a jovem garota inocente e inofensiva &eacute; uma mutante fugitiva com tend&ecirc;ncias assassinas, que os far&aacute; embarcar em uma jornada perigosa de conspira&ccedil;&atilde;o governamentais.', 2004, 74, 3, 30, 24, 22, 21, '0.00', 0, 'Arms', 'VAP, Genco, Studio Guts', 'ElfenLied.png', './img/bd img/anime/ElfenLied.png', '../img/bd img/anime/banner/elfen_lied.png'),
(75, 'Kenpuu Denki Berserk', 'Vindo de uma vida dif&iacute;cil marcada pela guerra, Guts &eacute; um jovem mercen&aacute;rio que carrega uma enorme espada. Com um temperamento desconfiado e acostumado a viver uma vida solit&aacute;ria, Guts aceita qualquer tipo de trabalho contanto que receba bem, mas nunca fica por muito tempo. At&eacute; encontrar o bando do falc&atilde;o, que o embosca e o faz lutar com eles, o que chama a aten&ccedil;&atilde;o do l&iacute;der do bando, Griffith, que se interessa por Guts e duela com ele. Depois derrot&aacute;-lo, Guts, bastante incapacitado, &eacute; levado ao acampamento para se recuperar. Dois dias depois, ele confronta novamente Griffith que aceita o duelo novamente, contanto que Guts entre para o bando se perder. Devido a sua m&aacute; recupera&ccedil;&atilde;o, Guts perde a luta e se torna um integrante dos falc&otilde;es. Ap&oacute;s anos juntos, agora como um comandante do reconhecido bando dos falc&otilde;es, liderados por Griffith, um destino sombrio parece os cercar, e a amea&ccedil;a de mudar sua vida drasticamente parece estar mais perto do que imagina.', 1997, 75, 3, 17, 12, 24, 28, '0.00', 0, 'OLM', 'VAP, Hakusensha, Nippon Television Network', 'Berserke.jpg', './img/bd img/anime/Berserke.jpg', '../img/bd img/anime/banner/kenpuu_denki_berserk.png');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `avaliacao`
--

INSERT INTO `avaliacao` (`idAvaliacao`, `id_Anime_FK`, `id_User_FK`, `likesAvaliacao`, `notaAvaliacao`, `textoComentario`) VALUES
(14, 1, 2, -4, 1, 'Sou esquizofrenico'),
(15, 1, 1, 0, 5, 'aaaaaaaaaaa'),
(16, 10, 4, 0, 3, 'Mano o cara passou por tudo isso s&oacute; pq &eacute; gado kkkk'),
(17, 1, 4, 0, 5, 'Obra de arte, por pouco n&atilde;o &eacute; melhor que Dragon Ball GT!'),
(18, 10, 5, 0, 5, 'simplesmente mt bom'),
(19, 1, 5, 0, 1, 'sucumba');

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncias`
--

CREATE TABLE `denuncias` (
  `idDenuncia` int(11) NOT NULL,
  `categoriaDenuncia` varchar(30) NOT NULL,
  `textoDenuncia` varchar(200) NOT NULL,
  `id_denunciante_FK` int(11) NOT NULL,
  `id_denunciado_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `denuncias`
--

INSERT INTO `denuncias` (`idDenuncia`, `categoriaDenuncia`, `textoDenuncia`, `id_denunciante_FK`, `id_denunciado_FK`) VALUES
(1, '0', 'aaaaaaaaaabbbbb', 1, 2),
(2, 'abuso verbal', 'aaaaaaaac', 1, 2),
(3, 'abuso verbal', 'aaaaaaaaaaaxd', 1, 2),
(4, 'discurso de &oacute;dio', 'aaaaaaaaaaaaaxd2', 1, 2),
(5, 'outro', 'xddd3', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `idFav` int(11) NOT NULL,
  `id_Anime_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `favoritos`
--

INSERT INTO `favoritos` (`idFav`, `id_Anime_FK`, `id_User_FK`) VALUES
(1, 1, 1),
(11, 1, 4),
(2, 2, 1),
(23, 3, 5),
(36, 4, 5),
(10, 6, 4),
(25, 6, 5),
(3, 10, 4),
(19, 10, 5),
(33, 12, 5),
(4, 15, 4),
(7, 16, 4),
(27, 18, 5),
(5, 21, 4),
(20, 22, 5),
(29, 23, 5),
(6, 25, 4),
(30, 31, 5),
(24, 32, 5),
(21, 35, 5),
(32, 36, 5),
(8, 37, 4),
(9, 44, 4),
(37, 53, 5),
(22, 68, 5),
(34, 72, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL,
  `nomeGenero` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
-- Estrutura da tabela `likes1`
--

CREATE TABLE `likes1` (
  `idLikes1` int(11) NOT NULL,
  `id_Comentario_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `likes1`
--

INSERT INTO `likes1` (`idLikes1`, `id_Comentario_FK`, `id_User_FK`) VALUES
(14, 14, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `likes2`
--

CREATE TABLE `likes2` (
  `idLikes2` int(11) NOT NULL,
  `id_Resposta_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `likes2`
--

INSERT INTO `likes2` (`idLikes2`, `id_Resposta_FK`, `id_User_FK`) VALUES
(25, 1, 1),
(26, 2, 1),
(24, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta`
--

CREATE TABLE `resposta` (
  `idResp` int(11) NOT NULL,
  `id_Comentario_FK` int(11) NOT NULL,
  `id_User_FK` int(11) NOT NULL,
  `likesResp` int(11) NOT NULL,
  `textoResp` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `resposta`
--

INSERT INTO `resposta` (`idResp`, `id_Comentario_FK`, `id_User_FK`, `likesResp`, `textoResp`) VALUES
(1, 14, 1, 1, 'tbm acho mano'),
(2, 14, 1, 1, 'pora mano, concordo'),
(3, 14, 4, 1, 'me identifico &#039;-&#039;)-b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `nomeUser` varchar(80) NOT NULL,
  `emailUser` varchar(245) NOT NULL,
  `senhaUser` varchar(255) NOT NULL,
  `sobreUser` varchar(250) DEFAULT NULL,
  `fotoUser` varchar(500) NOT NULL,
  `bannerUser` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `nomeUser`, `emailUser`, `senhaUser`, `sobreUser`, `fotoUser`, `bannerUser`) VALUES
(1, '1conta12a', 'conta13@gmail.com', '$2y$10$sS7YLOClSEeLEZ54Cj52q.Rsq7jLbd2r/Uz.aLtsgK1j.6YzkONVi', '', './img/bd img/user/foto/foto_1_1conta12a_fushiguro.jpg', './img/bd img/user/banner/1conta12a_eldenring.jpg'),
(2, 'conta1', 'conta1@gmail.com', '$2y$10$l0FXgbHiFsZG2h0vdM0NkOK.e.Nf8fhuV81ua6ZwOG9sp7iQNjrRS', NULL, './img/bd img/user/foto/conta1_douma_oni.jpg', './img/bd img/user/banner/conta1_wallpaperflare.com_temple.jpg'),
(3, 'MaylonWolf', 'britojeremias1@gmail.com', '$2y$10$Y/gU4M0gFQaa8qhZZp.AROHUrr/lg02.jmbWiFwHXclfZ2FqqO5TG', NULL, './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(4, 'Doggoshikage_Kira', 'doggoshikagekira@gmail.com', '$2y$10$zfkKF1CdoLBOAi.YhEaWeO5HwtOheDEMFW/SRHPs.t8Z43nbi/oP.', NULL, './img/bd img/user/foto/foto_4_Doggoshikage_Kira_doggoshikge.jpg', './img/bd img/user/banner/Doggoshikage_Kira_original.png'),
(5, 'Doggo', 'diogodesouzap.barbosa@gmail.com', '$2y$10$gTZ1NyiMYsoCVmRW05FQRO1V2dw0Tb3YBjaFf0Ux3UlJ3WfM.q5ZO', '17y', './img/bd img/user/foto/foto_5_Lyzaran_Sem_Título-5.png', './img/bd img/user/banner/Lyzaran_Sem_Título-1.png'),
(6, 'contaR2', 'contaR2@gmail.com', '$2y$10$2D4zmUmoMl23fvC5h9hwbe5rn/HBlt5mZz1gw8.UOUhcoHAdA9UZi', NULL, './img/bd img/user/foto/_semfoto.jpg', './img/bd img/user/banner/_semfoto.jpg'),
(7, 'Bolsonaro2022', 'teste2022@gmail.com', '$2y$10$5xv2CRmAun7m4v2r2lgdG.G45ZD9FRwLsAZNY2PXB9KfmkVLV/c22', 'Nossa bandeira jamais ser&aacute; vermelha taokey?', './img/bd img/user/foto/foto_7_Bolsonaro2022_arma-bolsonaro-abr-e1559817270378.jpg', './img/bd img/user/banner/Bolsonaro2022_download.png');

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
-- Índices para tabela `likes1`
--
ALTER TABLE `likes1`
  ADD PRIMARY KEY (`idLikes1`),
  ADD KEY `id_Resposta_FK` (`id_Comentario_FK`,`id_User_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

--
-- Índices para tabela `likes2`
--
ALTER TABLE `likes2`
  ADD PRIMARY KEY (`idLikes2`),
  ADD KEY `id_Resposta_FK` (`id_Resposta_FK`,`id_User_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

--
-- Índices para tabela `resposta`
--
ALTER TABLE `resposta`
  ADD PRIMARY KEY (`idResp`),
  ADD KEY `id_Comentario_FK` (`id_Comentario_FK`,`id_User_FK`),
  ADD KEY `id_User_FK` (`id_User_FK`);

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
  MODIFY `idAnime` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `denuncias`
--
ALTER TABLE `denuncias`
  MODIFY `idDenuncia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `idFav` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `likes1`
--
ALTER TABLE `likes1`
  MODIFY `idLikes1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `likes2`
--
ALTER TABLE `likes2`
  MODIFY `idLikes2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `resposta`
--
ALTER TABLE `resposta`
  MODIFY `idResp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- Limitadores para a tabela `likes1`
--
ALTER TABLE `likes1`
  ADD CONSTRAINT `likes1_ibfk_1` FOREIGN KEY (`id_Comentario_FK`) REFERENCES `avaliacao` (`idAvaliacao`),
  ADD CONSTRAINT `likes1_ibfk_2` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `likes2`
--
ALTER TABLE `likes2`
  ADD CONSTRAINT `likes2_ibfk_1` FOREIGN KEY (`id_Resposta_FK`) REFERENCES `resposta` (`idResp`),
  ADD CONSTRAINT `likes2_ibfk_2` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`);

--
-- Limitadores para a tabela `resposta`
--
ALTER TABLE `resposta`
  ADD CONSTRAINT `resposta_ibfk_1` FOREIGN KEY (`id_Comentario_FK`) REFERENCES `avaliacao` (`idAvaliacao`),
  ADD CONSTRAINT `resposta_ibfk_2` FOREIGN KEY (`id_User_FK`) REFERENCES `usuario` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
