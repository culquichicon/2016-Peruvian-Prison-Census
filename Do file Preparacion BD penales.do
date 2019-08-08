*****************
* Cuestionario 0*
*****************
use "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\cap000.dta", clear
keep ID_CARATUL INTERNO_ID CUEST_NRO DD EST_PENI_A EST_PENIT GENERO E_CIVIL RELIGION /// 
		RELIGION_E TSALUD_1 TSALUD_2 TSALUD_3 TSALUD_4 TSALUD_5 TSALUD_6 ///
		TSALUD_7 TSALUD_8 TSALUD_7ES EDAD NACIONALID PAIS_NAC NAC_DD  ///
		SITUACION_JURIDICA

rename DD depart_penal

rename EST_PENI_A penal_cod
lab def EST_PENI_A 216 "E.P. de Lurigancho" 106 "E.P. de Trujillo" 217 "E.P. Miguel Castro Castro" 205 "E.P. de Ica" ///
203 "E.P. del Callao" 207 "E.P. de Huaral" 108 "E.P. de Chiclayo" 109 "E.P. Piura" 501 "E.P. de Huanuco" ///
401 "E.P. de Ayacucho" 202 "E.P. de Chimbote" 209 "E.P. de Ancon" 604 "E.P. de Cusco" 503 "E.P. de Pucallpa" ///
206 "E.P. de Canhete" 405 "E.P. de Huancayo" 301 "E.P. de Arequipa" 208 "E.P. de Huacho" 210 "E.P. Modelo Ancon II - S.M.V.C." ///
101 "E.P. de Cajamarca" 204 "E.P. de Chincha" 803 "E.P. Juliaca" 704 "E.P. de Iquitos" 201 "E.P. de Huaraz" 111 "E.P. de Tumbes" ///
304 "E.P. de Tacna" 213 "E.P. Mujeres de Chorrillos" 607 "E.P. de Pto. Maldonado" 706 "E.P. de Juanjui" 701 "E.P. de Chachapoyas" ///
707 "E.P. de Moyobamba" 802 "E.P. de Puno" 404 "E.P. de Chanchamayo" 708 "E.P. de Sananguillo" 709 "E.P. de Tarapoto" ///
103 "E.P. de Jaen" 602 "E.P. de Andahuaylas" 606 "E.P. Quillabamba" 214 "E.P. Virgen de Fatima" 212 "E.P. Anexo de Mujeres Chorrillos" ///
107 "E.P. Mujeres de Trujillo" 303 "E.P. Camana" 601 "E.P. de Abancay" 702 "E.P. de Bagua Grande" 403 "E.P. de Huancavelica" ///
502 "E.P. de Cerro Pasco" 408 "E.P. de Satipo" 306 "E.P. de Challapalca" 703 "E.P. de Yurimaguas" 302 "E.P. Mujeres de Arequipa" ///
605 "E.P. Mujeres del cusco"  801 "E.P. de Lampa" 102 "E.P. de Chota" 410 "E.P. de la Oroya" 305 "E.P. Mujeres de Tacna" ///
407 "E.P. de Jauja" 402 "E.P. de Huanta" 110 "E.P. de Sullana" 409 "E.P. de Tarma" 104 "E.P. de San Ignacio" 705 "E.P. Mujeres de Iquitos" ///
406 "E.P. Mujeres de Concepcion" 215 "E.P. Virgen de la Merced" 105 "E.P. de Pacasmayo" 218 "E.P. Base Naval Callao" 211 "E.P. de Barbadillo"
lab val penal_cod EST_PENI_A

gen penal_anonym = penal_cod
recode penal_anonym (503=1) (607=2) (701=3) (702=4) (703=5) (704=6) (705=7) (706=8) (707=9) (708=10) (709=11) (203=12) (209=13) (210=14) ///
(211=15) (212=16) (213=17) (214=18) (215=19) (216=20) (217=21) (218=22) (201=23) (202=24) (204=25) (205=26) (206=27) (207=28) (208=29) ///
(401=30) (402=31) (403=32) (404=33) (405=34) (406=35) (407=36) (408=37) (409=38) (410=39) (501=40) (502=41) (101=42) (102=43) (103=44) ///
(104=45) (105=46) (106=47) (107=48) (108=49) (109=50) (110=51) (111=52) (301=53) (302=54) (303=55) (304=56) (305=57) (306=58) (601=59) ///
(602=60) (604=61) (605=62) (606=63) (801=64) (802=65) (803=66)


