-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 17, 2021 at 06:43 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

DROP TABLE IF EXISTS `kategorije`;
CREATE TABLE IF NOT EXISTS `kategorije` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `naziv`) VALUES
(1, 'Sport'),
(2, 'Svet'),
(3, 'Zabava'),
(4, 'Kultura'),
(5, 'Hronika'),
(8, 'Muzika'),
(7, 'Drustvo'),
(6, 'Gejming');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
CREATE TABLE IF NOT EXISTS `komentari` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idVesti` int(3) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dozvoljen` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`id`, `idVesti`, `ime`, `komentar`, `vreme`, `dozvoljen`) VALUES
(63, 11, 'Žika Zivić', '66666666', '2021-02-17 18:35:00', 1),
(62, 12, 'Žika Zivić', '5555555', '2021-02-17 18:34:51', 1),
(61, 11, 'Laza Lazić', '444444444', '2021-02-17 18:34:31', 1),
(60, 12, 'Laza Lazić', '33333333333333', '2021-02-17 18:34:15', 1),
(59, 11, 'Vladan Ilić', '2222222222\r\n', '2021-02-17 18:33:34', 1),
(58, 12, 'Vladan Ilić', '1111111111111111\r\n', '2021-02-17 18:33:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `lozinka` varchar(256) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `komentar` text,
  `aktivan` int(1) NOT NULL DEFAULT '1',
  `status` enum('Administrator','Urednik','Korisnik') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `email`, `lozinka`, `vreme`, `komentar`, `aktivan`, `status`) VALUES
(1, 'Vladan', 'Ilić', 'vilic@vesti.com', 'vilic', '2021-02-14 17:00:02', '', 1, 'Administrator'),
(2, 'Pera', 'Peric', 'pperic@vesti.com', 'pperic', '2021-02-14 17:10:12', '', 1, 'Urednik'),
(3, 'Mile', 'Milić', 'mmilic@gmail.cim', 'mmilic', '2021-02-14 17:01:20', '', 1, 'Korisnik'),
(9, 'Laza', 'Lazić', 'llazic@skola.com', 'llazic', '2021-02-14 19:01:33', '', 1, 'Korisnik'),
(10, 'Žika', 'Zivić', 'zzivic@gmail.com', 'zzivic', '2021-02-14 19:05:08', '', 1, 'Korisnik'),
(14, 'Žika', 'Lazić', 'zlazic@gmail.com', 'zlazic', '2021-02-17 17:41:03', '', 1, 'Korisnik');

-- --------------------------------------------------------

--
-- Table structure for table `vesti`
--

DROP TABLE IF EXISTS `vesti`;
CREATE TABLE IF NOT EXISTS `vesti` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naslov` varchar(150) NOT NULL,
  `tekst` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` int(3) NOT NULL,
  `kategorija` int(3) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  `izmena` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pogledan` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vesti`
--

