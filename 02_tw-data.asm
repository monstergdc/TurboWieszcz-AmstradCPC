
;TURBO WIESZCZ++ 2.0
;FOR CPC
;(C)2015, 2017 NONIEWICZ.COM
;CRE: 2015.09.24 (ZX)
;CRE: 2017.12.25, 26 (CPC)

;DATA

;note: this one is for 80 col mode:
ABO_TX	db	"Turbo Wieszcz ++ v2.0 - "
	db	"GENERATOR WIERSZY, WERSJA NA: AMSTRAD CPC", 13, 10, 13, 10

	db	"(C)2017 MONSTER/GDC, "
	db	"WWW.NONIEWICZ.COM / WWW.NONIEWICZ.ART.PL, ", 13, 10
	db	"STROFY (C) GRYCH, FREEAK, FRED, MONSTER, MAREK PAMPUCH", 13, 10, 13, 10

	db	"POWSTAL: 2017.12.25-26, W OK. 12H, "
	db	"UNIKALNYCH ZWROTEK: 32^4 = 1048576", 13, 10
	db	"MOJA *1ST EVER* PRODUKCJA NA AMSTRADA!", 13, 10, 13, 10

	db	"OPARTY NA WERSJI NA ZX SPECTRUM (2015), OPARTEJ Z KOLEI NA MOICH WERSJACH:", 13, 10
	db	"- NA COMMODORE C-64 (1993)", 13, 10
	db	"- NA ANDROIDA (2011+)", 13, 10
	db	"OPARTYCH NA POMYSLE Z 'MAGAZYNU AMIGA' AUTORSTWA MARKA PAMPUCHA", 13, 10
	db	"I WERSJACH GRYCHA NA AMIGE I IPHONE", 13, 10, 13, 10
	db	"HISTORIA TURBO WIESZCZA SPISANA W MAGAZYNIE 'HA!ART' 47 3/2014", 13, 10, 13, 10

	db	"CREDITS: ", 13, 10
	db	"CODE, GFX: MONSTER/GDC, MUSIC: VOYAGER, IDEA: MAREK PAMPUCH, "
	db	"TXT: GRYCH, FREEAK, FRED, MONSTER, PAMPUCH", 13, 10, 13, 10

	db	"GREETINGS: ", 13, 10
	db	"TYGRYS, GRYCH, FREEAK, FRED, ROYAL, V0YAGER, MAREK PAMPUCH"
	db	", KATKA, KYA, SMASH,  ANTHON, HAK, YOGA, DUDI, YUBAL, CROMAX, MAXYM"
	db	", ROMEAOAD, PIOTR MARECKI, BEETH,  XTD, JOLKA, DA_NONE"
	db	0

DIZ	db	13, 10, 13, 10, 13, 10
	db	"DIZKLAJMER", 13, 10
	db	#d8, #d8, #d8, #d8, #d8, #d8, #d8, #d8, #d8, #d8, #d8, 13, 10, 13, 10
	db	"NIE DLA OSOB", 13, 10, 13, 10, "SLABEGO DUCHA!", 13, 10
	db	13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10, 13, 10
	db	"H = HELP"

	db	0

OPTS	db	"Opcje:", 13, 10, 13, 10
	db	"SPACJA - generuj nowy wiersz", 13, 10
	db	"A - informacje o programie", 13, 10
	db	"S - ekran startowy", 13, 10
	db	"R - zmiana trybu rymow:", 13, 10
	db	"    ABAB, ABBA, AABB", 13, 10
	db	"H - ten ekran pomocy", 13, 10
	db	"Z - tryb z/bez powtorzen", 13, 10
	db	"M - tryb automatyczny, co ok. 10s", 13, 10, 13, 10
	db	"Opcje R, Z, M zadzialaja tylko", 13, 10
	db	"miedzy kolejnymi wierszami"
	db	0

CDATA	dw	NUMER+0,N,N
	dw	NUMER+2,N,N
	dw	NUMER+4,N,N
	dw	NUMER+6,N,N
	dw	NUMER+0,NUMER+8,N
	dw	NUMER+2,NUMER+10,N
	dw	NUMER+4,NUMER+12,N
	dw	NUMER+6,NUMER+14,N
	dw	NUMER+0,NUMER+8,NUMER+16
	dw	NUMER+2,NUMER+10,NUMER+18
	dw	NUMER+4,NUMER+12,NUMER+20
	dw	NUMER+6,NUMER+14,NUMER+22