lab def penal_anonymus 1 "Amazon 1" 2 "Amazon 2" 3 "Amazon 3" 4 "Amazon 4" 5 "Amazon 5" 6 "Amazon 6" 7 "Amazon 7" 8 "Amazon 8" 9 "Amazon 9" ///
10 "Amazon 10" 11 "Amazon 11" 12 "Capital 1" 13 "Capital 2" 14 "Capital 3" 15 "Capital 4" 16 "Capital 5" 17 "Capital 6" 18 "Capital 7" 19 "Capital 8" ///
20 "Capital 9" 21 "Capital 10" 22 "Capital 11" 23 "Central coast 1" 24 "Central coast 2" 25 "Central coast 3" 26 "Central coast 4" 27 "Central coast 5" ///
28 "Central coast 6" 29 "Central coast 7" 30 "Central Andean areas 1" 31 "Central Andean areas 2" 32 "Central Andean areas 3" 33 "Central Andean areas 4" ///
34 "Central Andean areas 5" 35 "Central Andean areas 6" 36 "Central Andean areas 7" 37 "Central Andean areas 8" 38 "Central Andean areas 9" ///
39 "Central Andean areas 10" 40 "Central Andean areas 11" 41 "Central Andean areas 12" 42 "North coast 1" 43 "North coast 2" 44 "North coast 3" ///
45 "North coast 4" 46 "North coast 5" 47 "North coast 6" 48 "North coast 7" 49 "North coast 8" 50 "North coast 9" 51 "North coast 10" 52 "North coast 11" ///
53 "South coast 1" 54 "South coast 2" 55 "South coast 3" 56 "South coast 4" 57 "South coast 5" 58 "South coast 6" 59 "South Andean areas 1" 60 "South Andean areas 2" ///
61 "South Andean areas 3" 62 "South Andean areas 4" 63 "South Andean areas 5" 64 "South Andean areas 6" 65 "South Andean areas 7" 66 "South Andean areas 8"
lab val penal_anonym penal_anonymus


rename EST_PENIT penal

gen penal_hacin = penal_anonym
recode penal_hacin (2/4 = 1) (6 = 1) (11 = 1) (12 = 1) (17 = 1) (20 = 1) (21 = 1) (23 = 1) (24 = 1) (26/34 = 1) (36/43 = 1) ///
(47/57 = 1) (59/66 = 1) (5 = 0) (7/10 = 0) (13/16 = 0)(18 = 0) (19 = 0) (22 = 0) (25 = 0) (35 = 0) (44/46 = 0) (58 = 0)
lab var penal_hacin "Hacinamiento de penal"
lab def penal_hacin_x 1 "Si" 0 "No"
lab val penal_hacin penal_hacin_x


rename GENERO sex
lab def GENERO 1 "Masculino" 2 "Femenino"
lab val sex GENERO

rename E_CIVIL civil
gen civilcat=.
replace civilcat = 1 if civil == 3 | civil == 4 | civil == 5 | civil == 6
replace civilcat = 2 if civil == 1 | civil== 2
lab var civilcat "Civil categorizada"
lab def civil 1 "Without stable partner" 2 "With stable partner"
lab val civilcat civil

rename RELIGION relig
rename RELIGION_E relig_o
rename TSALUD_1 essalud
rename TSALUD_2 privado
rename TSALUD_3 eps
rename TSALUD_4	ffaa
rename TSALUD_5 sis
rename TSALUD_6 univ
rename TSALUD_7 otroseguro
rename TSALUD_8 noseguro
rename TSALUD_7ES otroseguro_espec
rename EDAD edad
gen edadcat = .
replace edadcat = 1 if edad <36
replace edadcat = 2 if edad >= 36 & edad <= 55
replace edadcat = 3 if edad > 55 
lab var edadcat "Edad categorizada"
lab def edad 1 "18-35 anhos" 2 "36-55 anhos" 3 ">55 anhos"
lab val edadcat edad

