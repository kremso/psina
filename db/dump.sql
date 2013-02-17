--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: jokes; Type: TABLE; Schema: public; Owner: psina; Tablespace: 
--

CREATE TABLE jokes (
    id integer NOT NULL,
    body text,
    published boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(100) NOT NULL,
    advice text,
    author character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    rating integer,
    comment character varying(200)
);


ALTER TABLE public.jokes OWNER TO psina;

--
-- Name: jokes_id_seq; Type: SEQUENCE; Schema: public; Owner: psina
--

CREATE SEQUENCE jokes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jokes_id_seq OWNER TO psina;

--
-- Name: jokes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psina
--

ALTER SEQUENCE jokes_id_seq OWNED BY jokes.id;


--
-- Name: jokes_tags; Type: TABLE; Schema: public; Owner: psina; Tablespace: 
--

CREATE TABLE jokes_tags (
    id integer NOT NULL,
    joke_id integer,
    tag_id integer
);


ALTER TABLE public.jokes_tags OWNER TO psina;

--
-- Name: jokes_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: psina
--

CREATE SEQUENCE jokes_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jokes_tags_id_seq OWNER TO psina;

--
-- Name: jokes_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psina
--

ALTER SEQUENCE jokes_tags_id_seq OWNED BY jokes_tags.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: psina; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO psina;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: psina; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    label character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tags OWNER TO psina;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: psina
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO psina;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: psina
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: psina
--