TTLS	dw	TT1, TT2, TT3, TT4, TT5, TT6, TT7, TT8, TT9
	dw	TT10, TT11, TT12, TT13, TT14, TT15, TT16, TT17, TT18
	dw	TT19, TT20, TT21, TT22, TT23, TT24, TT25, TT26, TT27
	dw	TT28, TT29, TT30, TT31, TT32

D0_A	dw	D0_0,D0_1
	dw	D0_2,D0_3
	dw	D0_4,D0_5
	dw	D0_6,D0_7
	dw	D0_8,D0_9
	dw	D0_10,D0_11
	dw	D0_12,D0_13
	dw	D0_14,D0_15
	dw	D0_16,D0_17
	dw	D0_18,D0_19
	dw	D0_20,D0_21
	dw	D0_22
	dw	D0_23,D0_24
	dw	D0_25,D0_26
	dw	D0_27,D0_28
	dw	D0_29,D0_30
	dw	D0_31
D1_A	dw	D1_0,D1_1
	dw	D1_2,D1_3
	dw	D1_4,D1_5
	dw	D1_6,D1_7
	dw	D1_8,D1_9
	dw	D1_10,D1_11
	dw	D1_12,D1_13
	dw	D1_14,D1_15
	dw	D1_16,D1_17
	dw	D1_18,D1_19
	dw	D1_20,D1_21
	dw	D1_22
	dw	D1_23,D1_24
	dw	D1_25,D1_26
	dw	D1_27,D1_28
	dw	D1_29,D1_30
	dw	D1_31
D2_A	dw	D2_0,D2_1
	dw	D2_2,D2_3
	dw	D2_4,D2_5
	dw	D2_6,D2_7
	dw	D2_8,D2_9
	dw	D2_10,D2_11
	dw	D2_12,D2_13
	dw	D2_14,D2_15
	dw	D2_16,D2_17
	dw	D2_18,D2_19
	dw	D2_20,D2_21
	dw	D2_22
	dw	D2_23,D2_24
	dw	D2_25,D2_26
	dw	D2_27,D2_28
	dw	D2_29,D2_30
	dw	D2_31
D3_A	dw	D3_0,D3_1
	dw	D3_2,D3_3
	dw	D3_4,D3_5
	dw	D3_6,D3_7
	dw	D3_8,D3_9
	dw	D3_10,D3_11
	dw	D3_12,D3_13
	dw	D3_14,D3_15
	dw	D3_16,D3_17
	dw	D3_18,D3_19
	dw	D3_20,D3_21
	dw	D3_22
	dw	D3_23,D3_24
	dw	D3_25,D3_26
	dw	D3_27,D3_28
	dw	D3_29,D3_30
	dw	D3_31

TT1	db	"Zaglada"
	db	0
TT2	db	"To juz koniec"
	db	0
TT3	db	"Swiat ginie"
	db	0
TT4	db	"Z wizyta w piekle"
	db	0
TT5	db	"Kataklizm"
	db	0
TT6	db	"Dzien z zycia..."
	db	0
TT7	db	"Masakra"
	db	0
TT8	db	"Katastrofa"
	db	0
TT9	db	"Wszyscy zginiemy..."
	db	0
TT10	db	"Spokoj"
	db	0
TT11	db	"Koniec"
	db	0
TT12	db	"Koniec ludzkosci"
	db	0
TT13	db	"Telefon do Boga"
	db	0
TT14	db	"Wieczne ciemnosci"
	db	0
TT15	db	"Mrok"
	db	0
TT16	db	"Mrok w srodku dnia"
	db	0
TT17	db	"Ciemnosc"
	db	0
TT18	db	"Piorunem w leb"
	db	0
TT19	db	"Marsz troli"
	db	0
TT20	db	"Szyderstwa Zlego"
	db	0
TT21	db	"Okropnosci swiata"
	db	0
TT22	db	"Umrzec po raz ostatni"
	db	0
TT23	db	"Potepienie"
	db	0
TT24	db	"Bol mogzu"
	db	0
TT25	db	"Wieczne wymioty"
	db	0
TT26	db	"Zatrute dusze"
	db	0
TT27	db	"Uciekaj"
	db	0
TT28	db	"Apokalipsa"
	db	0
TT29	db	"Zludzenie pryska"
	db	0
TT30	db	"Makabra"
	db	0
TT31	db	"Zaglada swiata"
	db	0
TT32	db	"Smierc"
	db	0

D0_0	db	"A na te zbrodnie nie bedzie kary"
	db	0
D0_1	db	"Opustoszaly bagna, moczary"
	db	0
D0_2	db	"Na nic sie modly zdadza ni czary"
	db	0
D0_3	db	"Z krwi mordowanych sacza puchary"
	db	0