rename NACIONALID nacion
rename NAC_DD depart_nac
gen depart_nac_cat=" "
replace depart_nac_cat = "Lima" if depart_nac == "LIMA" 
replace depart_nac_cat = "others" if depart_nac != "LIMA"
lab var depart_nac "Departamento de nacimiento"
encode depart_nac_cat, gen (depart_nac_cat_byte)

rename SITUACION_JURIDICA juridico

egen seguro1 = rowtotal(essalud privado eps ffaa sis univ otroseguro)
gen seguro2 = seguro1
recode seguro2 (2 3 = 1)
lab var seguro2 "Al menos un tipo de seguro"
lab def seg 1 "Si" 0 "No"
lab val seguro2 seg

rename PAIS_NAC pais_nac
gen pais_nac2 =" "
replace pais_nac2 = "Peru" if pais_nac == "PERU" 
replace pais_nac2 = "Foreign" if pais_nac != "PERU"
lab var pais_nac2 "Birth country"
encode pais_nac2, gen (pais_nac2_byte)


save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd0_merge.dta", replace

*****************
* Cuestionario 1*
*****************
use "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\cap100.dta", replace
keep ID_CARATUL INTERNO_ID CUEST_NRO P104_1 P107_1 P107A_1 ///
	P107B_1 P107C_1 P107_2 P107A_2 P107B_2 /// 
	P107C_2 P107_3 P107A_3 P107B_3 P107C_3 ///
	P107_4 P107A_4 P107B_4 P107C_4 P107D_4 P107D_4ESP P107_5 P107A_5 ///
	P107B_5 P107C_5 P107D_5 P107D_5ESP ///
	P107_6 P107A_6 P107B_6 P107C_6 P107D_6 P107D_6ESP P107_7 P107A_7 ///
	P107B_7 P107C_7 P107D_7 P107D_7ESP P107_8 P107A_8 P107B_8 P107C_8 P107D_8 ///
	P107_9 P107A_9 P107B_9 P107B_9 P107C_9 P107D_9 P107_10 P107A_10 P107B_10 P107C_10 P107D_10 P107D_10ES ///
	P109_1 P109B_1 P109C_1 P109D_1 P109_2 P109B_2 P109C_2 P109D_2 ///
	P109_3 P109B_3 P109C_3 P109D_3 P110 P110A ///
	P112 P114 P133

rename P104_1 educ
gen educ_cat=.
replace educ_cat = 1 if educ == 1
replace educ_cat = 2 if educ == 2 | educ == 3 | educ == 4 | educ == 5
replace educ_cat = 3 if educ == 6 | educ == 7 | educ == 9
replace educ_cat = 4 if educ == 8 | educ == 10 | educ == 11
lab def educ 1 "No education" 2 "Elementary" 3 "Secondary" 4 "Higher education"
lab var educ_cat "Ultimo nivel aprobado (p104.1)"
lab val educ_cat educ


rename P107_1 neumo_cronica
lab var neumo_cronica "Autorreporte neumopatia cronica: asma, enfisema y/o bronquitis (p107.1)"

rename P107A_1 neumo_quien_dx 
lab var neumo_quien_dx "Neumopatia: Dx profesional salud  (p107.1a)"

rename P107B_1 neumo_cuando_dx 
lab var neumo_cuando_dx "Neumopatia: Dx antes de ingreso (p107.1b)"

rename P107C_1 neumo_tto
lab var neumo_tto "Neumopatia: Tratamiento (p107.1c)"

rename P107_2 hta
lab var hta "Autorreporte de HTA (p107.2)"

rename P107A_2 hta_quien_dx
lab var hta_quien_dx "HTA: Dx profesional salud  (p107.2a)" 

rename P107B_2 hta_cuando_dx
lab var  hta_cuando_dx "HTA: Dx antes de ingreso (p107.2b)"

rename P107C_2 hta_tto
lab var hta_tto "HTA: Tratamiento (p107.2c)"

rename P107_3 diabetes
lab var diabetes "Autorreporte de diabetes (p107.3)"
recode diabetes (3 = .a ) (2 = 0)
lab def P107_3 0 "No" 1 "Si", modify
lab val diabetes P107_3