ALTER TABLE ONLY jokes ALTER COLUMN id SET DEFAULT nextval('jokes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: psina
--

ALTER TABLE ONLY jokes_tags ALTER COLUMN id SET DEFAULT nextval('jokes_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: psina
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Data for Name: jokes; Type: TABLE DATA; Schema: public; Owner: psina
--

COPY jokes (id, body, published, created_at, updated_at, title, advice, author, email, rating, comment) FROM stdin;
303	Manželka pošle programátora na nákup:\r\n- "Kúp kilo zemiakov, a ak budú mať vajcia, zober desať."\r\nProgramátor príde do obchodu a pýta sa:\r\n-"Máte vajcia?"\r\n-"Máme", odpovedá predavač\r\n-"Tak si prosím 10 kilov zemiakov"	t	2008-02-26 12:19:13	2009-02-25 23:30:01	Programátor nakupuje	Dôležité nie je len zapamätať si, čo zakazník žiada, ale aj jeho požiadavku pochopiť.	Vladislav Zalesak	xzalesak@is.stuba.sk	5	* PRÍBEH TÝŽDŇA 1 *
304	<a> Tak máme problém u zakazníka\r\n<a> Na disku je miesto iba vpravo\r\n<b> Čože?!\r\n<a> Píše to "No space left on device"	t	2008-02-26 22:03:48	2008-03-17 22:09:49	Angličtina naša každodenná	Niekedy sú potrebné aj širšie vedomosti a nestaší len znalosť svojho vlastného odvetvia... (v tomto prípade by sa dotyčnému zišiel kurz angličtiny).	Peter Marko	xmarkop2@is.stuba.sk	\N	dobré a k veci
305	Zomrie programátor a dostane sa do pekla. Po týždni Lucifer volá Bohovi: \r\n- Čo za blázna si mi sem poslal? Zničil mi všetky kotly, poškrtil všetkých čertov\r\n a už tri dni bezhlavo behá po všetkých chodbách pekla a reve: "Kde je prechod do druhého levelu?" \r\n	t	2008-02-27 14:11:36	2008-03-17 22:10:39	Programátor v pekle	Je životne dôležité vedieť rozoznat reaány svet od toho virtuálneho...	Marcel Džačovský	marcellitoo@gmail.com	\N	dobré a k veci
306	Otázka používateľa:\r\n\r\nDobrý deň, minulý rok som vykonal upgrade Priateľky 1.0 na verziu Manželka 1.0 a nový program nečakane spustil proces Dieťa, s mimoriadne veľkou spotrebou pamäti a systémových zdrojov. V dokumentácii sa však o tejto funkcii nič nepíše. Okrem toho Manželka 1.0 tiež zasahuje do ostatných programov a spúšťa sa už pri bootovaní systému. Ostatné programy, ako napríklad NočnýPoker 10.3 a Pivo 12.0 od tej doby prestali fungovať, pri ich spustení sa systém zrúti. Zdá sa, že Manželku 1.0 nemôžem odstrániť zo systému.\r\nUvažoval som o návrate k Priateľke 1.0, ale Manželku 1.0 sa mi nepodarilo odinštalovať. Môžete mi prosím poradiť?\r\n\r\n\r\nOdpoveď:\r\n\r\nVážený používateľ, toto je veľmi častý problém. Mnoho ľudí prechádza z Priateľky 1.0 na Manželku 1.0, domnievajúc sa, že je to len neškodná zábavná utilitka. Ale Manželka 1.0 je program, navrhnutý tak, aby sám spúšťal ostatné aplikácie. Nepokúšajte sa ju preto inštalovať! Dodatočné odstránenie Manželky 1.0 môže mať za následok poškodenie systémových zdrojov.\r\nNiektorí sa pokúšali inštalovať Priateľku 2.0 resp. Manželku 2.0, ale narazili na viac problémov, ako v pôvodnom systéme. Iní skúšali spúšťať Priateľku 2.0 paralelne na pozadí. Bohužiaľ, Manželka 1.0 neskôr detekuje prítomnosť Priateľky 2.0, čo zapríčiní konflikty, s následným kolapsom systému. Jediná možnosť, ako sa vyhnúť problémom je neinštalovať softvér Manželka, ale používať iba Priateľku. Verzie Priateľky 1.0, 2.0, 3.0, atď. sú navzájom kompatibilné, dokonca sa môžu používať paralelne. \r\nTeraz je už ale neskoro, môžete už len varovať vašich známych. Ešte dodávame, že si treba dať veľký pozor na nezdokumentovanú automatickú inštaláciu programu Svokra 6.4.	t	2008-02-28 02:05:45	2008-03-17 22:37:39	Neodborná inštalácia softvéru	Každý softvér je potrebné dôkladne zdokumentovať a otestovať, inak môžu nastať komplikácie ;)	Branislav Lukáč	lukac06@student.fiit.stuba.sk	\N	veľmi dobré, poučenie ale mohlo byť lepšie
307	Technik, obchodník a programátor spolu cestujú autom, ktoré sa náhle pokazí a zastaví:\r\n- Technik navrhuje: "Čo keby sme skúsili otvoriť kapotu a pozreli sa, kde je závada?"\r\n- Obchodník navrhuje: "Čo keby sme zkúsili ísť každý iným smerom, nájsť telefón a zavolať autoservis?"\r\n- Programátor navrhuje: "Čo keby sme skúsili vystúpiť a nastúpiť?"	t	2008-03-02 01:52:37	2008-03-17 22:22:15	Reboot	Je dôležité vedieť sa povzniesť nad daný problém a nepúšťať sa do prvého riešenia, ktoré nás napadne...viac hláv == viac rozumu	Marcel Džačovský	marcellitoo@gmail.com	\N	dobré, ale poučenie mohlo byť lepšie
308	Za devatero routery a za devatero hustymi sitemi byla jedna aplikace jmenem Karkulka, ktera mela krasne cervene GUI. Jeji GUI bylo tak cervene, ze i komunisticka strana ji tu barvu zavidela, a proto ji nikdo nerekl jinak nez Cervena Karkulka. Jednoho dne prisedl vyvojar ke svemu stroji a zalibne si prohlizel jeji kod. Po nejake chvili povida:\r\n- "Nastal cas, Karkulko, poslat te na server babiczka.cz a ukazat te nasi komunite. Navic ma dnes babiczka vyroci prideleni jejiho DNS jmena takze se to bude naramne hodit. Dam ti s sebou par hostitelskych packetu, takze ji hezky poprej a packety predej."\r\n\r\nI byla aplikace Karkula vyslana na server. Nanestesti pro Karkulku se o tomto datatransferu dozvedela komunisticka strana. Ta mela jiz delsi dobu na karkulku zalusk, protoze pokud by ji ziskala, tak by si mohla zkopirovat kod te barvy GUI a tim by se stala nejcervenejsi komunistickou stranou na svete. Proto komuniste rozhodli o nasazeni tajneho trojskeho kone wolf007 s povolenim asimilovat cizi kod (asimilovat znamena zaclenit cizi kod do sveho). I usadil se wolf007 na routeru, o kterem vedel, ze pres nej karkulka musi byt preposlana. Po nekolika milisekundach Karkulka opravdu dorazila. K jeho velkemu zklamani vsak kod ke GUI byl sifrovany a tim padem nemohl utok provest hned. I dal se s ni do reci:\r\n\r\n-"Ahoj Karkulko kam jdes?"\r\n-"Aaale jdu na server babiczka.cz predat par packetu k vyroci a?"\r\n-"No koukam ze jich moc s sebou nemas. Koukni se kolem sebe vsude tu mas spoustu ICMP packetu, ktere ten router zahodil. Nejake nasbirej babiczka bude mit urcite radost."\r\nKarkulka se chvilku zamyslela a nakonec usoudila, ze wolfuv vyrok byl pravdivy a zacala je sbirat do bufferu. Mezi tim se wolf vydal na server babiczka sam. Server babiczka byl stary unixovy server, na kterem bezela aplikace dvere. Wolf si toho vsiml a odeslal tam pozadavek KLEP, KLEP. V zapeti dostal odpoved: Nasloucha server babiczka, Jsi to ty karkulko?. Wolf odpovedel kouzelnym slovickem TRUE a byl vpusten dovnitr. Nez se babiczka vzpamatovala byla asimilovana. Za chvilku dorazila i Karkulka s plnym bufferem ICMP packetu div z toho nedostala overflow. Odehrala se stejna scena jako s wolfem. Po tom co se Karkulka dostala dovnitr uvidela babiczku jak lezi v operacni pameti. Cosi ji prislo podivne a proto se zacala vyptavat:\r\n-"Babiczko, proc mas tak velke sockety?"\r\n-"To abych mohla lepe provadet listening."\r\n-"A babiczko, proc mas tak velke pointery?"\r\n-"To abych si te lepe mohla precist"\r\n-"A babiczko, proc mas tak velky entry_point?"\r\n-"To abych te mohla lepe asimilovat!".\r\nA nez se Karkula nadala byla hluboko v utrobach wolfa spolecne s babickou. I rekl si wolf, ze mise byla splnena uspesne, tak bych si mohl na chvilku odpocinout a natahl se do mekkeho cache a zavolal fci sleep(). Za nedlouho prochazel kolem serveru antivir znacky hayny. Hned jak uvidel packety odchazejici ze serveru, zjistil, ze cosi neni v poradku. Zadne standardni datove packety, pouze packety s daty CHRRRRRRRRR odesilane na broadcast. Proto se rozhodl, ze to dojde overit. Pri proscanovani serveru zjistil, ze na serveru stale bezi aplikace dvere a proto se odhodlal vstoupit, vzhledem k okolnostem, bez autentizace. Hned po vstupu zjistil, ze na cachych processoru si lebedi zly trojan wolf007 s povolenim asimilovat. Proto se rozhodl rozparat ho primo za entrypointem. Hned jak ho rozparal vyskocila jak babiczka tak karkulka. Babiczka se opet nahrala zpet do RAMky a opet zaujala vladu nad svym hardwarem. Potom vyhazela karkulce par HARD_SYSTEM_ERRORu (dokonce i KERNEL panic), ktere spolu s antivirem zasili zpatky do wolfa. Potom se schovali a cekali. Po nejakem case vyprsel wolfovi timeout a probudil se. Citil se dost nafoulky a bylo mu tezko od entrypointu(to vite HARD_SYSTEM_ERRORY neco vazi) a tak se odebral do/dev kde se chtel napit z urandomu. Jak vsak byl pretizeny tak zakopl a spadl do /dev/null. Babiczka z vdecnosti haynemu podekovala a nainstalovala si jeho plnou verzi. Potom Karkula predala packety a odporoucela se na disk. A jestli neprisel zkrat ktery by spalil veskery hardware, tak jsou vsichni ulozeni na serveru do dnes.	t	2008-03-20 16:39:11	2008-05-14 14:50:07	Karkulka	ziadne ;>	Miroslav Miklus /kyberka/	week.borec@gmail.com	\N	zaujímavé, ale bez poučenia a trochu dlhé :-)
309	Vypol sa mi počítač, a tak volám systémového administrátora. Prichádza administrátor, ťažko povzdychuje, volačo si tam hundre pod nos, asi 10 krát otáča moju stoličku, kope do počítača a ten sa zapína. Znova si ťažko povzdychuje, stále hundre a odchádza. On je proste šaman!\r\n.\r\n.\r\n.\r\nDruhá strana:\r\nZavolali ma k užívateľovi. Ten idiot sa toľko točil na stoličke, že sa mu na ňu namotal kábel zo zástrčky. Ticho nadávam, rozmotávam kábel, odkopávam počítač čo najďalej pod stôl, zapínam ho, nadávam a odchádzam.	t	2008-03-02 02:17:21	2008-03-17 22:22:51	Admin ľudomil	Pri vytváraní systému prechádzame postupne jeho špecifikáciou, návrhom a implementáciou no nesmieme zabudnúť na to najdôležitejšie...jeho údržbu	Marcel Džačovský	marcellitoo@gmail.com	\N	dobré, ale poučenie mohlo byť lepšie
310	Programátor sa zúčastní streleckého výcviku. Dostal bezpečnostnú inštruktáž, pušku a náboje. Vystrieľal 10 rán a muž pri cieli hlási, že žiadna nezasiahla terč. Strelec pozerá na pušku, potom na terč. Znova na pušku a zasa na terč. Dá prst pred ústie hlavne a druhou rukou stlačí spúšť. Pozerá sa na krvácajúci zvyšok prsta a zavolá na muža pri terči: "Tu je všetko v poriadku, chyba musí byť na vašej strane..."	t	2008-03-02 02:50:18	2009-02-25 23:34:52	Ostrostrelec	V požiadavkách zamestnávateľov často čítame: "analytické myslenie výhodou."\r\n.\r\n.\r\n.\r\nje tomu tak vždy?	Marcel Džačovský	marcellitoo@gmail.com	5	* PRÍBEH TÝŽDŇA 2 *
311	Q: Aký je objektovo orientovaný spôsob ako rýchlo zbohatnúť ?\r\n\r\nA: Dedenie	t	2008-03-02 11:10:49	2008-03-17 22:24:13	OOP prístup	Princípy softvérového inžinierstva sa dajú využiť aj v bežnom živote bez počítačov.	Miro Polgár	miropolgar@gmail.com	\N	dobré
312	Rozpráva sa Motorola s Pentiom: \r\nM: Pentium, koľko je dva plus dva?\r\nP: Tri!\r\nM: Pentium, veď to je zle!\r\nP: Nevadí, ale je to rýchlo.	t	2008-03-02 13:50:34	2008-03-17 22:24:50	Procesory	Rôzni výrobcovia počítačových komponentov a softvéru majú rôzny prístup k obchodnej politike - niektorí tlačia cenu dole aj na úkor nekvality výrobkov...	Ján Kvak	jano180@post.sk	\N	dobré, ale nie celkom k téme
313	Pár IT vtipov\r\n\t \r\nPríde počítačový opilec do krčmy a hovorí:\r\n"Dva CD-rumy a jeden Interfernet."\r\n\r\nČo je najväčšia drzosť?\r\nSpýtať sa ženy, koľko palcovú má mechaniku.\r\n\r\nTakto si raz spustím Norton Comander a čo nevidím?\r\nVľavo disk C - vpravo disk C.\r\nA načo mi sú dva disky C?\r\nTak som jeden sformatoval...\r\n\r\nInternetový tip na večeru:\r\nVe ve ve, chlieb s maslom, zavináč, vodka, sk!\r\n\r\nKto je to generál failure a prečo číta z mojho disku?\r\n\r\nViete čo majú spoločné Hard-disk a krátka sukňa?\r\nKrátku dobu prístupu...\r\n\r\nDefinícia hardwaru:\r\nVšetko, čo nejde ukradnúť po sieti...\r\n\r\nNáhrobný kameň programátora:\r\nPríčina smrti: Run Time Error at 18:30:04.\r\nPríčina narodenia: General Protection Fault at 16:20:35\r\n\r\nV meste bola "Výstava najmodernejšej americkej výpočtovej techniky".\r\nPredvádzač hrdo vysvetľuje:\r\n"Toto je najmodernejší model amerického počítača. Dokáže porozumieť hovorovej ľudskej reči. Splní akékoľvek želanie, ktoré vyslovíte."\r\n"Môžem to vyskúšať?" - pýta sa jeden muž.\r\n"Samozrejme, pane. Poďte bližšie hovorte."\r\n"Formát ce, dvojbodka enter."\r\n\r\nKedy je človek maximálne stratený?\r\nKeď ho ani google nenájde.\r\n\r\n"Óóóócííí, potreboval by som nový harddisk."\r\n"A kúzelné slovíčko?"\r\n"Kruci! Dnes je už fakt všetko zaheslované!"\r\n\r\nPríde človek do obchodu so softvérom a pýta sa:"Máte Windows Vista?"\r\nPredavač:"Ste blázon?"\r\nZákazník:"Je to súčasť licenčných podmienok?"\r\n\r\nVolá chlapík na linku podpory zákazníkom:"Mám problém..."\r\nTechnik:"Aký?"\r\n"Mám Windows Vista..."\r\n"A?"\r\n"Mám tam vírus..."\r\n"To ste už vraveli..."\r\n\r\nPríde hacker do kostola sa vyspovedať:"Otče, zhrešil som..."\r\n"A koľko toho máš, sym môj?"\r\n"No, vošlo sa to na dve diskety..."\r\n\r\nSyn programátora sedí v škole a učiteľka sa pýta:"Janko, koľko je 5-2?"\r\n"Je to 3, pani učiteľka."\r\n"Výborne. A vedel by si koľko je 2-5?"\r\n"253, pani učiteľka."\r\n\r\n"Tati, je pravda že ICQ, IRC, Pokec a iné web-chaty degenerujú ľudí?"\r\n"OMG imho, lol"\r\n\r\nKoľko je 8 trilobitov? Predsa 1 trilobajt.\r\n\r\nAko sa volá doktor, ktorý opravuje choré weby? URLóg.\r\n\r\n"...zistilo sa že 70 nevyužitých percent DNA je vlastne komentár..."\r\n\r\n"...čierna diera je pokus Boha deliť nulou..."\r\n\r\nOS/2 VirusScan - "Windows found: Remove it? [Y,n]"\r\n\r\n-Koľko hardvérových odborníkov je potrebných na výmenu žiarovky?\r\nŽiadny. Prehlásia, že diagnostické testy sú v poriadku, takže je chyba v softvéri.\r\n-Koľko inžinierov z IBM je potrebných na výmenu žiarovky?\r\nŽiadny. Ale marketingové oddelenie  prehlási, že prasknutá žiarovka je nový trend, ktorého smerom sa bude vývoj uberať.\r\n-Koľko PCčkárov je potrebných k výmene žiarovky?\r\n100. Desať vymení  žiarovku a deväťdesiat sa bude  podielať na výrobe príručiek  "Začíname  s  výmenou  žiarovky",  "Výmena  žiarovky  pre pokročilých",  "Technické parametre  žiaroviek", "Registračné formuláre", "Lokalizácia pre strednú a východnú Európu" a pod.\r\n-Koľko programátorov je treba k výmene žiarovky?\r\nŽiadny. To je problém hardvéru.\r\n-Koľko pracovníkov Microsoftu je treba k výmene žiarovky?\r\nŽiadny. Prehlásia tmu za štandard.\r\n-Koľko Billov Gatesov treba na vymenenie žiarovky?\r\n- Jeden. Bill Gates chytí žiarovku a čaká, kým sa svet otočí okolo neho. \r\n\r\nREALITY.SYS corrupted - reboot Universe [Y,n]?\r\n\r\nExternal Error : Intelligence not found!\r\n\r\nComputers can never replace human stupidity.\r\n\r\nPrečo Intel nepoužil pre Pentium názov 586?\r\nPretože na prvom Pentiume sčítali 486 a 100 a vyšlo im 585,999983605.\r\n\r\n640 kb RAM musí stačiť každému\r\n-Bill Gates, 1981	t	2008-03-02 15:40:32	2009-06-05 19:14:30	Pár fajn IT vtipov, enjoy  :)	Aby sme mohli naučiť výpočtovú techniku pochopiť nás, musíme sami pochopiť ako funguje...	neznámi autori, prebraté z webov	xclementis@is.stuba.sk	\N	trochu od témy, ale ok
314	Ležia tri krabice od softvéru na smetisku:\r\n"Prečo si tu?"\r\n"Nebežal som pod Windows 98, a ty?"\r\n"Ja som padal pod Windows 98, a ty, tretia?"\r\n"Ja som Windows 98..."\r\n	t	2008-03-03 12:32:34	2008-03-17 22:25:14	Windows náš každodenný	Softvér sa vyvíja takou rýchlosťou, že to čo bolo normou a určovalo smer vývoja zastará rovnako rýchlo, ako softvér na ňom závislý.	Ján Kvak	jano180@post.sk	\N	dobré a k veci
315	Vo firme sa koná maškarný ples:\r\n- Práve prichádza Milan z výstupnej kontroly v maske vlka. A za ním je Peter z obchodného oddelenia v maske medveďa. A tamto je Anička zo mzdového v maske líšky. A tam vzadu je náš správca siete Ivan v maske 255.255.255.0\r\n	t	2008-03-04 10:02:14	2008-03-17 22:25:40	Maska	Je dôležité držať si určitý odstup od sveta virtuálnej reality, lebo nás jedného dňa pohltí...	Ján Kvak	jano180@post.sk	\N	dobré, ale poučenie mohlo byť lepšie
316	Rozprávaju sa dva informatici: - Predstav si, včera som se zoznámil s nádhernou blondínou. - Ty máš ale štastie. - Pozval som ju k sebe, trochu sme pili, objal som ju... - No a čo dalej? - Zrazu mi vraví: Vyzleč ma! - Teeeda... - Vyzliekol som jej teda sukňu, nohavičky, posadil som ju na stol vedľa notebooku... - Nevrav, ty si si kúpil notebook? Čo má za procesor?	t	2008-03-04 18:58:56	2008-03-17 23:33:34	Dvaja informatici	just joke:)\r\nKeď práca pohltí celú našu myseľ...	Marek Kosař	kosarm@gmail.com	\N	dobré, aj keď just joke
317	Príde informatik do hračkárstva. Chce kúpiť darček synovi. Tak si pýta nejaké puzzle. Predavač ponúka 1500 puzzle. \r\n"Veď to syn poskladá za hodinu a čo bude potom robiť?"\r\nTak mu ponúkane 3000 puzzle. \r\n"To poskladá za pol dňa a čo bude potom robiť?"\r\nTak predavač prinesie tie najťažšie puzzle.\r\n"To poskladá za dva dni a čo potom?"\r\nPredavač sa už ozaj nahnevá a vraví: "Vidíte tam oproti tú pekáreň? Kúpte synovi strúhanku, nech skladá rožky .."	t	2008-03-04 19:22:15	2008-03-17 23:33:21	Múdri informatici	Informatici sú vo všeobecnosti vzdelaní ľudia...	Juraj Ščepán	jscepan@post.sk	\N	dobré, ale nie celkom k téme
318	PRÍBEH: \r\n\r\nTextový editor za 10 minút\r\n\r\n           alebo \r\n\r\nsprávnosť softvéru nie je dôležitá.\r\n\r\n\r\n\r\nNedávno som si povedal, že keď už som dlho nič nenaprogramoval, tak by som po dlhej dobe niečo konečne mohol. Keď už mám predmet PSI tak by som mohol nahodiť nejaké to UML, načmárať zopár diagramov, a pustiť sa do dlhej implementácie. Listoval som si poznámky z prednášok a pozastavil som sa na jednej, ktorá mi v mojej situácii pripadala spásonosne. "Jasné, to použijem", povdal som si. A tu už je opis môjho programu, čo sa týka jeho vlastností:\r\n\r\nzákladná trojnožka:\r\ncena - zadarmo\r\nčas - 10 minút (vrátane písania licenčnej zmluvy)\r\nsplnenie požiadaviek - no tak...... v podstate hej\r\n\r\nostatne dôležité kritériá:\r\nspoľahlivosť - myslím, že veľká, nemal by padnúť\r\nsprávnosť - tá nie je dôležitá\r\nefektívnosť - ťažko posúdiť\r\nprenosnosť - veľká, dá sa prenášať na hocijakom pamäťovom nosiči a spúšťať z neho\r\nznovupoužiteľnosť - tak v podstate áno, keď bude treba\r\n\r\no ostatných vlastnostiach si myslím nie je čo povedať\r\n\r\na aby ste sa mohli pokochať mojim veľdielom, ponúkam vám link na stiahnutie:\r\nhttp://valdik5379455.110mb.com/dl/Text_editor.zip\r\n\r\nale pred začatím poučívania si pozorne prečítajte Licenciu, a ak budete používať môj program bez súhlasu s licenciou, budú právne následky :)	t	2008-03-07 08:10:02	2009-02-25 23:35:04	Ako vyvíjať softvér	Ale teraz vážne. Toto sa môže úplne stať aj v "reálnom svete" (ak ste si nestiahli a nespustili môj program, tak to teraz prosím spravte). Predstavte si, že zákaník niečo chce, ale ako je nám dobre známe, on väčšinou ani nevie, čo chce. On si niečo povie a každý z vývojového tímu to inak pochopí. Keď sa k tomu pridajú štandardné nedostatky v komunikácii, tak je z toho na 95% tupý nepoužiteľný soft. Akurát jeho vývoj nebude trvať 10 minút ako v mojom prípade, ale podstatne dlhšie. A zákazník bude musieť zaplatiť, lebo zmluva a firma si poškodí reputáciu, lebo jej ľudia nakódili hovadinu. \r\n\r\nTakže radšej nepodceňujme UML.\r\n\r\n_________\r\nRád by som ešte povedal, že sa zdržiavam od verejnej prezentácie vtipu a je mi jedno, či ostanem v anonymite (kto ma pozná, vie, že ten link hore smeruje na moju stránku). \r\n\r\nA všetky body, ktoré dostanem za tento vtip prosím pošlite hladujúcim deťom v Afrike. \r\n\r\n(a ak autor tohto formuláru nastavil malý limit na dĺžku textu a usekne sa mi to niekde v polovici, tak ma asi porazí)	Vladimír Mihál	valdik5379455@gmail.com	5	* PRÍBEH TÝŽDŇA 3 *
319	Chlapec vychutnávajúc cigaretku vypúšťa obláčiky dymu do ovzdušia.\r\nFrajerke to začína vadiť a vraví mu: \r\n"Čo nevidíš to varovanie na krabičke, že fajčenie ohrozuje vaše zdravie?"\r\n"Ale drahá, ja som programátor. Nezaujímajú ma varovania, iba errory."	t	2008-03-07 22:18:26	2008-03-17 23:33:05	Warning vs. error	Je dobré dať si poradiť od druhých. Niekedy aj bežný človek môže pomôcť pri riešení nejakého problému.	Miro Polgár	miropolgar@gmail.com	\N	dobré, ale poučenie mohlo byť lepšie
320	http://onproductmanagement.files.wordpress.com/2007/07/treecomicbig.jpg	t	2008-03-08 12:16:01	2008-03-17 22:28:59	Vývoj softvéru v praxi	Kazda faza vývoja softvéru je rovnako dôležitá, keď sa odflákne jedna, ostatné sa "zvezú".	Marcel Balaz	xbalazm4@is.stuba.sk	\N	dobré, ale poučenie mohlo byť lepšie
321	Vojde turista v San Franciscu do obchodu so zvieratami a obzerá si opicu. V tom vojde iný chlap, ide rovno k predavačovi a pýta si:\r\n- Prosím jednu opicu typu C++.\r\nPredavač mu ju podá, chlap zaplatí 5000 dolárov a odchádza.\r\nPrekvapený turista sa pýta:\r\n- Prosím vás, čo to bolo za opicu, že bola tak drahá?\r\n- No, viete, ona dokáže programovať v C++, bez chýb, efektívne, úhľadný kód. Veľmi dobrá investícia.\r\n- A tamtie opice?\r\n- Tie stoja 10 000 dolárov, vedia programovať v C++, v Jave aj v XML.\r\n- Preboha, a tam máte opicu za 50 000! Čo dokáže tá?\r\n- No, aby som pravdu povedal, ešte som ju nevidel nič robiť, ale ostatné\r\nopice ju oslovujú "Project manager"	t	2008-03-09 10:02:28	2009-02-25 23:34:38	Projektový manažér	Koordinácia ľudí je vysoko lepšie ohodnotená ako koordinácia kódu, zvyšok je už na nás...	Marcel Džačovský	marcellitoo@gmail.com	5	* PRÍBEH TÝŽDŇA 4 * 
322	Bavia sa spolu dvaja kóderi:\r\n- Tuším, že si potrebujem odpočinúť od práce.\r\n- Ako si myslíš, že to urobíš?\r\n- Hneď ti to ukážem a povesil sa za trám hlavou dole.\r\n\r\nPrišiel šéf, vidí zamestnanca visiaceho zo stropu a pýta sa ho, čo robí.\r\n- Som žiarovka, odpovedal.\r\n"Myslím, že potrebuješ voľno", povedal šéf a chlapík na to zoskočil a odišiel domov.\r\n\r\nDruhý zamestnanec sa rovnako zdvihol a šiel za ním.\r\nŠéf sa ho pýta, kam ide a on mu na to odpovedá: „Taktiež domov, nebudem predsa pracovať po tme!“\r\n	t	2008-03-09 10:18:52	2008-03-17 22:32:22	Fajront	Musíme si dávať pozor v akom prostredí pracujeme, lebo žiadne peniaze nestoja za stratu zdravia.	Marcel Džačovský	marcellitoo@gmail.com	\N	veľmi dobré, poučenie ale mohlo byť lepšie
323	Chlap si pofajčieva cigaretu a vyfukuje obláčiky dymu. Jeho priateľka\r\nsa naštve a vraví mu:\r\n- nevidíš, že je na krabičke napísané varovanie, že to škodí zdraviu!\r\na on na to:\r\n- láska, ja som programátor, nás nezaujimajú warningy, iba errory...	t	2008-03-09 10:24:01	2009-06-05 19:17:13	Fajčenie škodí zdraviu	Správny programátor považuje aj warning za error.	Marcel Džačovský	marcellitoo@gmail.com	\N	Poučenie nie celkom jasne, nebáť sa písať.
324	Zomrie programátor. Pri nebeskej bráne zbadá samotného pána boha a hneď mu začne vyčítať:\r\n- Bože, prečo si ma nechal takého mladého zomrieť? ženu som nepodvádzal, vírusy som nepísal, pwl-súbory nekradol... tak prečo, pane bože, prečo?\r\n\r\nBoh na neho zamáva bibliou a povie:\r\n- rtfm, synku, rtfm.	t	2008-03-09 10:33:19	2008-03-17 22:32:00	RTFM	Výstižne a zrozumiteľne napísaná dokumentácia je polovicou úspechu pri komunikácii s klientom.	Marcel Džačovský	marcellitoo@gmail.com	\N	dobré, ale poučenie mohlo byť lepšie opísané
325	Vačšina (nielen) softvérových firiem vám ponúkne 3 základné vlastnosti produktu.\r\n- kvalitný\r\n- rýchlo dodaný\r\n- lacný\r\nVybrať si však možete len 2. Takže:\r\n- ak chcete kvalitný produkt a rýchlo, nebude lacný\r\n- ak chcete kvalitný a lacný produkt, budete si naň musieť počkať\r\n- ak chcete produkt rýchlo a lacno, nebude kvalitný\r\n\r\n(poznámka: akákoľvek podobnosť s osobou žijúcou alebo mŕtvou, firmou, organizáciou či udalosťou je čisto náhodná)	t	2008-03-15 16:49:33	2008-03-17 23:32:46	Dva z tri	Vždy je potrebné zvážiť naše požiadavky na produkt, pretože sa môžu navzájom ovplyvňovať, prípadne vylučovať	Martin Škrabák	36092@is.stuba.sk	\N	dobré a k veci, aj keď to veľmi vtip nie je
326	Kde bolo, tam bolo, boli raz traja programátori. Každý pracoval v inej oblasti, ale predsa sa navzájom ovplyvňovali.\r\nJeden písal vírusy, druhý písal antivírové programy a ten tretí vytváral operačné systémy, pod ktorými oboje fungovalo.\r\n\r\n(poznámka: akákoľvek podobnosť s osobou žijúcou alebo mŕtvou, firmou, organizáciou či udalosťou je čisto náhodná)	t	2008-03-15 17:02:24	2008-03-17 23:32:36	Traja programátori	Kompatibilita je vždy dôležitá.	Martin Škrabák	36092@is.stuba.sk	\N	no, celkom som nepochopila
337	Musí to byť takto, bez toho obrázka je to o ničom =)\r\n\r\nhttp://linkegypt.com/blog/wp-content/uploads/2008/03/Ajax-Development-Software-Development-Software-Development-software_development11.jpg	t	2009-02-23 20:39:14	2009-05-02 12:19:46	Ako to vyzerá na vývoji	trebars... Nie vsetko je vzdy tak, ako to na prvy pohlad vyzera?	Roman Meszaros	roman.meszaros@gmail.com	4	Starý a stále dobrý obrázok
338	Rozprávajú sa dvaja programátori.\r\nPrvý: "Ako sa máš?"\r\nDruhý: "Doktor mi povedal, že mám po tejto dlhej zime oslabený organizmus.\r\nPrvý: "A co ti doporučil?"\r\nDruhý: "Beta karoten. Na ten mu ale kašlem. Počkám, až bude plná verzia."	t	2009-02-24 09:18:19	2009-05-02 12:20:29	Beta verzia...	Čakanie na plnú verziu vám občas môže spôsobiť problémy v zdraví (a to nielen po fyzickej stránke).	Zuzana Samardžiová	jujka1@gmail.com	\N	Dobré, aj keď poučenie mohlo byť lepšie
327	Informatik rozozná 14 typov žien:\r\n \r\n   1. Internet žena – musíte zaplatiť, aby Vám bol povolený prístup\r\n\r\n   2. Server žena – vždy je zamestnaná a obťažená keď ju potrebujete\r\n\r\n   3. Windows žena – viete, že má veľa chýb, ale nemôžete žiť bez nej\r\n\r\n   4. PowerPoint žena – ideálna na prezentáciu kamarátom, na nejakej slávnosti\r\n\r\n   5. Excel žena – rozpráva sa, že môže všeličo, ale Vy ju aj ďalej používate iba na 4 základné funkcie\r\n\r\n   6. Word žena – každým dňom Vás stále viac a viac prekvapuje, a predsa neexistuje nikto na svete kto jej naozaj rozumie\r\n\r\n   7. MS-DOS žena – všetci ju mali a nikto ju už nechce\r\n\r\n   8. Back-up žena – myslíte si, že má všetko, no keď vám je najviac potrebná, pochopíte, že jej predsa niečo chýba\r\n\r\n   9. Scandisc žena – všetci vieme, že môže urobiť veľa dobrého a, že nám chce iba dobre, no v podstate nikto nevie, čo dokaze\r\n\r\n  10. Screen server žena – nemá zvláštne funkcie, ale dobre sa na nu pozera\r\n\r\n  11. Hard disk žena – Pamätá si na všetko, v každej dobe dňa\r\n\r\n  12. E-mail žena – rozpráva Vám 10 vecí, a z toho je iba jedna užitočná\r\n\r\n  13. Vírus žena – keď to najmenej očakávate, nastahuje sa do Vášho bytu a privlastni si Vase veci. Ak sa ju pokúsite vyhodit, stratite niekolko veci. Ak nebudete robiť nic, časom stratite všetko.\r\n\r\n  14. SAP žena – Po dlhoročnej práci a vyhláseniu bankrotu, konečne ste si ju prispôsobili Vaším požiadavkám. Zatial sa na trhu objavila omnoho dokonalejsia a jednoduchsia verzia.\r\n\r\n	t	2008-03-16 22:43:34	2008-03-17 23:32:26	Ženy podľa programátora	Potrebné je dobre preštudovať každý softvérový systém a až po dlhom uvažovaní si vybrať jeden...\r\n\r\n(Preto si hľadajte ženu linux kernel - 2 cyby na 1000 riadkov kodu!)	Juraj Belanji	juraj.belani@yahoo.com	\N	veľmi dobré, poučenie ale mohlo byť lepšie
328	Programátor hovorí:\r\n"Na svete je len 10 typov ľudí. Takí, ktorí vedia čítať binárne a takí ktorí nie."	t	2008-03-19 11:04:25	2008-05-14 14:48:53	10 typov ľudí	Pri písani dokumentácie si treba uvedomiť, že nie každý používateľ má rovnaké znalosti v danej oblasti ako autor daného dokumentu.	Andrej Binder	andrej@binder.sk	\N	dobré a k veci
329	V pondelok ráno sa programátor zobudí a povie: "Ešte dvakrát sa vyspím a bude zase víkend."	t	2008-03-20 01:04:47	2008-05-14 14:49:15	Pondelok ráno	Základom úspechu je dobre si rozdeliť čas. Najmä u študentov je čas zostávajúci do odovzdania priamo úmerný dĺžke spánku.\r\nAle nesmieme zabúdať, že sklony k insomnii cez noc sa kompenzujú sklonmi k narkolepsii v nasledujúci deň!	Martin Škrabák	skrabak06@student.fiit.stuba.sk	\N	dobré a k veci
330	Nezamestnaný sa ucházda o miesto čističa toalet v Microsofte.\r\n\r\nVedúci osobného oddelenia ho pozve k prijímaciemu pohovoru\r\na ku skúške spôsobilosti. Nakoniec mu povie: Ste prijatý, dajte \r\nmi svoju  e-mailovoú adresu, my Vám pošleme pracovnú zmluvu \r\ns dátumom nástupu.\r\n\r\nNezamestnaný mu zúfalo povie, že vôbec nemá počítač,\r\nnie to ešte e-mail adresu.\r\n\r\nPersonalista mu odpovie: Keď nemáte e-mail adresu, \r\ntak virtuálne neexistujete, a keď neexistujete, tak Vás nemôžeme zamestnať.\r\n\r\nMuž zúfalo odíde a nevie čo si počne. \r\nZa posledných 10$, ktoré má, kúpi 10kg jahôd.\r\n\r\nZačne ich ponúkať po domoch. Behom 2 hod. investované peniaze\r\nzdvojnásobí. To celé opakuje 3x a vracia sa domov so 60$.\r\n\r\nPochopí, že takto by mohol prežiť. Ďalšie dni začína skôr a končí\r\naž denný vklad zoštvornásobí.\r\n\r\nKrátko na to si kúpi bicykel, skoro ho vymení za dodávku \r\na neskôr je majiteľom veľkej dopravnej firmy.\r\n\r\nPo 5 rokoch… \r\n…je majiteľom jedného z najväčších potravinárskych veľkoobchodov v USA.\r\n\r\nZačne myslieť na budúcnosť a rozhodne sa uzavrieť dôchodkové poistenie. \r\nPozve si zástupcu poisťovni a vyberie si dobrú ponuku.\r\nNa konci jednania chce maklér jeho e-mail adresu.\r\n\r\nBohužiaľ, ja nemám žiadnu e-mail adresu!\r\n\r\nNeskutočné, čuduje se maklér. Vy nemáte e-mail adresu a nariek tomu ste\r\nvybudoval také impérium. Predstavte si, kde by ste bol, keby ste mal e-mail adresu!\r\nMuž sa zamyslí a odpovie:\r\n \r\nČISTIL  BY SOM ZÁCHODY V MICROSOFTE!\r\n	t	2008-03-24 16:35:03	2008-05-14 14:50:39	Nezamestnaný	1. ponaučení:\r\nInternet nerieši Tvoje životné problémy!\r\n\r\n2. ponaučení: \r\nKeď nemáš počítač a veľa pracuješ, môžeš sa stáť milionárom!\r\n\r\n3. ponaučení: \r\nTy si tento príbeh dostal e-mailom.\r\nMáš teda bližšie k čističovi toaliet než k milionárovi!\r\n\r\nKoniec: Na tento mail mi neodpovedaj... \r\nŠiel som kúpiť JAHODY!!!\r\n	Peter Kubanda	pepok@centrum.sk	\N	dobré, ale pouěnie nie je celkom k veci
331	/*\r\n      TOP SECRET BestDevelopment(c)  Code\r\n      Project: Chicago(tm)\r\n      Projected release-date: Summer 1998\r\n    */\r\n \r\n     #include "osx1.h"\r\n     #include "os95.h"\r\n     #include "evenmore.h"\r\n     #include "oldstuff.h"\r\n     #include "billrulz.h"\r\n     #define INSTALL = HARD\r\n \r\n     char make_prog_look_big[1600000];\r\n \r\n     void main()\r\n     {\r\n         while(!CRASHED)\r\n        {\r\n             display_copyright_message();\r\n             display_bill_rules_message();\r\n             do_nothing_loop();\r\n             if (first_time_installation)\r\n             {\r\n                make_50_megabyte_swapfile();\r\n                do_nothing_loop();\r\n                totally_screw_up_HPFS_file_system();\r\n                search_and_destroy_the_rest_of_OS/2();\r\n                hang_system();\r\n             }\r\n             write_something(anything);\r\n             display_copyright_message();\r\n             do_nothing_loop();\r\n             do_some_stuff();\r\n             if (still_not_crashed)\r\n             {\r\n                 display_copyright_message();\r\n                 do_nothing_loop();\r\n                 basically_run_os_x.1();\r\n                 do_nothing_loop();\r\n                 do_nothing_loop();\r\n             }\r\n         }\r\n \r\n         if (detect_cache())\r\n             disable_cache();\r\n \r\n         if (fast_cpu())\r\n         {\r\n             set_wait_states(lots);\r\n             set_mouse(speed, very_slow);\r\n             set_mouse(action, jumpy);\r\n             set_mouse(reaction, sometimes);\r\n         }\r\n \r\n         /* printf("Welcome to OS X.11"); */\r\n        /* printf("Welcome to OS 96"); */\r\n        printf("Welcome to OS 99");\r\n        if (system_ok())\r\n              crash(to_dos_prompt);\r\n        else\r\n             system_memory = open("a:\\swp0001.swp", O_CREATE);\r\n \r\n         while(something)\r\n        {\r\n             sleep(5);\r\n             get_user_input();\r\n             sleep(5);\r\n             act_on_user_input();\r\n             sleep(5);\r\n        }\r\n        create_general_protection_fault();\r\n    }\r\n 	t	2008-03-29 12:19:16	2008-05-14 14:51:21	Nejaký zdrojový kód	Tak ako sú pri vývoji softvéru dôležití manažéri, analýza a všetky možné UML diagramy, nesmieme zabúdať aj na kvalitných vývojárov, lebo cely vývoj môže dopadnúť ako vo vyššie uvedenom prípade.	Michal Namesny	xnamesny@is.stuba.sk	\N	no, celkom to nemusí byť každému jasné :-)
332	(a) Napíš niečoo :)\r\n(b) .- .... --- .--- -.- -.--\r\n(a) ?\r\n(b) Ja som chodila do skauta :-P\r\n(a) 100001100010\r\n(b) ?\r\n(a) Ja na informatiku :-D 	t	2008-04-01 12:09:28	2009-02-25 23:33:58	Rozhovor	(Nielen) pri tvorbe softvéru je dôležité keď sa vedia ľudia vzájomne dorozumieť :)	Peter Marko	markopeter@pobox.sk	5	* PRÍBEH TÝŽDŇA 7 *
333	Na kurze venovanom softvérovému inžinierstvu dostali účastníci zvláštnu otázku:\r\n"Ak by ste nastúpili do lietadla a zistili by ste, že váš programátorský tím je zodpovedný za softvér letovej kontroly, koľkí z vás by okamžite vystúpili z lietadla"?\r\n\r\nPostupne sa zdvihli všetky ruky, niektoré okamžite, iné zdráhavo, až zostal len jeden muž s nezdvihnutou rukou. Keď sa ho inštruktor spýtal, čo by robil, odpovedal, že by pokojne zostal na palube lietadla. "So softvérom nášho tímu" vravel, "by sa lietadlo sotva dostalo na vzletovú dráhu, vzlietnuť by sa mu určite nepodarilo".	t	2008-04-06 20:35:39	2008-05-14 14:53:21	Lietadlo a kurz softvérového inžinerstva	Je dôležité vedieť odhadnúť nedostatky systému, aby sa predišlo následkom, ktoré môžu byť fatálne. Ešte dôležitejšie je niekedy vedieť určiť, kde sa nedostatky systému prejavia najskôr.	Michal Pajbach	mpajbach@gmail.com	\N	veľmi dobré
334	1. Programmer produces code he believes is bug-free.\r\n2. Product is tested. 20 bugs are found.\r\n3. Programmer fixes 10 of the bugs and explains to the testing department that the other 10 aren’t really bugs.\r\n4. Testing department finds that five of the fixes didn’t work and discovers 15 new bugs.\r\n5. Repeat three times steps 3 and 4.\r\n6. Due to marketing pressure and an extremely premature product announcement based on overly-optimistic programming schedule, the product is released.\r\n7. Users find 137 new bugs. Original programmer, having cashed his royalty check, is nowhere to be found.\r\n8. Newly-assembled programming team fixes almost all of the 137 bugs, but introduce 456 new ones.\r\n9. Original programmer sends underpaid testing department a postcard from Fiji. Entire testing department quits.\r\n10. Company is bought in a hostile takeover by competitor using profits from their latest release, which had 783 bugs.\r\n11. New CEO is brought in by board of directors. He hires a programmer to redo program from scratch.\r\n12. Programmer produces code he believes is bug-free …	t	2008-04-12 20:48:56	2008-05-14 14:53:44	O komerčnom softvéri	Keď sa niečo robí narýchlo a len pre peniaze, tak to tak aj vyzerá.	Marcel Baláž	35569@is.stuba.sk	\N	dobré, ale pouěnie nie je celkom k veci
335	Príde pani Bieliková na prednášku s meotarom a povie: "Ak nebudete tri dni jesť, tak si môžete kúpiť knihu." :)	t	2009-02-23 16:32:27	2009-06-05 19:19:02	Tri dni nejesť	Kto sa chce niečo naučiť, musí prestať jesť :)	Juraj Mäsiar	jm@banisko.sk	\N	no comment :-))
336	Dr. Vranič na zápočtovke z OOP: "Ukážte mi vašu implementáciu polymorfizmu."\r\nNemenovaný študent: "To čo je? Povedzte mi čo to je a ja vám to ukážem."	t	2009-02-23 16:36:52	2009-06-05 19:19:20	OOP	Sú na svete ľudia, bez ktorých by život bol nudný...	Adam Mihalik	xmihalika@is.stuba.sk	\N	no comment :-))
339	<Lenni> Ahojky, nějaký chytrý klučina?\r\n...\r\n<Lenni> Prohodil by tu se mnou někdo pár slovíček? :) plosííím\r\n...\r\n<Lenni> Ach jo, jenom bych potřebovala poradit s jedním programem v C++!\r\n<Gery> No ahojky\r\n<Hrdla> cuss copak potrebujes?\r\n<satan> Lenni: s cimpak mas problem? 	t	2009-03-12 11:23:56	2009-05-02 12:20:59	Pokec... :D	navod, ako zbalit programatora... :D	Radovan Kuka	radowank@gmail.com	\N	Poučenie mohlo byť viac k veci.
340	Bratislava vyhlásila konkurz na stavbu nového mosta. Do súťaže sa prihlásili traja záujemcovia.\r\nAko prvý prišiel Ukrajinec, vytiahol všetky plány a návrhy a navrhol postavenie mostu za 350.000 E, pričom 100.000 by zobrala firma 100.000 by išlo na personál a 150.000 na materiál.\r\nAko druhý prišiel Poliak, tiež vytiahol všetky plány a začal prezentovať riešenie, výslednú sumu stanovil na 250.000 E. Personál 50.000 E a materiál 150.000 E a 50.000 E pre firmu.\r\nAko posledný prišiel Slovák a navrhol, že most postaví za 2.250.000 E. Na to sa ho vyhlasovateľ súťaže opýta: "Moment, takže vy nemáte žiadne plány, návrhy ani architektov a chcete prejsť s najdrahším návrhom?" Slovák na to: "Takže môj plán znie tak, že ja 1.000.000 mne, 1.000.000 Vám a za 250.000 nám to tu Poliak postaví."	t	2009-03-12 16:35:22	2009-05-02 12:22:02	Expertny odhad	Aj takto sa dajú robiť expertné odhady, môže byť dobré si nechávať aj rezervu =)	Roman Mészároš	roman.meszaros@gmail.com	4	Dobré a platí aj pre tvorbu softvéru.
341	Hovorí informatik: Takú ti strelím, že ťa ani Google nenájde..	t	2009-03-12 17:37:23	2009-06-05 19:19:44	google	...nič netreba preháňať...	Milan Ďuriška	duriska.milan@gmail.com	\N	Poučenie mohlo byť viac k veci.
342	Jozo: "Fero, ako sa mas?"\r\nFero: "Zle."\r\nJozo: "Preco?"\r\nFero: "Jazdim na aute bez strechy, jem plesnive syry a pijem stare vino..."	t	2009-03-18 22:30:36	2009-05-02 12:23:16	Splnenie poziadaviek	Ani ten najlepsi softver nemusi prejst kritikou zakaznika, ked nesplna jeho poziadavky, pripadne ked zakaznik nevie, co je prenho dobre.	Roman Meszaros	roman.meszaros@gmail.com	3	Dobré vloženie do kontextu tvorby softvéru.
343	Cyklus vývoja softvéru:\r\n\r\n1. Programátor vytvorí program o ktorom si myslí, že funguje bez chýb\r\n2. Produkt sa otestuje. 20 chýb nájdených.\r\n3. Programátor opraví 10 chýb a testerom vysvetlí že tých zvyšných 10 nie sú chyby, ale funkcie o ktorých nevedeli\r\n4. Testovacie oddelenie zistí že 5 opráv nefungovalo a našli 15 nových chýb\r\n5. 3x sa zopakuje 3. a 4. krok\r\n6. Kvôli tlaku z marketingového oddelenia a extrémne predčasne určenému dátumu vydania založenom na prehnane optimistickom pláne, produkt je vydaný\r\n7. Používatelia nájdu 137 nových chýb\r\n8. Pôvodný programátor sa po vyplatení šeku nikde nedá zohnať\r\n9. Novo zostavený programátorský team opraví takmer všetkých 137 chýb, ale vytvorí 456 nových\r\n10. Pôvodný programátor pošle nedostatočne zaplatenému testovaciemu oddeleniu pohľadnicu z Fiji. Celé oddelenie dá výpoveď.\r\n11. Firma je odkúpená konkurenčnou firmou, ktorá využila profit z poslednej verzie programu, ktorý mal 783 chýb\r\n12. Nový riaditeľ najme nového programátora aby spravil celý program od začiatku\r\n13. Programátor vytvorí program o ktorom si myslí, že funguje bez chýb...	t	2009-04-21 21:43:31	2009-05-02 12:24:46	Cyklus vývoja softvéru	Vzdy treba k tvorbe softveru pristupovat systematicky a planovat. Tiez treba vyvíjany softver priebezne testovat aby sa predislo zbytocnym chybam, ktore sa lahsie opravuju uz pri vyvoji ako pocas pouzivania.\r\n\r\nA preto treba softverovych inzinierov :)	Michal Kebis	michal@bonet.sk	3	Je to žial často tak.
344	Doktor, architekt a programátor sa rozprávali, koho profesia je najstaršia. Doktor povedal, že medicína bola najstaršou, pretože boh spravil prvú operáciu keď vybral Adamovi rebro. Architekt mu oponoval tým, že ešte predtým boh "skonštruoval" zem a nebo z ničoho.\r\nDoktor uznal že architekt musí mať pravdu a že architektúra je naozaj najstaršia profesia. Ale v tom sa ozval programátor a tvrdil, že programovanie je ešte staršie. Doktor aj architekt ho však uzemnili s tým, že architektúra musí byť najstaršia, pretože predtým ako boh stvoril zem a nebo, nebolo nič okrem Ničoty a Chaosu!\r\n\r\nProgramátor sa iba zasmial a povedal: "A čo myslíte, odkiaľ pochádza ten Chaos?"	t	2009-04-21 21:53:00	2009-05-02 12:25:37	Najstarsie programovanie	Máme šťastie, že v tých dobách ešte neexistovali softvéroví inžinieri. Inak by sme tu možno neboli...	Michal Kebis	michal@bonet.sk	3	Poučenie nie celkom jasne, nebáť sa písať.
345	The Downfall of Agile Hitler... \r\nhttp://geekswithblogs.net/wojan/archive/2009/05/09/131926.aspx	t	2009-05-11 20:18:14	2009-06-05 19:20:18	The Downfall of Agile Hitler... 	Najhodnotnejšie vedomosti sú tie, ktoré sme získali rozmýšľaním...\r\n(nie všetky poučenia prichádzajú na podnose :P)	Rado	bod@bod.sk	\N	pozrite si
346	V počítačové učebně chodí učitelka od jednoho počítače ke druhému a pozorně si je prohlíží. Kouká na ni admin a řehtá se, přijde k němu systémák a ptá se: "Čemu se tak směješ?" - "Tahle ženská za mnou přišla, že se jednomu dítěti ztratil panel z Nortona. Tak jsem jí poradil, ať si buď přečte manuál k Nortonu, nebo se podívala po ostatních compech, jestli někdo někde nemá tři panely. Jak vidíš, ten manuál si nepřečetla..."	t	2009-05-27 18:59:09	2009-06-05 19:20:31	učiteľka informatiky	Na co pisat dokumentaciu, aj tak ju nikto necita :)\r\nAlebo cita?	Martin Svetlík	svetlik@p-mat.sk	\N	Poučenie nie celkom jasne, nebáť sa písať.
347	Žena programátora posílá nakupovat manžela: "Kup 15 rohlíků a kdyby měli vejce, tak kup 30." Muž přijde do obchodu a ptá se: "Máte vejce." - "Ano, máme", odpoví prodavačka. - "Tak 30 rohlíků."	t	2009-05-27 19:05:32	2009-06-05 19:21:23	podmienka	Programátor by mal porozumieť zadávateľovým požiadavkám. Žaľ, niekedy to znamená "znížiť" sa na jeho úroveň :)\r\nAle ako vraví staré čínske príslovie "Ten, kto sa opýta, vyzerá ako hlupák na päť minút. Ten, kto sa neopýta, ním zostane navždy."	Martin Svetlík	svetlik@p-mat.sk	\N	Dobré, aj keď poučenie mohlo byť lepšie
348	Sedi zajko na pniku a nieco pise. Ide okolo liska a pyta sa ho: - Zajac,co to pises?\r\n- Diplomovu pracu na temu Ako zajace lisky kynozia.\r\n- Ale zajac ved to je uplne naopak.\r\n- Nie je ! Neveris, pod sa pozriet a zavedie ju do svojej nory. Von sa vsak uz vrati bez nej. Na druhy den ide okolo vlk.\r\n- Zajac, co to pises?\r\n- Diplomovu pracu na temu Ako zajace vlkov kynozia. - - Ale zajac, ved to je uplne naopak.\r\n- Nie je ! Neveris, pod sa pozriet a zavedie ho do svojej nory. Von sa vsak uz vrati bez neho. Na treti den ide okolo medved.\r\n- Zajac, co to pises?\r\n- Diplomovu pracu na temu Ako zajace medvede kynozia.\r\n- Ale zajac, ved to je uplne naopak.\r\n- Nie je ! Neveris, pod sa pozriet a zavedie ho do svojej nory. Tam napravo kopa roztrhanych lisok, nalavo kopa roztrhanych vlkov, vzadu zopar roztrhanych medvedov, uprostred velky lev a zajac hovori:\r\n- Vidis, vidis medved, nezalezi na tom, aku diplomovu pracu pises, ale akeho mas konzultanta.	t	2009-10-21 19:39:57	2011-02-20 00:22:24	Tema diplomovej prace	Proces je dolezity.	Marian Beno	xbenom4@is.stuba.sk	\N	dobré
349	List užívateľky:\r\n\r\nDobrý deň,\r\nkeď chcem skopírovať film na disketu, tak keď dám "vložiť", objaví sa mi hláška, že na disku A nie je dostatok miesta. Potom dám "vložiť zástupcu" a potom sa už film na disketu vojde. Problém však nastane, ak ho chcem spustiť na inom PC, pretože sa mi objaví hláška "zástupca nenájdený", pritom v mojom počítači ten film z diskety normálne spustím. Čo s tým môžem urobiť?\r\n\r\nOdpoveď z hotline:\r\n\r\nVážená užívateľka,\r\ndo Vašej kabelky nenapcháte svoj kožuch. Lístok s tým, že kožuch máte v skrini, sa Vám však do kabelky vojde. Takže pokiaľ ste doma a prečítate si lístok z kabelky, že kožuch máte v skrini, tak si ho tam aj nájdete. Horšie je to, ak ste u priateľky, vytiahnete lístok z kabelky a prečítate si, že v skrini máte kožuch. V priateľkinej skrini môžete hľadať koľko chcete, ten kožuch tam určite nenájdete...\r\nEšte pomôcka: Kabelka = disketa, kožuch = film, lístok = zástupca, skriňa = počítač, moly v skrini = počítačový vírus, sused v skrini = hacker, manžel vracajúci sa zo služobnej cesty a dobývajúci sa do skrine = BSA (Business Software Alliance)... 	t	2009-10-30 13:27:38	2011-02-20 00:23:17	Kožuch do kabelky nestrčíš	My programátori sa musíme naučiť komunikovať s ľuďmi, ktorí sa v našom odvetví príliš dobre neorientujú a nerozumejú všetkým naším "čarovným slovíčkam". Preto je vhodné pri dohodovaní sa so zákazníkom o vyvíjanom softvéri použiť vhodný jazyk aby sme sa dorozumeli.	Michal Cádrik	cadrikm@gmail.com	4	výborné
350	Sú to skutočné hlášky užívateľov pri predvádzaní objednaných programov...\r\n\r\nI.To, čo nám tu ukazujete, ale nie je to, čo sme v skutočnosti chceli, ale vám to nepovedali... \r\n\r\nII.Aha. Tak to, čo ste nám ukázali, sa nám naozaj páči. Ale dúfam, že to nebudeme musieť používať...\r\n\r\nIII.To tlačidlo na tom formulári nesmie byť hore, musí byť dolu! Viete, koľkokrát denne by som musela tlačiť myš do kopca???\r\n\r\nIV.A až to budete programovať naozaj, tak vám poviem, ako to má vyzerať...\r\n\r\nV.Viete ako strašne zdržuje, keď sa musím do programu prihlásiť a zadať heslo? Nemohol by ten počítač podľa niečoho vedieť, že pri ňom sedím naozaj ja???...\r\n\r\nVI.No, ja viem, že som vám tú analýzu podpísal, ale myslel som, že to je len akože, ja som vôbec netušil, že to podľa toho urobíte...\r\n\r\nVII.Ja vždy odklepnem OK. Naozaj nemám čas čítať, čo je tam napísané...\r\n\r\nVIII.- Na tom formulári je asi 20 položiek a to je strašne neprehľadné. Ja ich potrebujem tak najviac päť.\r\n- Áno, a ktorých 5?\r\n- No, to vám takto neviem povedať. Podľa potreby. To sa vždy mení. Ale ja potrebujem, aby tam boli len tie položky, s ktorými práve chcem pracovať!\r\n\r\nIX.Ten program musíte spraviť tak, aby som nemusel používať myš. Tu sa myš na stôl nezmestí, tam musí stáť káva!\r\n\r\nX.Ten program sa ma stále na niečo pýta! Nech sa ma na nič nepýta, ja som introvert!\r\n\r\nXI.A nemohli by ste nám tú chybu, čo ste opravili, znovu vrátiť? Viete, my sme si už na ňu tak zvykli, že to tam musíme odklepnúť - a teraz by sme mohli odklepnúť niečo iné!... \r\n\r\nXII.To ma nezaujíma, že toto sú nejaké Windowsy a tamto bol DOS! Ja mám nacvičený nejaký prstoklad a musí to tak fungovať všade! 	t	2009-10-30 13:27:40	2011-02-20 00:47:49	Nesmrteľné hlášky užívateľov	Pred navrhovaním softvéru treba so zákazníkom prekonzultovať jeho požiadavky do úplných maličkostí a detailov. Inak sa nám môže prihodiť niečo podobné ...	Michal Cádrik	cadrikm@gmail.com	3	výborné
351	Sedia dvaja matfyzáci vo vlaku, keď si k nim po chvíli prisadnú dve nádherné študentky.  V tom jeden hovorí tomu druhému:"Myslíš na to isté na čo ja?" - "No jasné!", odpovie druhý, "A koľko ti to vyšlo?"	t	2009-10-30 13:33:21	2011-02-20 00:48:54	zo susedstva FIIT	1. občas treba vypnúť...\r\n2. nechoďte na FMFI :)	Patrik Polakovic	ppolakovic1@gmail.com	\N	nie celkom k téme softvérového inžinierstva
352	Muz leti v balone a zistil, ze sa stratil. Klesol s balonom nizsie a zbadal pod sebou ineho muza. Znizil rychlost a zakrical na muza pod nim: "Prepacte, mozete mi pomoct? Slubil som svojmu priatelovi, ze sa s nim stretnem, ale meskam uz pol hodinu, no neviem kde som."\r\nDruhy muz mu odpovedal: "Ano, ste v teplovzdusnom balone, 15 metrov nad zemou, medzi 40 a 42 stupnom zemepsinej sirky a madzi 58 a 60 stupnom zemepisnej dlzky."\r\n"Vy musite byt programator," hovori muz v balone.\r\n"Ano, som," odpovedal mu. "Ako viete?"\r\n"Nuz, vsetko co ste mi povedali, je technicky spravne,ale neviem ako by sa dali vyuzit vase informacie a faktom je, ze som stale strateny."\r\nMuz pod nim hovori: "Vy musite byt projektovy manazer."\r\n"Ano, som. Ale ako to viete?"\r\n"Nuz, neviete kde ste ani kam idete. Dali ste slub, o ktorom nemate ponatia ako ho dodrzat a ocakavate od niekoho ineho, aby vyriesil vas problem."	t	2009-10-30 14:01:33	2011-02-20 00:50:29	Programator a projektovy manazer	pre programatorov: vytvarat programy, ktore budu nie len technicky spravne, ale aby splnili svoj ucel a dali sa vyuzit :)\r\n\r\npre projektovych manazerov: neslubovat, to co nemozeme splnit, lebo nam to nebude robit dobre meno do buducna ... vzdy si urobit taky plan, ktory bude splnitelny a podla ktoreho budeme vediet, kam smeruje nas projekt :)	Pavel Michalko	xmichalkop@stuba.sk	4	výborné
353	Vopred sa ospravedlnujem za to, ze sem nepridavam vtip, ale odkaz na usmevny clanok. Jeho odkaz pre predmet PSI je vsak taky silny, ze som si to nemohol odpustit.\r\nhttp://zdrojak.root.cz/clanky/jak-vyhodit-penize-za-zbytecny-web/	t	2009-10-30 14:19:44	2011-02-20 00:52:29	Ako vyhodit peniaze za zbytocny web.	Pri kazdom kazdom vyvoji softveru je dolezita analyza a komunikacia so zakaznikom. Nepotrebne aplikacie totiz nikto nepotrebuje. Nedostatocna komunikacia so zakaznikom a nejasne predstavy na oboch stranach moze taktiez viest k predrazeniu projektu, pripadne zruseniu objednavky, ci poskodeniu dobreho mena firmy(programatora).	Michal Biros	birosh@gmail.com	\N	aj keď nie vtip, tak výborné a poučné
354	Dvaja informatici sa rozprávajú:\r\n\r\n- Predstav si, včera som sa v bare zoznámil s nádhernou blondínou.\r\n- Ty máš šťastie.\r\n- Pozval som ju k sebe, trochu sme pili, objal som ju.\r\n- A potom bolo čo ?\r\n- Zrazu mi hovorí : 'Vyzleč ma!'\r\n- Teeeda.\r\n- Vyzliekol som jej tričko, sukňu, potom som ju posadil na stôl vedľa notebooku........\r\n- Alečo, kúpil si si notebook? S akým procesorom?	t	2009-10-30 14:30:44	2011-02-20 00:53:20	dobrý rebríček priorít ...	Nechceme tak skončiť ??? ...\r\n\r\n...žime aj v realnom svete.	Jozef Lačný	lacny.jozef@gmail.com	\N	dobré
355	http://www-ucjf.troja.mff.cuni.cz/scheirich/index.php?s=4&strip=1\r\n\r\náno, je matfyzácky, ale maximálne sedí na fiitkárov:-D	t	2009-10-30 14:30:56	2011-02-20 00:56:21	Komix o NÁS!	nehádžte nás všetkých do jedného vreca, my už v ňom sme:-D	Maruška Marušáková	maruska.marusakova@gmail.com	\N	komix, dost dlhy :-)
356	http://www-users.cs.york.ac.uk/susan/joke/foot.htm	t	2010-08-06 00:32:01	2011-02-20 00:59:10	How to shoot yourself in the foot:-)	Don´t shoot	Maruška Marušáková	maruska.marusakova@gmail.com	\N	externy zdroj
357	Na svete je 10 typov ludi.\r\nTi, ktori vedia trojkovu sustavu, ti ktori nevedia a ti, ktori si mysleli, ze to je binarny vtip.	t	2011-03-08 19:58:43	2011-03-08 19:58:43	10 typov ludi	Aj ked si myslime, ze nieco pozname, nemusi to tak naozaj byt :)	Matus Krizan	xkrizan@is.stuba.sk	\N	\N
358	A TCP packet walks into a bar and says, "I'd like a beer." The bartender replies, "You want a beer?" The TCP packet replies, "Yes, I'd like a beer."\r\n\r\nA UDP packet walks into a bar and asks for a beer, but the bartender doesn't acknowledge him.\r\n\r\nAn ARP packet walks into a bar and introduces himself.\r\n\r\nAn ICMP packet walks into a bar and orders 10 shots of whiskey and to make it fast. The bartender asks him what he rush is. The packet says: "I'm afraid I don't have much Time to Live left."\r\n\r\nBit Torrent packet go to bar and asks for beer. Everyone in the bar who have beer gives him a sip.\r\n\r\nAn AppleTalk packet walks into a bar and orders a beer, but nobody understands.\r\n\r\nIPv4 walks into a bar The bartender asks, "what'll it be?" IPv4 responds, "a strong CIDR please... I'm exhausted.	t	2011-03-08 20:29:52	2011-03-08 20:29:52	Zaklady sietariny (anglicky)	Mozno pouzitelne pri prezentacii projektu, ktory ma nieco docinenia so sietarinou	Matus Krizan	xkrizan@is.stuba.sk	\N	\N
359	Vymente "essay" za "projekt TSS/PSI"\r\n\r\nhttp://imgur.com/9lc0c	t	2011-03-08 20:37:09	2011-03-08 20:37:09	Projekt na TSS v roznych jazykoch	Na vybere jazyka naozaj zalezi :D	Matus Krizan	xkrizan@is.stuba.sk	\N	\N
360	Studenti SjF, FCHPT, FEI a FIIT idu v aute. Auto zrazu z nicoho nic zastavi. Student SjF hovori: "Myslim si, ze sa roztrhol remen, co sposobilo zastavenie auta." Student FCHPT na to odpoveda "Ja si naopak myslim, ze autu doslo palivo a teda spalovanie nie je mozne". Pridava sa aj student FEI: "Podla mna sa pokazil alternator a vybila baterka a preto sviecky nedavaju iskru". Student FIIT ich tak pozoruje a nakoniec zahlasi "Myslim, ze by sme mali vsetci vystupit a skusit nastupit znova."	t	2011-03-08 20:50:02	2011-03-08 20:50:02	STU vylet	Ten student z FIIT bol urcite softverovy inzinier.	Matus Krizan	xkrizan@is.stuba.sk	\N	\N
361	V Polsku v dobach tuheho socialismu si jeden docent matematiky spocital, ze robotnik v lodenici zarobi 3 x viac ako on. Tak si povedal,\r\nkaslat na to, preskrtal tituli pred i za menom a siel do fabriky. Vo fabrike sa mu darilo, moc sa nepretrhol a dostaval 3x viac ako na skole. Potom fabrika predstavila vecernu skolu pre robotnikov, a ze kto tam bude chodit, dostane pridane na plate. Tak sa tam docent zapisal a zacal chodit. Hned prvu hodinu bola matematika. Obtiaznost ako v prvom rocniku na strednej, takze docent len tak pospava a nedaval pozor. Vsimne si ho ucitel, vyvola k tabuli a da mu spocitat obsah kruhu. Docent zacne pisat, ale ani za svet si nemoze spomenut na vzorec pre obsah kruhu, takze sa to rozhodne odvodit. Napise si prevod do polarnych\r\nsuradnic, potom to integruje a vyde mu -pi*r^2, tak tam stoji a premysla, kde sa tam vzalo to minus. A z poslednej rady niekto zasepka: Otoc interval integracie.	t	2011-03-23 08:32:58	2011-03-23 08:32:58	Vyuzitie schopnosti	Sikovni podnikatelia	Pridal: sova; Autor: zabava.sme.sk	minarikmatus@gmail.com	\N	\N
362	Projektový manažér a dvaja programátori pracujú na dôležitom projekte.\r\nJedného dňa sa rozhodli počas obednej pauzy prejsť po pláži.\r\n\r\nNa polceste nájdu na pláži lampu, po jej pošúchaní sa objaví džin a hovorí "Obyčajne by som vám splnil tri želania, ale keďže ste traja, splním vám každému jedno."\r\n\r\nPrvý programátor hovorí: "Chcem stráviť zvyšok života na Havaji, s veľkým domom, kopou peňazí a húfom krásnych žien, ktoré ma budú zbožňovať."\r\nDžin jeho prianie splní a pošle ho na Havaj\r\n\r\nDruhý programátor vraví: "Chcem zvyšok života stráviť plavením sa na obrovskej jachte po stredomorí, s kopou peňazí a húfom krásnych žien, ktoré ma budú zbožňovať."\r\nDžin jeho želanie splní a pošle ho do stredomoria\r\n\r\nNakoniec ostal projektový manažér, džin sa ho pýta: "Čo si teda ty praješ?"\r\n"Chcem mať tých dvoch po obede späť." , odvetí manažér.\r\n	t	2011-03-23 08:56:45	2011-03-23 08:56:45	programátori, manažér a džin	Programátori na rozbehnutom projekte sa nedajú ľahko nahradiť\r\nTiež práca projektového manažéra môže mať drastické dôsledky na osobnosť :)	VM	mudr.evo@gmail.com	\N	\N
363	http://www.youtube.com/watch?v=UZq4sZz56qM	t	2011-03-23 12:19:03	2011-03-23 12:19:03	If programmers have make a plane - agilne metody	- agilny pristup je flexibilny, moderny...ale netreba to s nim vzdy prehanat, niekedy je klasicky, desatrociami osvedceny pristup sice jednoduchsi ale bezpecnejsi a vhodnejsi(like V-model)\r\n\r\n- niekedy je naozaj lepsie pred implementaciou overit spravnost algoritmu matematickym dokazom, ktory potvrdi, ze toto je naozaj spravny postup, su chyby, ktore sa netoleruju ani v testovacej faze nasadenia...to iste plati a projektovom menezmente(co z toho ze lietadlo je takmer hotove ak potrebuje pristat a stale nema podvozok)\r\n\r\n- vyber programovacieho jazyka moze ovplyvnit uspech "misie" aj ked sa moze na prvy pohlad zdat, ze je to jedno, napr.: ak neberieme ohlad na rychlost vykonavania kodu, tak stabilita a obtiaznost(C++) vs. jednoduchost, robustnost ale skryte chyby(aka C# and .NOT)\r\n\r\n- takto ma vyzerat pritazliva reklama o programovani\r\n\r\n- tak tyto ludia urcite niesu z fiit a mali Acka na matfyze\r\n\r\n- je diskutabilne, ci niesu na drogach \r\n	Tomas Kundis	tomo19@ynet.sk	\N	\N
364	http://a6.sphotos.ak.fbcdn.net/hphotos-ak-snc7/429962_10150663883103028_147643138027_9122517_1637752886_n.jpg	t	2012-03-21 15:32:24	2012-03-21 15:32:24	Nezacinaj projekt	Nezacinaj projekt pokial nemas dostupne vsetky materialy..	Matej Chlebana	matej.chlebana@gmail.com	\N	\N
365	http://www.youtube.com/watch?v=tqv-ZzXpeAs&feature=fvwrel	t	2012-04-16 04:07:58	2012-04-16 04:07:58	What is your programming language? [300]	Ozajstny programator, vie identifikovat kriticke miesta v kode, vie tieto casti prepisat do assemblera tak, aby program nestratil na svojej stabilite ale ziskal na efektivite a rychlosti.\r\n\r\n#2: Cim vyssi programovaci jazyk, tym vacia lama :)\r\n\r\n#3: Assembler is only for real mans :)\r\n\r\n#4: Ak nevies assembler, programuj v C[++]\r\n\r\n#5: V dnesnej dobe, skutocnych developerov, ktory si zasluzia titul (ozajstny) programator, je tiez iba 300	Tomas Kundis	tomkpp00@gmail.com	\N	\N
\.