D0_4	db	"To nietoperze, weze, kalmary"
	db	0
D0_5	db	"Prozno nieszczesni sypia talary"
	db	0
D0_6	db	"Za co nam znosic takie ciezary"
	db	0
D0_7	db	"Zlowrogo iskrza kobr okulary"
	db	0
D0_8	db	"Prozno swe modly wznosi wikary"
	db	0
D0_9	db	"Pustosza sny twoje te nocne mary"
	db	0
D0_10	db	"Prozno nieszczesnik sypie talary"
	db	0
D0_11	db	"Przedziwnie tkany zycia logarytm"
	db	0
D0_12	db	"Juz Strach wypuszcza swoje ogary"
	db	0
D0_13	db	"I oto giniesz w paszczy poczwary"
	db	0
D0_14	db	"Wbijaja pale zlote kafary"
	db	0
D0_15	db	"Zycie odkrywa swoje przywary"
	db	0
D0_16	db	"Na dnie ponurej, pustej pieczary"
	db	0
D0_17	db	"Apokalipsy nadeszly czary"
	db	0
D0_18	db	"Upadly aniol wspomina chwale"
	db	0
D0_19	db	"Zycie ukrywa swoje przywary"
	db	0
D0_20	db	"Dziwnych owadow wzlatuja chmary"
	db	0
D0_21	db	"Bombowce biora nasze namiary"
	db	0
D0_22	db	"Nie da sie wyrwac czartom towaru"
	db	0
D0_23	db	"Prozno frajerzy sypia talary"
	db	0
D0_24	db	"Po co nam saczyc podle browary"
	db	0
D0_25	db	"Diler juz nie dostarczy towaru"
	db	0
D0_26	db	"Smutno patrzysz na puste bazary"
	db	0
D0_27	db	"Lokomotywa nie ma juz pary"
	db	0
D0_28	db	"Gdy nie kazdego stac na browary"
	db	0
D0_29	db	"Pozarl Hilary swe okulary"
	db	0
D0_30	db	"Spowily nas trujace opary"
	db	0
D0_31	db	"To nie jest calka ani logarytm"
	db	0

D1_0	db	"Juz na arene krew tryska"
	db	0
D1_1	db	"Juz piana cieknie im z pyska"
	db	0
D1_2	db	"Juz hen w oddali gdzies blyska"
	db	0
D1_3	db	"Smierc w kacie czai sie bliska"
	db	0
D1_4	db	"Niesamowite duchow igrzyska"
	db	0
D1_5	db	"Juz zaciskajac lapiska"
	db	0
D1_6	db	"Zamiast pozostac w zamczyskach"
	db	0
D1_7	db	"Rzeka wylewa z lozyska"
	db	0
D1_8	db	"Nieszczesc wylala sie miska"
	db	0
D1_9	db	"Juz zaciskajac zebiska"
	db	0
D1_10	db	"Otwarta nieszczesc walizka"
	db	0
D1_11	db	"Niczym na rzymskich boiskach"
	db	0
D1_12	db	"Czart wznieca swe paleniska"
	db	0
D1_13	db	"A w mroku swieca zebiska"
	db	0
D1_14	db	"Zewszad dochodza wyzwiska"
	db	0
D1_15	db	"Swietych glod wiary przyciska"
	db	0
D1_16	db	"Ponuro patrzy z ich pyska"
	db	0
D1_17	db	"Mgla stoi na uroczyskach"
	db	0
D1_18	db	"Kosci pogrzebia uwriska"
	db	0
D1_19	db	"Glod wiary tak nas przyciska"
	db	0
D1_20	db	"Runely skalne zwaliska"
	db	0
D1_21	db	"Czart rozpala paleniska"
	db	0
D1_22	db	"Juz w mroku swieca zebiska"
	db	0
D1_23	db	"Znow pusta zebraka miska"
	db	0
D1_24	db	"Diabelskie to sa igrzyska"
	db	0
D1_25	db	"Nie powiedz diablu nazwiska"
	db	0
D1_26	db	"Najglosniej slychac wyzwiska"
	db	0
D1_27	db	"Diabelskie maja nazwiska"
	db	0
D1_28	db	"Tam uciekaja ludziska"
	db	0
D1_29	db	"Tak rzecze stara hipiska"
	db	0
D1_30	db	"Gdzie dawne ludzi siedliska"
	db	0
D1_31	db	"Najglosniej piszczy hipiska"
	db	0

D2_0	db	"Rwa pazurami swoje ofiary"
	db	0
D2_1	db	"Nic nie pomoze tu druid stary"
	db	0