rename P107A_3 diabetes_quien_dx
lab var diabetes_quien_dx "Diabetes: Dx profesional salud  (p107.3a)" 

rename P107B_3 diabetes_cuando_dx
lab var diabetes_cuando_dx "Diabetes: Dx antes de ingreso (p107.3b)"

rename P107C_3 diabetes_tto 
lab var diabetes_tto "Diabetes: Tratamiento (p107.3c)"

rename P107_4 tbc
lab var tbc "Autorreporte de TBC (p107.4)"
recode tbc (3 = .a ) (2 = 0)
lab def P107_4 0 "No" 1 "Si", modify
lab val tbc P107_4

rename P107A_4 tbc_quien_dx
lab var tbc_quien_dx "TBC: Dx profesional salud  (p107.4a)"
lab def P107A_4 1 "Si" 2 "No"
lab val tbc_quien_dx P107A_4

rename P107B_4 tbc_cuando_dx
lab var tbc_cuando_dx "TBC: Dx antes de ingreso (p107.4b)"
lab def P107B_4 1 "Si" 2 "No"
lab val tbc_cuando_dx P107B_4

rename P107C_4 tbc_tto
lab var tbc_tto "TBC: Tratamiento (p107.4c)"
lab def P107C_4 1 "Si" 2 "No"
lab val tbc_tto P107C_4

rename P107D_4 tbc_notto
lab var tbc_notto "TBC: Motivo de no recibir tto (p107.4d)"
lab def P107D_4 1 "No tiene dinero" 2 "Termino el tratamiento" 3 "El centro o consultorio se demora mucho en atender" ///
4 "No confía en los médicos" 5 "No es grave o necesario" 6 "Curarse con remedios caseros" 7 "No tiene seguro" ///
8 "No hay medicamentos en el EESS" 9 "Se auto receta o repite receta anterior" 10 "Falta de tiempo" ///
11 "Por el maltrato del personal de salud" 12 "Otro"
lab val tbc_notto P107D_4

rename P107D_4ESP tbc_notto2
lab var tbc_notto2 "TBC: Motivo de no recibir tto - especifique (p107.4d)"

rename P107_5 its
lab var its "Autorreporte de ITS (p107.5)"
recode its (3 = .a ) (2 = 0)
lab def P107_5 0 "No" 1 "Si"
lab val its P107_5

rename P107A_5 its_quien_dx
lab var its_quien_dx "ITS: Dx profesional salud (p107.5a)"
lab def P107A_5 1 "Si" 2 "No"
lab val its_quien_dx P107A_5

rename P107B_5 its_cuando_dx
lab var its_cuando_dx "ITS: Dx antes de ingreso (p107.5b)"
lab def P107B_5 1 "Si" 2 "No"
lab val its_cuando_dx P107B_5

rename P107C_5 its_tto
lab var its_tto "ITS: Tratamiento (p107.5c)"
lab def P107C_5 1 "Si" 2 "No"
lab val its_tto P107C_5

rename P107D_5 its_notto
lab var its_notto "ITS: Motivo de no recibir tto (p107.5d)"
lab def P107D_5 1 "No tiene dinero" 2 "Termino el tratamiento" 3 "El centro o consultorio se demora mucho en atender" ///
4 "No confía en los médicos" 5 "No es grave o necesario" 6 "Curarse con remedios caseros" 7 "No tiene seguro" ///
8 "No hay medicamentos en el EESS" 9 "Se auto receta o repite receta anterior" 10 "Falta de tiempo" ///
11 "Por el maltrato del personal de salud" 12 "Otro"
lab val its_notto P107D_5

rename P107D_5ESP its_notto2
lab var its_notto2 "ITS: Motivo de no recibir tto - especifique (p107.5d)"

rename P107_6 vih
lab var vih "Autorreporte de VIH (p107.6)"
recode vih (3 = .a ) (2 = 0)
lab def P107_6 0 "No" 1 "Si"
lab val vih P107_6