--
-- Name: jokes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psina
--

SELECT pg_catalog.setval('jokes_id_seq', 365, true);


--
-- Data for Name: jokes_tags; Type: TABLE DATA; Schema: public; Owner: psina
--

COPY jokes_tags (id, joke_id, tag_id) FROM stdin;
543	303	494
544	303	495
545	303	496
546	303	497
547	303	498
548	304	499
549	304	500
550	305	496
551	305	501
552	305	502
553	306	503
554	306	504
555	306	505
556	306	506
557	307	507
558	307	508
559	307	509
560	307	510
561	307	511
562	307	512
563	308	513
564	308	514
565	309	515
566	309	516
567	309	517
568	309	518
569	309	519
570	309	520
571	310	521
572	310	522
573	310	523
574	310	524
575	311	525
576	311	526
577	312	527
578	314	528
579	314	529
580	315	530
581	315	531
582	316	532
583	316	533
584	316	534
585	317	535
586	317	536
587	317	537
588	318	538
589	319	539
590	319	540
591	319	541
592	320	542
593	320	543
594	321	544
595	321	545
596	321	546
597	321	547
598	322	548
599	322	549
600	322	550
601	323	551
602	323	552
603	323	553
604	324	554
605	324	555
606	324	556
607	325	557
608	325	558
609	325	559
610	326	560
611	327	510
612	327	561
613	328	510
614	329	562
615	329	563
616	329	564
617	329	565
618	330	566
619	330	567
620	330	568
621	331	569
622	331	570
623	332	571
624	332	572
625	333	573
626	333	574
627	334	575
628	334	576
629	335	577
630	336	525
631	337	578
632	338	579
633	338	510
634	339	580
635	339	581
636	339	582
637	339	583
638	340	584
639	340	585
640	340	586
641	340	587
642	342	588
643	343	589
644	343	590
645	343	591
646	343	592
647	343	496
648	343	593
649	344	575
650	344	594
651	344	595
652	344	596
653	345	597
654	345	598
655	345	599
656	345	600
657	345	601
658	346	602
659	346	603
660	346	604
661	347	510
662	347	605
663	347	606
664	348	607
665	348	608
666	348	609
667	349	610
668	349	611
669	350	612
670	350	613
671	351	614
672	352	510
673	352	615
674	353	616
675	353	617
676	353	618
677	354	510
678	354	619
679	355	620
680	355	621
681	355	622
682	356	623
683	358	624
684	358	625
685	358	626
686	358	627
687	359	575
688	359	628
689	359	629
690	360	630
691	360	631
692	360	511
693	360	632
694	361	633
695	361	634
696	361	635
697	361	636
698	362	510
699	362	615
700	363	637
701	363	638
702	363	639
703	363	640
704	363	496
705	363	641
706	363	642
707	363	643
708	363	644
709	363	645
710	363	646
711	363	647
712	363	648
713	363	649
714	364	629
715	365	650
\.