D2_2	db	"To nocne zjawy i senne mary"
	db	0
D2_3	db	"Niegrozne przy nich nawet Atari"
	db	0
D2_4	db	"Pod wodza ksieznej diablic Azary"
	db	0
D2_5	db	"Z dala straszliwe trabia fanfary"
	db	0
D2_6	db	"Takie sa oto piekla bezmiary"
	db	0
D2_7	db	"Zas dookola luny, pozary"
	db	0
D2_8	db	"A teraz nagle jestes juz stary"
	db	0
D2_9	db	"Tu nie pomoze juz sila wiary"
	db	0
D2_10	db	"Cudze nieszczescie moje nektary"
	db	0
D2_11	db	"Wszystko zalewa wrzacy liparyt"
	db	0
D2_12	db	"Zabojcze sa ich niecne zamiary"
	db	0
D2_13	db	"Zatrute dusze lacza sie w pary"
	db	0
D2_14	db	"Swiat pokazuje swoje wymiary"
	db	0
D2_15	db	"Tu nie pomoze elektryk stary"
	db	0
D2_16	db	"Brak uczuc, checi a takze wiary"
	db	0
D2_17	db	"Pomnij, a mowil Mickiewicz stary"
	db	0
D2_18	db	"Spalonych lasow strasza hektary"
	db	0
D2_19	db	"Mordercy licza swoje ofiary"
	db	0
D2_20	db	"Ksiadz pozostaje nagle bez wiary"
	db	0
D2_21	db	"Papiez zaczyna odprawiac czary"
	db	0
D2_22	db	"Tu nie pomoze paciorek, stary"
	db	0
D2_23	db	"Upada oto dab ten prastary"
	db	0
D2_24	db	"I uderzaja z sila Niagary"
	db	0
D2_25	db	"Bystro smigaja nawet niezdary"
	db	0
D2_26	db	"Juz nieruchome ich awatary"
	db	0
D2_27	db	"I bez wartosci sa juz dolary"
	db	0
D2_28	db	"Gdzie sie podzialy te nenufary"
	db	0
D2_29	db	"Tak nas zabija grozne pulsary"
	db	0
D2_30	db	"Powodz zalewa wielkie obszary"
	db	0
D2_31	db	"Az rozpadaja sie i filary"
	db	0

D3_0	db	"Wnet na nas tez przyjdzie kryska"
	db	0
D3_1	db	"Znikad zadnego schroniska"
	db	0
D3_2	db	"Powietrze tnie swist biczyska"
	db	0
D3_3	db	"Rodem z czarciego urwiska"
	db	0
D3_4	db	"I swad nieznosny sie wciska"
	db	0
D3_5	db	"Huk, jak z wielkiego lotniska"
	db	0
D3_6	db	"Zlowrogo brzmia ich nazwiska"
	db	0
D3_7	db	"W kacie niesmialo ktos piska"
	db	0
D3_8	db	"Ktos obok morduje liska"
	db	0
D3_9	db	"Krwia ociekaja zebiska"
	db	0
D3_10	db	"Wokolo dzikie piarzyska"
	db	0
D3_11	db	"I zadza czai sie niska"
	db	0
D3_12	db	"Diabel cie dzisiaj wyzyska"
	db	0
D3_13	db	"Plona zaglady ogniska"
	db	0
D3_14	db	"Gwalt niech sie gwaltem odciska"
	db	0
D3_15	db	"Stoisz na skraju urwiska"
	db	0
D3_16	db	"Tam szatan czarta wyiska"
	db	0
D3_17	db	"Uciekaj, przyszlosc jest mglista"
	db	0
D3_18	db	"Nadziei zludzenie pryska"
	db	0
D3_19	db	"Wydziobia oczy ptaszyska"
	db	0
D3_20	db	"Padaja lby na klepisko"
	db	0
D3_21	db	"Smierc zbiera zniwo w kolyskach"
	db	0
D3_22	db	"Cos znowu zgrzyta w lozyskach"
	db	0
D3_23	db	"Spadasz z wielkiego urwiska"
	db	0
D3_24	db	"Lawa spod ziemi wytryska"
	db	0
D3_25	db	"Wokolo grzmi albo blyska"
	db	0
D3_26	db	"Falszywe zloto polyska"
	db	0
D3_27	db	"Najwiecej czart tu uzyska"
	db	0
D3_28	db	"Owieczki Zly tu pozyska"
	db	0
D3_29	db	"Owieczki spadly z urwiska"
	db	0
D3_30	db	"Snuja sie dymy z ogniska"
	db	0
D3_31	db	"To czarne leca ptaszyska"
	db	0