rename P107A_6 vih_quien_dx
lab var vih_quien_dx "VIH: Dx profesional salud (p107.6a)"
lab def P107A_6 1 "Si" 2 "No"
lab val vih_quien_dx P107A_6

rename P107B_6 vih_cuando_dx
lab var vih_cuando_dx "VIH: Dx antes de ingreso (p107.6b)"
lab def P107B_6 1 "Si" 2 "No"
lab val vih_cuando_dx P107B_6

rename P107C_6 vih_tto
lab var vih_tto "VIH: Tratamiento (p107.6c)"
lab def P107C_6 1 "Si" 2 "No"
lab val vih_tto P107C_6

rename P107D_6 vih_notto
lab var vih_notto "VIH: Motivo de no recibir tto (p107.6d)"
lab def P107D_6 1 "No tiene dinero" 2 "Termino el tratamiento" 3 "El centro o consultorio se demora mucho en atender" ///
4 "No confía en los médicos" 5 "No es grave o necesario" 6 "Curarse con remedios caseros" 7 "No tiene seguro" ///
8 "No hay medicamentos en el EESS" 9 "Se auto receta o repite receta anterior" 10 "Falta de tiempo" ///
11 "Por el maltrato del personal de salud" 12 "Otro"
lab val vih_notto P107D_6

rename P107D_6ESP vih_notto2
lab var vih_notto2 "VIH: Motivo de no recibir tto - especifique (p107.6d)"

rename P107_7 hepatitis
lab var hepatitis "Autorreporte de Hepatitis (p107.7)"

recode hepatitis (3 = .a ) (2 = 0)
lab def P107_7 0 "No" 1 "Si", modify
lab val hepatitis P107_7

rename P107A_7 hepatitis_quien_dx
lab var hepatitis_quien_dx "Hepatitis: Dx profesional salud (p107.7a)"

rename P107B_7 hepatitis_cuando_dx
lab var hepatitis_cuando_dx "Hepatitis: Dx antes de ingreso(p107.7b)"

rename P107C_7 hepatitis_tto
lab var hepatitis_tto "Hepatitis: Tratamiento (p107.7c)"

rename P107D_7 hepatitis_notto
lab var hepatitis_notto "Hepatitis: Motivo de no recibir tto (p107.7d)"

rename P107D_7ESP hepatitis_notto2
lab var hepatitis_notto2 "Hepatitis: Motivo de no recibir tto -especifique(p107.7d)"



rename P107_8 depresion
lab var depresion "Autorreporte de Depresion (p107.8)"
recode depresion (3 = .a ) (2 = 0)
lab def P107_8 0 "No" 1 "Si"
lab val depresion P107_8

rename P107A_8 depresion_quien_dx
lab var depresion_quien_dx "Depresion: Dx profesional salud (p107.8a)"

rename P107B_8 depresion_cuando_dx
lab var depresion_cuando_dx "Depresion: Dx antes de ingreso(p107.8b)"

rename P107C_8 depresion_tto
lab var depresion_tto "Depresion: Tratamiento (p107.8c)"

rename P107D_8 depresion_notto
lab var depresion_notto "Depresion: Motivo de no recibir tto (p107.8d)"



rename P107_9 ansiedad
lab var ansiedad "Autorreporte de Ansiedad (p107.9)"
recode ansiedad (3 = .a ) (2 = 0)
lab def P107_9 0 "No" 1 "Si"
lab val ansiedad P107_9

rename P107A_9 ansiedad_quien_dx
lab var ansiedad_quien_dx "Ansiedad: Dx profesional salud (p107.9a)"

rename P107B_9 ansiedad_cuando_dx
lab var ansiedad_cuando_dx "Ansiedad: Dx antes de ingreso(p107.9b)"

rename P107C_9 ansiedad_tto
lab var ansiedad_tto "Ansiedad: Tratamiento (p107.9c)"



rename P107D_9 ansiedad_notto
lab var ansiedad_notto "Ansiedad: Motivo de no recibir tto (p107.9d)"

rename P107_10 adiccion
lab var adiccion "Autorreporte de adiccion (p107.10)"
recode adiccion(3 = .a ) (2 = 0)
lab def P107_10 0 "No" 1 "Si", modify
lab val adiccion P107_10