INSERT INTO `vesti` (`id`, `naslov`, `tekst`, `vreme`, `autor`, `kategorija`, `obrisan`, `izmena`, `pogledan`) VALUES
(1, 'Nole juri još jedan rekord: Federer samo ispred Đokovića', 'Na večnoj listi samo je Švajcarac Rodžer Federer zabeležio više i to 362. pobede.\r\n\r\nNovak je savladao Raonića sa 7:6, 4:6, 6:1, 6:4, i tako postao drugi igrač u open eri koji je prešao kotu 300.\r\n\r\nLista igrača sa najviše pobeda na grend slem turnirima:\r\n\r\n1. Rodžer Federer 362 pobede\r\n2. Novak Đoković 300\r\n3. Rafael Nadal 285\r\n4. Džimi Konors 233\r\n5. Andre Agasi 224\r\n6. Ivan Lendl 222\r\n7. Roj Emerson 209\r\n8. Pit Sampras 203\r\n9. Endi Mari 190\r\n10. Stefan Edberg 178…', '2021-02-14 18:43:23', 1, 1, 0, '2021-02-15 10:11:05', 4),
(2, 'Kim Džong Un klinički mrtav?', '“Njujork post” prenosi navode kineskih medija da je Kim Džong Un preminuo, ali su informacije nepotvrđene.\r\n\r\nSvetski mediji ranije su preneli da je Kina poslala svoj lekarski tim u Severnu Koreju zbog lidera te zemlje Kim Džong Una koji je u teškom stanju.\r\n\r\nDejli mejl prenosi vesti o teškom stanju lidera Severne Koreje, pozivajući se na tri izvora bliska severnokorejskom vrhu države.\r\n\r\nJapanski mediji objavili su da je Kim Džong Un u “Vegetativnom stanju” posle operacije srca koja je obavljena početkom meseca.\r\n\r\nPrema informacijama pojedinih medija, Kimu početkom meseca naglo pozlilo, uhvatio za grudni koš i sručio na zemlju. Hitno je prevezen u bolnicu na reanimaciju, a nedugo potom mu je izvršena i operacija na srcu.\r\n\r\nPodsetimo, poslednjih dana se dosta spekulisalo o tome gde je Kim Džong Un nestao. Sumnjalo se da je napustio Pjongjang zbog koronavirusa, a potom su počele da se pojavljuju informacije da je teško bolestan.\r\n\r\nNaime, dok se ceo svet bori sa epidemijom kovida 19, Severna Koreja tvrdi da ta zemlja nije registrovala nijedan slučaj koronavirusa.\r\n\r\nSeverna Koreja obavestila je Svetsku zdravstvenu organizaciju da je od 17. aprila testirala 740 ljudi na novi koronavirus, ali da su svi bili negativni.\r\n\r\nJapanski list “Yomiuri Shimbun” objavio je, pozivajući se na izvore upoznate sa trilateralnim razgovorima između Južne Koreje, SAD i Japana, da Severna Koreja priprema plan za nepredviđene slučajeve koji bi nadgledao prenos moći na mlađu sestru Kim Džong Una, Kim Jo Džong u slučaju nužde.\r\n\r\nLjudi su na Tiviteru počeli da objavljuju oproštajne postove, uz poruku da počiva u miru.\r\n\r\nI dok jedni žale, drugi postavljaju šale na račun načina njegove vladavine.', '2021-02-14 18:43:23', 2, 2, 0, '2021-02-15 08:55:07', 0),
(3, 'Zvezda pisala Vučiću: Snagom vašeg autoriteta možete da nam pomognete da dočekamo Milan uz publiku', '– FK Crvena zvezda je spreman da organizuje utakmicu uz prisustvo 30 posto navijača od maksimalnog kapaciteta stadiona, a u skladu sa protokolima UEFA za organizaciju utakmica tokom perioda pandemije virusa covid-19 – navodi se u pismu.\r\n\r\nKaže se da je velika želja kluba i miliona zvezdaša da sedmostrukog šampiona Evrope dočekamo uz podršku sa tribina i da je poznato koliko klubu znači podrška navijača.\r\n\r\n– Zbog toga verujemo da snagom Vašeg autoriteta mažete da nam pomognete da dočekamo veliki Milan, sa kojim imamo dugu tradiciju međusobnih duela, pred navijačima. FK Crvena zvezda bi u organizaciji utakmice striktno poštovala sve propisane mere: obezbeđivanje fizičke distance, nošenje maski, provera telesne temperature i drugi elementi propisani strogim protokolima republičkog kriznog štaba i UEFA – naveo je beogradski klub.\r\n\r\nTakođe, imajući u vidu da je naša zemlja među svetskim i evropskim liderima u sprovođenju vakcinacije, dodaje se, verujemo da bi rizici bili svedeni na najmanju moguću meru.\r\n\r\n– Poznato je da bi utakmica u Beogradu predstavlja veliku promociju za našu Srbiju i Beograd kao i da smo nedavno imali pozitivan primer organizacije Superboula u SAD, a uz prisustvo 30 odsto navijača od maksimalnog kapaciteta stadiona nadamo se da ćete naći nas zahtev kao opravdan – navela je Crvene zvezda u pismu predsedniku Vučiću, koje su portpisali predsednik kluba Svetozar Mijailović i generalni direktor Zvezdan Terzić.', '2021-02-14 18:43:23', 2, 1, 0, '2021-02-15 08:58:11', 0),
(4, 'Impresivne činjenice o veličini Tihog okeana', 'Tihi okean najveći je i najdublji okean na Zemlji. Prostite se na ogromnih 165,2 miliona kvadratnih kilometara od Amerike do Azije, odnosno pokriva 49,8 posto morskih prostranstava Zemlje. Taj je vodeni div toliko ogroman da ga je teško i zamisliti.\r\n\r\nAli možemo da probamo. Zamislite sve delove kopna spojene u jednu celinu; ta površina i dalje bi bila manja od velikog tihog plavetnila. Najveći okean na svetu ime duguje istraživaču Ferdinandu Magelanu koji ga je tako nazvao dok je 1520. plovio njegovim mirnim delom. Ali Tihi okean nije nimalo miran, tih niti povučen. U njegovim dubinama i na površini sve vrvi od aktivnosti, piše Pun kufer.\r\n\r\nVelik deo još uvek nije do kraja istražen, poput na primer Čelendžer dipa (Challenger Deep), najdubljeg dela Marijanskog rova. Taj deo Marijanskog rova, koji se nalazi u zapadnom delu okeana, istočno od Filipina 1951. otkrio je britanski istraživački brod Čelendžer, a dubinu od 11.033 metra kasnije je izmerio ruski istraživački brod pomoću sonarnog sistema.\r\n\r\nDo dubine od 10.915 metara, američka posada je dospela 1960. godine, što je gotovo 2100 metara više od visine Mont Everesta. Marijanski rov nastao je na mestu gde se Pacifička ploča podvlači ispod Filipinske, stotinjak kilometara zapadno od udaljenih ostrva, po kojima je nazvana.\r\n\r\nTihi okean verovatno je najstarije more na Zemlji.\r\n\r\nTihi okean ima nekoliko antipoda, odnosno dijametralno suprotnih tačaka na površini Zemlje, a ako bismo zamislili liniju koja ih povezuje, ona bi pokrila polovinu planete.\r\n\r\nKad bismo zaronili u Tihi okean podmornicom, na primer, nedaleko od Čilea, i stigli na njegovo dno pa napravili prolaz na drugi kraj Zemlje – i dalje bismo bili u Tihom okeanu, preciznije u blizini Vijetnama.\r\n\r\nNajduži kontinuirani potez vode u Tihom okeanu proteže se od Indonezije do Kolumbije. Taj je potez dugačak neverovatnih 19.800 kilometara, a toliko iznosi prečnik ne jednog, nego pet Meseca – i još bi ostalo malo mesta.', '2021-02-14 18:43:23', 2, 3, 0, '2021-02-15 09:04:12', 0),
(5, 'Franc Kafka: Intrigantne poslednje reči velikog genija', 'Franc Kafka danas se smatra jednim od najvećih pisaca svih vremena. Ipak, za života je važio za prilično mračnog čoveka. Poslednjih dana života zaveštao je prijatelju da sva njegova dela spali. Ipak, fanatično je pisao dok ga je snaga napuštla, a smrt ga je zatekla sa jednom rečenicom prekinutom na pola.\r\nTokom života, Kafka je objavio dve zbirke kratkih priča i nekoliko priča u tadašnjim književnim časopisima. Međutim, većina dela objavljena je tek nakon njegove smrti. Pre nego što je umro. Kafka je naredio svom najboljem prijatelju Maksu Brodu da spali sve rukopise!\r\n\r\nBrod ipak nije ispunio Kafkin zavet i objavio je sva njegova dela jer je u njima prepoznao ogromnu književnu vrednost.\r\n\r\nKafkini najpoznatiji romani “Proces”, “Amerika” i “Zamak” su objavljeni posthumno. Ovi kultni romani i danas inspirišu pisce, čitaoce, umetnike i filozofe.\r\n\r\nPoslednje delo\r\n“Zamak” je poslednji poznati Kafkin rad.\r\n\r\nPriča prati protagonistu po imenu K koji se doseljava u malo selo i očajnički pokušava da stupi u kontakt sa misterioznim seoskim vlastima koje upravljaju selom iz utvrđenog zamka.\r\n\r\nRoman je karakterističan po neverovatno mračnoj i jezivoj atmosferi, a prisutni su Kafkini lajt motivi o ljudožderskoj birokratiji i apsurdnosti postojanja.\r\n\r\nKafka je započeo pisanje “Zamka” 1922. godine inspirisan planinskim odmaralištem “Špindleruv Mlin” koje danas pripada Češkoj. U to vreme završavao je svoj poslednji roman uprkos činjenici da je bolovao od teškog oblika tuberkuloze.\r\n\r\nUmro je od opake bolestri dve godine kasnije u svojoj četrdesetoj godini. Zbog iznenadne i brze smrti roman je ostao nezavršen, a poslednja rečenica prekinuta je na pola.\r\n\r\n– Pružila je drhtavu ruku K. i naterala ga da sedne pored nje, jedva je govorila, bilo je nemoguće razumeti šta priča, ali ono što je rekla… – bila je poslednja Kafkina zapisana rečenica.\r\n\r\nDelo završeno nakon smrti\r\nNekoliko meseci pre smrti, Kafka je rekao svom prijatelju Maksu Brodu da će se roman završiti smrću glavnog lika koga će vlasti neobičnog sela posthumno proglasiti za novog stanovnika.\r\n\r\nBrod je završio delo i objavio ga 1926. godine. Roman je u početku bio slabo primljen, ali je u tridesetim godinama doživeo neverovatnu popularnost. Kao vlasnik Kafkine književne zaostavštine, Brod je donirao originalni rukopis Oksfordskom Univerzitetu, kako bi ga studenti detaljno proučavali, piše portal Vintage news.\r\n\r\nSrećom, Brod je prepoznao Kafkinu genijalnost i odlučio da je podeli sa svetom.', '2021-02-14 18:43:23', 1, 4, 0, '2021-02-17 18:25:23', 9),
(6, 'Rasizam u 21. veku : Zlo u genima', '– Postoji ambis između briljantnih i spretnih zamisli i ljudi brutalnih dela, provalija koju nijedno intelektualno objašnjenje ne može da premosti. Zato ostaje da se nadamo da se neće ponoviti mračni periodi istorije obeleženi rasizmom i Holokaustom – kaže sagovornik “Vesti”.\r\n\r\nKako objašnjava, rasizam i ksenofobija prema drugačijima u smislu rasne i kulturne pripadnosti nisu vezani samo za Ameriku, iako su svakako tamo izuzetno aktivni.\r\n\r\n– Žrtve su uvek oni iz najsiromašnijih delova društva. Milioni dece iz Afrike, Azije, arapskih zemalja se svake godine šalju na prinudni rad, devojčice se prodaju i primoravaju da rade kao kućne pomoćnice u najboljem slučaju, a često čine belo roblje namenjeno prostituciji. Sve je to rasizam koji buja širom sveta – kaže dr Milašinović.\r\n\r\nKako ističe, ubistvo Džordža Flojda koje ovih dana potresa svet, proizvod je višedecenijske politike koja se ne iskorenjuje tako lako.\r\n\r\n– Rasna politika u Americi imala je svoje teorijske osnove i “pokriće”. Istaknutiji rasistički teoretičar Henri Feirfild Ozborn pisao je da je “srednja inteligencija prosečnog odraslog crnca slična onoj kod jedanaestogodišnjeg deteta vrste homo sapiens”. Iz toga zaključujemo da se crnac nije tretirao kao ljudsko biće.\r\n\r\nSagovornik “Vesti” podseća da je biološki rasizam u Americi imao teorijsko pokriće i u radovima Medisona Granta, koji je pisao da će mešanje dve rase otvoriti put za pojavu vrlo primitivnije rase najniže vrste i da se međurasni brakovi stoga zabrane.\r\n\r\n– Ropstvo i rasizam je pratila i normativna regulativa države, posebno na jugu Amerike, gde su doneti ozloglašeni “Džim Krou zakoni” (Džim Krou je pogrdno ime za Afroamerikance) kojima crnci nisu bili tretirani kao ljudska bića. I nakon zvaničnog ukidanja ropstva 1863. godine praksa rasne podele je postojala i bila je praćena nasiljem. Linčovanje crnaca je imalo svoj kontinuitet tako da je između 1890. i 1901. godine, linčovano više od 1.300 crnaca. Pa se onda jasno donosi zaključak da će biti potrebno još mnogo, mnogo vekova da se iskorene uverenja koja su se prenosila kroz generacije – zaključio je Srđan Milašinović.\r\n\r\nIdeologija neravnopravnosti\r\nKako kaže, rasna podeljenost nastala zahvaljujući biološkim karakteristikama (kao što je boja kože) je najprostiji oblik rasizma.\r\n\r\n– Danas je prisutniji oblik rasizma koji čini ideologija, doktrina i politika koja se zasniva na neravnopravnosti rasa u društvu. U osnovi te ideologije stoji tumačenje da se ljudske rase ne razlikuju samo po morfološkim (telesnim) karakteristikama već i po psihičkim (umnim – moralnim, estetskim i intelektualnim kvalitetima), pa stoga postoje “više”, odnosno “niže” rase. Zahvaljujući svojim urođenim biološkim svojstvima, “više” rase su superiornije i pozvane da budu tvorci ljudske kulture, dok su “niže” zbog urođenih biopsihičkih svojstava osuđene da trajno kaskaju za “višim” rasama – objašnjava Milašinović.\r\n\r\nSistematsko uništavanje\r\nKako kaže prof. Milašinović, da bi se pokrenula savest zapadnog sveta, genocidni rasizam mora da dosegne svoj vrhunac.\r\n\r\n– Imali smo takve primere kroz istoriju. Bilo je potrebno da se desi sistematično i ubrzano uništenje jednog naroda, gotovo svih evropskih Jevreja, oko šest miliona ljudi za četiri godine, kao i da milione drugih naroda (prvenstveno slovenskih) pobiju nacisti da bi se obratila pažnja na neosnovanu mržnju. A ono što je učinjeno Jevrejima sprovođeno je vekovima pre toga nad drugim narodima, pre svega nad američkim Indijancima i afričkim crncima, a to belci nisu ni primetili – kaže Milašinović.', '2021-02-14 18:43:56', 2, 2, 0, '2021-02-15 09:01:56', 0),
(8, 'Britanac nakon pijanstva promenio ime u Selin Dion', 'Svakome se desilo da kada malo više popije napravi neku glupost, a jedan Britanac iz Stafordšira je čak zakonski promenio ime u Selin Dion.\r\nTomas Dod, kako se do pre nekoliko dana zvao, je ogroman obožavalac kanadske pevačice. Tokom božićnih dana Tomas je gledao nekoliko njenih koncerata uz poneku čašicu, a jedne večeri je čak poslao zahtev za zvaničnu promenu imena i uplatio za to 90 funti.\r\n\r\nTakođe je doplatio i za osam sertifikata, kojima bi mogao da dokaže da se zove Selin Dion.\r\n\r\nIako se iznenadio kada je dobio kovertu sa dokumentima, Dion kaže da ne planira da vrati svoje staro ime.\r\n\r\nTier 4 is the least of my worries – I’ve just got home to some post. Apparently at some point over Christmas I’ve had one too many vinos and legally changed my name to Celine Dion! pic.twitter.com/ZchXWiqhUw\r\n\r\n— Celine Dion (@ThomasDodd1) December 30, 2020\r\n\r\n– Samo što se nisam onesvestio u kuhinji kada sam otvorio kovertu – rekao je za Birmingem lajv.\r\n\r\nMeđutim, sada je prihvatio svoje novo ime.\r\n\r\n– Početna zabrinutost bila je kako ću na poslu da odem u kadrovsku da im kažem da sam promenio ime. Sada razmišljam da bi ono bilo sjajan način da se ušunjam na bekstejdž. Samo se molim da me na putu ne zaustave policajci – kaže Dion.\r\n\r\nNjegova majka, ipak, nije baš oduševljena.\r\n\r\n– Majci nije bilo baš smešno. Mada sam joj objasnio da je moglo da bude mnogo gore. Mogao sam da se nazovem Boris Džonson – kroz smeh je rekao Dion.', '2021-02-14 18:43:23', 2, 3, 0, '2021-02-15 09:22:33', 0),
(9, 'Doli Parton snimila pesmu koju će objaviti tek 2045. godine', 'Američka živa kantri legenda Doli Parton u tajnosti je snimila pesmu i zapečatila je u vremensku kapsulu koja bi trebalo da bude otvorena tek 2045. godine.\r\nPesma je, kako prenose svetski mediji, zapečaćena u “vremenskoj kapsuli”, odnosno drvenoj kutiji i zaključana je odmaralištu na njenom imanju “Dolivud”, otvorenom 2015. godine.\r\n\r\nSlavna pevačica u svojoj nedavno objavljenoj knjizi “Moj život u stihovima” otkrila je da je osoblje odmarališta posebno upućeno u to da kutija ne sme da bude otvorena u narednih četvrt veka.\r\n\r\n– Biće to pesma koja neće moći da se čuje sve do 30 godina od kako smo to odmaralište otvorili – navela je Doli Parton, a prenosi NME.\r\n\r\nOna je objasnila da je takva ideja došla od njenog menadžmenta.\r\n\r\n– Rekli su: ‘Bićeš uveliko mrtva do tada’. Rekla sam: ‘Pa, možda i neću. Imaću 99 godina. Videla sam i ljude starije od tih godina. Na neki način je čudno da su od mene zatražili da napišem tu tajanstvenu pesmu. Ne znam ni da li želim da doživim stotu ili ne, ali nikad se ne zna. Mogla bih da je doživim, i ako to bude tako, biću na otvaranju – ispričala je pevačica.', '2021-01-11 18:12:25', 1, 8, 0, '2021-02-15 09:29:27', 0),
(10, 'Poruka ljubavi matici i rasejanju\r\n', 'U organizaciji i produkciji Udruženja Srba u Austriji, a u saradnji sa Ambasadom Srbije u Austriji i brojnim srpskim udruženjima, Srbi iz Austrije su sunarodnicima u matici, ali i svim Srbima širom sveta, lepim i emotivnim videom čestitali praznik, Sretenje i Dan državnosti Republike Srbije.\r\nU snimanju i pripremi ove poruke ljubavi i mira učestvovali su saradnici iz cele Austrije, a posebno deca i mladi, članovi brojnih srpskih organizacija u ovoj zemlji.\r\n\r\nSa ponosom i nadahnuto, čestitke su poslali članovi Srpskog prosvetnog i kulturnog društva Prosvjeta, kao i članovi klubova okupljenih u Austrijskom savezu srpskog folklora i to Kulturno- sportskog društva Bambi, Srpskog kulturnog centra “Stevan Mokranjac”, Kulturno-umetničkog društva Jedinstvo, svi iz Beča, KUD “Jovan Jovanović Zmaj” iz Feldkirha i KUD Opanak iz Salcburga.\r\n\r\nČestitkama su se pridružila i druga udruženja, srpski studenti i akademci iz Beča, a posebnu čast organizatorima učinio je svojom porukom i Nebojša Rodić ambasador Srbije u Austriji .\r\n\r\n– Čestitam praznik. Čestitam Sretenje, naš nacionalni i državni praznik. Čestitamo ga iz Republike Austrije, svim Srbima u rasejanju, čestitamo ga našima u otadžbini! Živela Srbija – naglasio je Rodić.\r\n\r\nNa početku video čestitke uz fotografije znamenitih Srba, objašnjava se značaj Sretenja 1835.godine, kada je usvojen Ustav Srbije, koji je bio mnogim zemlja Evrope i sveta uzor zbog svog liberalnog karaktera.\r\n\r\nĐaci Prosvjetine škole srpskog jezika čestitali su Dan državnosti građanima Srbije i predsedniku Aleksandru Vučiću. Oni su čestitke uputili ispred spomenika Vuku Stefanoviću Karadžiću, dvorca Šenbrun, ali i ispred spomenika Johanu Štrausu.\r\n\r\n– Našim drugarima u Srbiji želimo sredćno Sretenje – poručili su oni između ostalog.\r\n\r\nČlanovi Bambija iz Beča čestitku su završili rečima “Volimo Srbiju”.\r\n\r\nU ime srpskih studenata i akademaca iz Beča članovi Prosvjetinog kluba mladih umetnika poželeli su kolegama u domovini i širom sveta srećan Dan državnosti.\r\n\r\nU pripremi video materijala, organizatori iz Udruženja Srba u Austriji imali su dobru podršku od produkcije Cezar filma iz Beča.', '2020-12-29 18:15:20', 1, 7, 0, NULL, 0),
(11, 'Gejmerke \"razbijaju\": Devojke u igricama rame uz rame sa muškarcima', 'Prosečan gejmer je star više od 30 godina i otac je troje dece, dok je 41 odsto žena priznalo da voli da igra video igrice. Devojke, međutim, ne vole da se igraju na konzolama i kompjuterima, već uglavnom na pametnim telefonima.\r\n\r\nStudijom u kojoj je učestvovalo 2.000 ljudi, utvrđeno je da je prosečan gejmer porodičan čovek, sa kućom ili stanom i godišnje zarađuje 40.000 funti (45.000 evra), preneo je britanski.\r\n\r\nMada muškarci više vole da igraju akcione igrice, kao što su Call of Duty ili Fortnite, čak 41 odsto žena sebe naziva \"gejmerkama\", iako igraju video igrice na telefonima.\r\n\r\nMuškarci vole pucačke ili sportske igre, dok žene više vole strateške igre i zagonetke. I jedni i drugi, međutim, skoro isto vremena provode uz video igrice.\r\n\r\n', '2020-12-29 18:48:08', 1, 6, 0, '2021-02-17 18:35:00', 7),
(12, 'MATADOR, NOVA SEZONA BARUTANE 2021', 'Nastup Matadora, revolucionarnog umetnika sa blistavom reputacijom svestranosti, koji je prvobitno planiran za otvaranje sedme sezone Barutane, u maju 2020. godine, zbog pandemije covid-19 virusa, bio je odložen za kraj avgusta, u nadi da će se epidemiološka situacija širom sveta poboljšati. Ovu godinu, koja je već na izmaku, pamtićemo i po tome što nismo bili u prilici da uživamo u svim bukinzima i planiranim stranim gostovanjima, kao i mnogim iznenađenjima koje smo pripremali za letnju sezonu kultnog kluba Barutana 2020.\r\n\r\nMatador, jedan od izvođača, čije izvanredno tehničko umeće nikada ne pravi kompromis u pogledu kvaliteta, imaće tu čast da zajedno sa svim svojim fanovima, željnim dobrog zvuka i klupskih žurki, otvori narednu sezonu Barutane, u petak 7. maja 2021. godine.\r\n\r\nUlaznice su  u prodaji putem Cooltix onlajn platforme, po promo ceni od 990 dinara za regularne karte i 1490 dinara za VIP, kao i na prodajnim mestima Ticket Vision-a i Gigs Tix-a.\r\n\r\nSve kupljene ulaznice za maj i avgust 2020. važe i za novi datum. Ukoliko nekome novi datum ne odgovara, postoji mogućnost za refundiranje novca. Detaljne informacije o refundaciji, mogu se dobiti putem mejlova ticket@cooltix.rs, povrat@gigstix.com i office@tickets.rs, u zavisnosti od toga preko kog tiketing servisa su ulaznice kupljenje.\r\n\r\nMatador je 2019. godine predstavio je niz uzbudljivih, novih, kreativnih projekata. Kao šef izdavačke kuće RUKUS, svoje talente je preusmerio na nekoliko poduhvata, ohrabren odličnim uspehom na turnejama i sa izdanjima. Tu godinu obeležili su i radovi u novim oblastima, kao što su downtempo i ambijentalni album 95BPM – Music to Fill the Space i bela vinil serija Cyclone. Njegov lejbl RUKUS nije bio zapostavljen, bilo je novih izdanja kako od Matadora, tako i od strane novih talenata. Njegova saradnja sa dvojcom Artbat – Apollo 11, postigla je uspeh, nakon plodne godine sličnih partnerstava, remiksovanja Stefana Bodzina i Ninetes-a.\r\n\r\nIzmeđu ostalog, rezident je ENTER žurki na kojima širom sveta nastupaju najtraženija imena elektronske muzike, ambasador Richie Hawtin-ovog PLAYDifferently MODEL 1 analognog miksera i NEVE 5088 studijskog miksera. Osvojio je DJ Awards za elektronskog live izvođača, a njegovo ime uvek se nalazi na Resident Advisor Top 20 Live Artists listi.\r\n\r\nČuvajte se, pazite jedni druge i budite odgovorni! Budite dobro i ostanite zdravi! Nadamo se da se vidimo sledećeg maja u Barutani!\r\n\r\n', '2021-02-12 18:51:05', 1, 8, 0, '2021-02-17 18:35:51', 39),
(15, 'Živeti van sistema', 'dhx', '2021-02-16 11:23:09', 1, 1, 1, '2021-02-17 18:32:15', 266);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwvesti`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vwvesti`;
CREATE TABLE IF NOT EXISTS `vwvesti` (
`id` int(3) unsigned
,`naslov` varchar(150)
,`tekst` text
,`vreme` timestamp
,`autor` int(3)
,`kategorija` int(3)
,`obrisan` int(1)
,`izmena` timestamp
,`pogledan` int(5)
,`naziv` varchar(50)
,`ime` varchar(20)
,`prezime` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `vwvesti`
--
DROP TABLE IF EXISTS `vwvesti`;

DROP VIEW IF EXISTS `vwvesti`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwvesti`  AS  select `vesti`.`id` AS `id`,`vesti`.`naslov` AS `naslov`,`vesti`.`tekst` AS `tekst`,`vesti`.`vreme` AS `vreme`,`vesti`.`autor` AS `autor`,`vesti`.`kategorija` AS `kategorija`,`vesti`.`obrisan` AS `obrisan`,`vesti`.`izmena` AS `izmena`,`vesti`.`pogledan` AS `pogledan`,`kategorije`.`naziv` AS `naziv`,`korisnici`.`ime` AS `ime`,`korisnici`.`prezime` AS `prezime` from ((`vesti` join `kategorije` on((`vesti`.`kategorija` = `kategorije`.`id`))) join `korisnici` on((`vesti`.`autor` = `korisnici`.`id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