--
-- Name: jokes_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psina
--

SELECT pg_catalog.setval('jokes_tags_id_seq', 715, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: psina
--

COPY schema_migrations (version) FROM stdin;
20120927100302
20120830114615
20120823150810
20120823110057
20120910113600
20120910113342
20120823213154
20120823132437
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: psina
--

COPY tags (id, label, created_at, updated_at) FROM stdin;
494	specifikacia	2013-02-17 17:48:55.368475	2013-02-17 17:48:55.368475
495	zadanie	2013-02-17 17:48:55.374948	2013-02-17 17:48:55.374948
496	programator	2013-02-17 17:48:55.37766	2013-02-17 17:48:55.37766
497	zo zivota	2013-02-17 17:48:55.379694	2013-02-17 17:48:55.379694
498	zakaznik	2013-02-17 17:48:55.383085	2013-02-17 17:48:55.383085
499	anglictina	2013-02-17 17:48:55.399216	2013-02-17 17:48:55.399216
500	technici	2013-02-17 17:48:55.402949	2013-02-17 17:48:55.402949
501	level	2013-02-17 17:48:55.417055	2013-02-17 17:48:55.417055
502	peklo	2013-02-17 17:48:55.4209	2013-02-17 17:48:55.4209
503	softvér	2013-02-17 17:48:55.436861	2013-02-17 17:48:55.436861
504	dokumentácia	2013-02-17 17:48:55.440071	2013-02-17 17:48:55.440071
505	testovanie	2013-02-17 17:48:55.441603	2013-02-17 17:48:55.441603
506	inštalácia	2013-02-17 17:48:55.443379	2013-02-17 17:48:55.443379
507	reboot	2013-02-17 17:48:55.45559	2013-02-17 17:48:55.45559
508	technik	2013-02-17 17:48:55.457296	2013-02-17 17:48:55.457296
509	obchodník	2013-02-17 17:48:55.459076	2013-02-17 17:48:55.459076
510	programátor	2013-02-17 17:48:55.46151	2013-02-17 17:48:55.46151
511	auto	2013-02-17 17:48:55.464635	2013-02-17 17:48:55.464635
512	autoservis	2013-02-17 17:48:55.467629	2013-02-17 17:48:55.467629
513	karkulka	2013-02-17 17:48:55.479049	2013-02-17 17:48:55.479049
514	cervena ciapocka	2013-02-17 17:48:55.481187	2013-02-17 17:48:55.481187
515	admin	2013-02-17 17:48:55.490795	2013-02-17 17:48:55.490795
516	ľudomil	2013-02-17 17:48:55.494086	2013-02-17 17:48:55.494086
517	stolička	2013-02-17 17:48:55.497179	2013-02-17 17:48:55.497179
518	namotaný kábel	2013-02-17 17:48:55.499911	2013-02-17 17:48:55.499911
519	idiot	2013-02-17 17:48:55.50261	2013-02-17 17:48:55.50261
520	šaman	2013-02-17 17:48:55.505146	2013-02-17 17:48:55.505146
521	ostrostrelec	2013-02-17 17:48:55.516196	2013-02-17 17:48:55.516196
522	strelnica	2013-02-17 17:48:55.517732	2013-02-17 17:48:55.517732
523	terč	2013-02-17 17:48:55.519065	2013-02-17 17:48:55.519065
524	prst	2013-02-17 17:48:55.520609	2013-02-17 17:48:55.520609
525	OOP	2013-02-17 17:48:55.527376	2013-02-17 17:48:55.527376
526	dedenie	2013-02-17 17:48:55.53001	2013-02-17 17:48:55.53001
527	Procesory	2013-02-17 17:48:55.536453	2013-02-17 17:48:55.536453
528	Windows	2013-02-17 17:48:55.545937	2013-02-17 17:48:55.545937
529	aplikácie	2013-02-17 17:48:55.548057	2013-02-17 17:48:55.548057
530	Maska	2013-02-17 17:48:55.555449	2013-02-17 17:48:55.555449
531	siete	2013-02-17 17:48:55.558316	2013-02-17 17:48:55.558316
532	informatici	2013-02-17 17:48:55.568132	2013-02-17 17:48:55.568132
533	vtip	2013-02-17 17:48:55.569801	2013-02-17 17:48:55.569801
534	notebook	2013-02-17 17:48:55.571188	2013-02-17 17:48:55.571188
535	informatik	2013-02-17 17:48:55.578489	2013-02-17 17:48:55.578489
536	puzzle	2013-02-17 17:48:55.580946	2013-02-17 17:48:55.580946
537	darček	2013-02-17 17:48:55.582547	2013-02-17 17:48:55.582547
538	editor software UML	2013-02-17 17:48:55.589388	2013-02-17 17:48:55.589388
539	fajčenie	2013-02-17 17:48:55.598314	2013-02-17 17:48:55.598314
540	zdravie	2013-02-17 17:48:55.60099	2013-02-17 17:48:55.60099
541	warning error	2013-02-17 17:48:55.603661	2013-02-17 17:48:55.603661
542	vyvoj softvéru	2013-02-17 17:48:55.610372	2013-02-17 17:48:55.610372
543	fázy vývoja	2013-02-17 17:48:55.612203	2013-02-17 17:48:55.612203
544	project manager	2013-02-17 17:48:55.621043	2013-02-17 17:48:55.621043
545	opica	2013-02-17 17:48:55.623495	2013-02-17 17:48:55.623495
546	c++	2013-02-17 17:48:55.626012	2013-02-17 17:48:55.626012
547	San Francisco	2013-02-17 17:48:55.628302	2013-02-17 17:48:55.628302
548	fajront	2013-02-17 17:48:55.636635	2013-02-17 17:48:55.636635
549	žiarovka	2013-02-17 17:48:55.638594	2013-02-17 17:48:55.638594
550	voľno	2013-02-17 17:48:55.640538	2013-02-17 17:48:55.640538
551	warning	2013-02-17 17:48:55.651743	2013-02-17 17:48:55.651743
552	error	2013-02-17 17:48:55.655229	2013-02-17 17:48:55.655229
553	cigareta	2013-02-17 17:48:55.658498	2013-02-17 17:48:55.658498
554	rtfm	2013-02-17 17:48:55.67136	2013-02-17 17:48:55.67136
555	bože	2013-02-17 17:48:55.673204	2013-02-17 17:48:55.673204
556	nebeská brána	2013-02-17 17:48:55.67469	2013-02-17 17:48:55.67469
557	rýchlo	2013-02-17 17:48:55.684991	2013-02-17 17:48:55.684991
558	lacno	2013-02-17 17:48:55.686852	2013-02-17 17:48:55.686852
559	kvalitne	2013-02-17 17:48:55.6886	2013-02-17 17:48:55.6886
560	kompatibilita	2013-02-17 17:48:55.694726	2013-02-17 17:48:55.694726
561	typy žien	2013-02-17 17:48:55.702412	2013-02-17 17:48:55.702412
562	víkend	2013-02-17 17:48:55.72215	2013-02-17 17:48:55.72215
563	ráno	2013-02-17 17:48:55.725844	2013-02-17 17:48:55.725844
564	spánok	2013-02-17 17:48:55.728312	2013-02-17 17:48:55.728312
565	"i hate mondays"	2013-02-17 17:48:55.729671	2013-02-17 17:48:55.729671
566	e-mail	2013-02-17 17:48:55.771971	2013-02-17 17:48:55.771971
567	zamestnanie	2013-02-17 17:48:55.77479	2013-02-17 17:48:55.77479
568	kariera	2013-02-17 17:48:55.777206	2013-02-17 17:48:55.777206
569	operačný systém	2013-02-17 17:48:55.789502	2013-02-17 17:48:55.789502
570	vývoj	2013-02-17 17:48:55.792234	2013-02-17 17:48:55.792234
571	komunikacia	2013-02-17 17:48:55.800961	2013-02-17 17:48:55.800961
572	informatika	2013-02-17 17:48:55.803617	2013-02-17 17:48:55.803617
573	softvérové inžinierstvo	2013-02-17 17:48:55.814673	2013-02-17 17:48:55.814673
574	zhodnotenie kvality softvéru	2013-02-17 17:48:55.817008	2013-02-17 17:48:55.817008
575	programovanie	2013-02-17 17:48:55.824262	2013-02-17 17:48:55.824262
576	komerčný softvér	2013-02-17 17:48:55.826478	2013-02-17 17:48:55.826478
577	Iné	2013-02-17 17:48:55.835094	2013-02-17 17:48:55.835094
578	vyvoj softveru obrazok	2013-02-17 17:48:55.848591	2013-02-17 17:48:55.848591
579	verzia	2013-02-17 17:48:55.854141	2013-02-17 17:48:55.854141
580	programamator	2013-02-17 17:48:55.865866	2013-02-17 17:48:55.865866
581	zena	2013-02-17 17:48:55.8689	2013-02-17 17:48:55.8689
582	pokec	2013-02-17 17:48:55.871485	2013-02-17 17:48:55.871485
583	C++	2013-02-17 17:48:55.873676	2013-02-17 17:48:55.873676
584	odhad	2013-02-17 17:48:55.882877	2013-02-17 17:48:55.882877
585	cena	2013-02-17 17:48:55.885646	2013-02-17 17:48:55.885646
586	navrh	2013-02-17 17:48:55.887983	2013-02-17 17:48:55.887983
587	plan	2013-02-17 17:48:55.890367	2013-02-17 17:48:55.890367
588	splnenie poziadaviek	2013-02-17 17:48:55.900621	2013-02-17 17:48:55.900621
589	cyklus	2013-02-17 17:48:55.913401	2013-02-17 17:48:55.913401
590	vyvoja	2013-02-17 17:48:55.914972	2013-02-17 17:48:55.914972
591	softveru	2013-02-17 17:48:55.916525	2013-02-17 17:48:55.916525
592	software	2013-02-17 17:48:55.918444	2013-02-17 17:48:55.918444
593	bug	2013-02-17 17:48:55.922129	2013-02-17 17:48:55.922129
594	boh	2013-02-17 17:48:55.931692	2013-02-17 17:48:55.931692
595	chaos	2013-02-17 17:48:55.933675	2013-02-17 17:48:55.933675
596	stvorenie sveta	2013-02-17 17:48:55.935127	2013-02-17 17:48:55.935127
597	Ani v hokeji nestačí mať dobrú stratégiu	2013-02-17 17:48:55.942923	2013-02-17 17:48:55.942923
598	kvalitnú výstroj	2013-02-17 17:48:55.945145	2013-02-17 17:48:55.945145
599	profesionálne podmienky	2013-02-17 17:48:55.947211	2013-02-17 17:48:55.947211
600	skúseného trénera. Všetko je o ľuďoch	2013-02-17 17:48:55.949686	2013-02-17 17:48:55.949686
601	psychike a psychológii...	2013-02-17 17:48:55.952914	2013-02-17 17:48:55.952914
602	učiteľka	2013-02-17 17:48:55.965948	2013-02-17 17:48:55.965948
603	Norton	2013-02-17 17:48:55.967773	2013-02-17 17:48:55.967773
604	manuál	2013-02-17 17:48:55.970395	2013-02-17 17:48:55.970395
605	vajcia	2013-02-17 17:48:55.978289	2013-02-17 17:48:55.978289
606	podmienka	2013-02-17 17:48:55.979942	2013-02-17 17:48:55.979942
607	konzultant	2013-02-17 17:48:55.987643	2013-02-17 17:48:55.987643
608	diplomova praca	2013-02-17 17:48:55.989673	2013-02-17 17:48:55.989673
609	tema	2013-02-17 17:48:55.991209	2013-02-17 17:48:55.991209
610	užívateľ a PC	2013-02-17 17:48:55.997475	2013-02-17 17:48:55.997475
611	administrator	2013-02-17 17:48:55.999106	2013-02-17 17:48:55.999106
612	vývoj softvéru	2013-02-17 17:48:56.005988	2013-02-17 17:48:56.005988
613	hlášky užívateľov	2013-02-17 17:48:56.007928	2013-02-17 17:48:56.007928
614	matfyzáci	2013-02-17 17:48:56.01447	2013-02-17 17:48:56.01447
615	projektový manažér	2013-02-17 17:48:56.023506	2013-02-17 17:48:56.023506
616	web	2013-02-17 17:48:56.031722	2013-02-17 17:48:56.031722
617	peniaze	2013-02-17 17:48:56.03399	2013-02-17 17:48:56.03399
618	zbytocnost	2013-02-17 17:48:56.035956	2013-02-17 17:48:56.035956
619	záujmy	2013-02-17 17:48:56.042857	2013-02-17 17:48:56.042857
620	matfyz	2013-02-17 17:48:56.051301	2013-02-17 17:48:56.051301
621	chrakteristika	2013-02-17 17:48:56.053339	2013-02-17 17:48:56.053339
622	fiitkári	2013-02-17 17:48:56.055086	2013-02-17 17:48:56.055086
623	C C++	2013-02-17 17:48:56.06222	2013-02-17 17:48:56.06222
624	packety	2013-02-17 17:48:56.075676	2013-02-17 17:48:56.075676
625	bar vtipy	2013-02-17 17:48:56.077817	2013-02-17 17:48:56.077817
626	sietarina	2013-02-17 17:48:56.080271	2013-02-17 17:48:56.080271
627	anglicky	2013-02-17 17:48:56.082992	2013-02-17 17:48:56.082992
628	jazyky	2013-02-17 17:48:56.093015	2013-02-17 17:48:56.093015
629	projekt	2013-02-17 17:48:56.094471	2013-02-17 17:48:56.094471
630	STU	2013-02-17 17:48:56.101436	2013-02-17 17:48:56.101436
631	fakulty	2013-02-17 17:48:56.103245	2013-02-17 17:48:56.103245
632	vylet	2013-02-17 17:48:56.105626	2013-02-17 17:48:56.105626
633	docent	2013-02-17 17:48:56.113675	2013-02-17 17:48:56.113675
634	robotnik	2013-02-17 17:48:56.11544	2013-02-17 17:48:56.11544
635	plat	2013-02-17 17:48:56.117073	2013-02-17 17:48:56.117073
636	integral	2013-02-17 17:48:56.118754	2013-02-17 17:48:56.118754
637	video	2013-02-17 17:48:56.146028	2013-02-17 17:48:56.146028
638	lietadlo	2013-02-17 17:48:56.147857	2013-02-17 17:48:56.147857
639	agilne	2013-02-17 17:48:56.150096	2013-02-17 17:48:56.150096
640	metody	2013-02-17 17:48:56.153096	2013-02-17 17:48:56.153096
641	haluz	2013-02-17 17:48:56.157678	2013-02-17 17:48:56.157678
642	agile	2013-02-17 17:48:56.161494	2013-02-17 17:48:56.161494
643	air	2013-02-17 17:48:56.165324	2013-02-17 17:48:56.165324
644	airoplane	2013-02-17 17:48:56.168517	2013-02-17 17:48:56.168517
645	plane	2013-02-17 17:48:56.171619	2013-02-17 17:48:56.171619
646	programmer	2013-02-17 17:48:56.174531	2013-02-17 17:48:56.174531
647	java	2013-02-17 17:48:56.177711	2013-02-17 17:48:56.177711
648	net	2013-02-17 17:48:56.181622	2013-02-17 17:48:56.181622
649	not	2013-02-17 17:48:56.185452	2013-02-17 17:48:56.185452
650	300 real man programmers assebmler own your big ti	2013-02-17 17:48:56.206111	2013-02-17 17:48:56.206111
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: psina
--

SELECT pg_catalog.setval('tags_id_seq', 650, true);


--
-- Name: jokes_pkey; Type: CONSTRAINT; Schema: public; Owner: psina; Tablespace: 
--

ALTER TABLE ONLY jokes
    ADD CONSTRAINT jokes_pkey PRIMARY KEY (id);


--
-- Name: jokes_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: psina; Tablespace: 
--

ALTER TABLE ONLY jokes_tags
    ADD CONSTRAINT jokes_tags_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: psina; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: index_jokes_on_published; Type: INDEX; Schema: public; Owner: psina; Tablespace: 
--

CREATE INDEX index_jokes_on_published ON jokes USING btree (published);


--
-- Name: index_jokes_tags_on_joke_id_and_tag_id; Type: INDEX; Schema: public; Owner: psina; Tablespace: 
--

CREATE INDEX index_jokes_tags_on_joke_id_and_tag_id ON jokes_tags USING btree (joke_id, tag_id);


--
-- Name: index_tags_on_label; Type: INDEX; Schema: public; Owner: psina; Tablespace: 
--

CREATE UNIQUE INDEX index_tags_on_label ON tags USING btree (label);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: psina; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: jokes_tags_joke_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: psina
--

ALTER TABLE ONLY jokes_tags
    ADD CONSTRAINT jokes_tags_joke_id_fk FOREIGN KEY (joke_id) REFERENCES jokes(id);


--
-- Name: jokes_tags_tag_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: psina
--

ALTER TABLE ONLY jokes_tags
    ADD CONSTRAINT jokes_tags_tag_id_fk FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