rename P107A_10 adiccion_quien_dx
lab var adiccion_quien_dx "Adiccion: Dx profesional salud (p107.10a)"

rename P107B_10 adiccion_cuando_dx
lab var adiccion_cuando_dx "Addicion: Dx antes de ingreso(p107.10b)"

rename P107C_10 adiccion_tto
lab var adiccion_tto "Adiccion: Tratamiento (p107.10c)"

rename P107D_10 adiccion_notto
lab var adiccion_notto "Adiccion: Motivo de no recibir tto (p107.10d)"

rename P107D_10ES adiccion_notto2
lab var adiccion_notto2 "Adiccion: Motivo de no recibir tto - especifique (p107.10d)"




rename P109_1 consumo_drogas
lab var consumo_drogas "Consumo de drogas antes de ingresar (p109.1)"
recode consumo_drogas (3 = .a ) (2 = 0)
lab def P109_1 0 "No" 1 "Si", modify
lab val consumo_drogas P109_1

rename P109B_1 inicio_drogas
lab var inicio_drogas "Edad inicio de consumo drogas (p109.1b)"

rename P109C_1 drogas_mes
lab var drogas_mes "Consumo de drogas 1 mes antes de ingreso (p109.1c)"

rename P109D_1 frec_drogas_mes
lab var frec_drogas_mes "Frecuencia de consumo de drogas el mes previo a ingreso (p109.1d)"
recode frec_drogas_mes (1 = 12) (2 = 11) (3 = 10) (4 = 9) (5 = 8) (6 = 7)
lab def P109D_1 0 "Nunca" 1 "Otra frecuencia" 2 "Mensual" 3 "Quincenal" 4 "Semanal" 5 "2 a 6 veces a la semana" 6 "Diario", modify
replace frec_drogas_mes = frec_drogas_mes - 6
replace frec_drogas_mes = 0 if consumo_drogas==0 & frec_drogas_mes >= .
lab val frec_drogas_mes P109D_1



rename P109_2 consumo_oh
lab var consumo_oh "Consumo de alcohol antes de ingresar (p109.2)"

recode consumo_oh (3 = .a ) (2 = 0)
lab def P109_2 0 "No" 1 "Si", modify

rename P109B_2 inicio_oh
lab var inicio_oh"Edad inicio de consumo alcohol (p109.2b)"

rename P109C_2 oh_mes
lab var oh_mes "Consumo de alcohol 1 mes antes de ingreso (p109.2c)"

rename P109D_2 frec_oh_mes
lab var frec_oh_mes "Frecuencia de consumo de alcohol el mes previo a ingreso (p109.2d)"
recode frec_oh_mes (1 = 12) (2 = 11) (3 = 10) (4 = 9) (5 = 8) (6 = 7)
lab def P109D_2 0 "Nunca" 1 "Otra frecuencia" 2 "Mensual" 3 "Quincenal" 4 "Semanal" 5 "2 a 6 veces a la semana" 6 "Diario", modify
replace frec_oh_mes = frec_oh_mes - 6
replace frec_oh_mes = 0 if consumo_oh==0 & frec_oh_mes >=  .
lab val frec_oh_mes P109D_2


rename P109_3 consumo_tabaco
lab var consumo_tabaco "Consumo de tabaco antes de ingresar (p109.2)"

recode consumo_tabaco (3 = .a ) (2 = 0)
lab def P109_3 0 "No" 1 "Si", modify

rename P109B_3 inicio_tabaco
lab var inicio_tabaco "Edad inicio de consumo tabaco (p109.2b)"

rename P109C_3 tabaco_mes
lab var tabaco_mes "Consumo de tabaco 1 mes antes de ingreso (p109.2c)"

rename P109D_3 frec_tabaco_mes
lab var frec_tabaco_mes "Frecuencia de consumo de tabaco el mes previo a ingreso (p109.2d)"
recode frec_tabaco_mes (1 = 12) (2 = 11) (3 = 10) (4 = 9) (5 = 8) (6 = 7)
lab def P109D_3 0 "Nunca" 1 "Otra frecuencia" 2 "Mensual" 3 "Quincenal" 4 "Semanal" 5 "2 a 6 veces a la semana" 6 "Diario", modify
replace frec_tabaco_mes = frec_tabaco_mes - 6
replace frec_tabaco_mes = 0 if frec_tabaco_mes==0 & frec_tabaco_mes >= .
lab val frec_tabaco_mes P109D_3

rename P110 gestacion
lab var gestacion "Gestacion actualmente (p110)"

rename P110A gest_confirm
lab var gest_confirm "Gestacion actual confirmada (p110A)"

rename P112 identidad
lab var identidad "Identidad de genero (p112)"
recode identidad (4 = .a)

rename P114 trabajo
lab var trabajo "Trabajo antes de ingresar? (p114)"

rename P133 fam_preso
lab var fam_preso "Algun miembro de familia preso?(p133)"
lab def P133 1 "Si" 2"No"
lab val fam_preso P133
recode fam_preso (3=.)
lab val fam_preso P133

save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd1_merge.dta", replace



*****************
* Cuestionario 2*
*****************
use "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\cap200.dta", clear
keep id_caratula interno_id cuest_nro p215 p216 p219 p219a p220 p220a 

rename id_caratula ID_CARATUL

rename p215 int_juv_previo
lab var int_juv_previo "Internamietno juvenil previo (p215)"

recode int_juv_previo (3 = .a) (2 = 0)
lab def p215 0 "No" 1 "Si", modify

rename p216 sit_procesal
lab var sit_procesal  "Situacion procesal (p216)"

rename p219 pena_susp
lab var pena_susp "Sentencia previa con pena suspendida (p219)"

rename p219a n_pena_susp
lab var n_pena_susp "N sentencias previas con pena suspendida (p219a)"

rename p220 pena_efec
lab var pena_efec "Sentencia previa con pena efectiva(p220)"
recode pena_efec (3 = .a) (2 = 0)
lab def p220 0 "No" 1 "Si", modify

rename p220a n_pena_efec
lab var n_pena_efec "N sentencias previas con pena efectiva (p220a)"
replace n_pena_efec = 0 if pena_efec == 0 & n_pena_efec >= .

gen n_pena_efec2 = n_pena_efec
replace n_pena_efec2 = 3 if n_pena_efec >= 3 & n_pena_efec < .
lab var n_pena_efec2 "N sentencias previas con pena efectiva, categorizada (p220a)"
lab def pena 0 "Ninguna pena efectiva antes" 1 "1 pena previa" 2 "2 penas previas" 3 "3 o mas penas previas", modify
lab val n_pena_efec2 pena

save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd2_merge.dta", replace

*****************
* Cuestionario 3*
*****************
use "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\cap300.dta", clear
keep ID_CARATUL INTERNO_ID CUEST_NRO  P312_1 P312A_1 P312B_1 P312_3 P312A_3 P312B_3
 
rename P312_1 serv_psico
lab var serv_psic "Acude a servicio de psicologia? (p312.1)"

rename P312A_1 frec_serv_psico 
lab var frec_serv_psic "Frecuencia de uso servicio de psicologia? (p312.1a)"

rename P312B_1 calif_serv_psico
lab var frec_serv_psic "Calificacion servicio de psicologia? (p312.1b)"

rename P312_3 serv_salud
lab var serv_salud "Acude a servicio de salud? (p312.3)"

rename P312A_3 frec_serv_salud
lab var frec_serv_salud "Frecuencia de uso servicio de salud? (p312.3a)"

rename P312B_3 calif_serv_salud
lab var calif_serv_salud "Calificacion servicio de salud? (p312.3b)"

save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd3_merge.dta", replace

***************************
* Creando BD para analisis*
***************************
use "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd0_merge.dta", clear

merge 1:1 ID_CARATUL  using "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd1_merge.dta"
rename _merge merge1
save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd_0_1.dta", replace

merge 1:1 ID_CARATUL using "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd2_merge.dta"
rename _merge merge2
save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd_0_1_2.dta", replace

merge 1:1 ID_CARATUL using "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd3_merge.dta"
rename _merge merge3
save "C:\Users\Lenovo\Google Drive\512-Modulo861\Bases de datos\bd_final.dta", replace
