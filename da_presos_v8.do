*********************************************************************
* Project: 	HIV in Peruvian inmates: results from the 2016 census 	*
* Authors: 	Carlos Culquichicon, Percy Soto-Becerra, 				*
*			Luis E. Zapata-Castro,Kelika A. Konda, Andres G. Lescano*
* Data managers: 	Carlos Culquichicon, Percy Soto-Becerra			* 
*					and Andres G. Lescano							*
* Last update:		12/30/18										*
*********************************************************************
version 15.1
local dir `autocd'
cd "`autocd'"
capture log close
use "ds_presos.dta", clear
set linesize 200
*log using "da_presos_m_v2.log", replace

** Setting-up 
global ssses "edadcat sex depart_nac_cat_byte educ_cat civilcat"
global sspri "pena_efec n_pena_efec2 int_juv_previo fam_preso sit_procesal"
global ssmed "its tbc depresion ansiedad adiccion hepatitis"
global ssris "drogas_mes oh_mes tabaco_mes identidad"

#delimit;
global sspen= "205 108 501 401 202 503 208 210 101 803 201 111 213 706 701 707
404 103 602 606 214 212 107 303 601 702 403 502 703 302 605 801
102 410 305 407 402 110 104 705 406 105";
#delimit cr;

egen penal_muj=anymatch(penal_cod), v($sspen)

gen penal_pop=.
replace penal_pop = 788			if penal_cod == 503
replace penal_pop = 590			if penal_cod == 607
replace penal_pop = 488			if penal_cod == 701
replace penal_pop = 60			if penal_cod == 702
replace penal_pop = 286			if penal_cod == 703
replace penal_pop = 800			if penal_cod == 704
replace penal_pop = 78			if penal_cod == 705
replace penal_pop = 654			if penal_cod == 706
replace penal_pop = 544			if penal_cod == 707
replace penal_pop = 280			if penal_cod == 708
replace penal_pop = 636			if penal_cod == 709
replace penal_pop = 572			if penal_cod == 203
replace penal_pop = 2200		if penal_cod == 209
replace penal_pop = 1620		if penal_cod == 210
replace penal_pop = .			if penal_cod == 211
replace penal_pop = 288			if penal_cod == 212
replace penal_pop = 450			if penal_cod == 213
replace penal_pop = 548			if penal_cod == 214
replace penal_pop = 42			if penal_cod == 215
replace penal_pop = 3204		if penal_cod == 216
replace penal_pop = 1142		if penal_cod == 217
replace penal_pop = .			if penal_cod == 218
replace penal_pop = 350			if penal_cod == 201
replace penal_pop = 920			if penal_cod == 202
replace penal_pop = 1152		if penal_cod == 204
replace penal_pop = 1464		if penal_cod == 205
replace penal_pop = 768			if penal_cod == 206
replace penal_pop = 823			if penal_cod == 207
replace penal_pop = 644			if penal_cod == 208
replace penal_pop = 644			if penal_cod == 401
replace penal_pop = 42			if penal_cod == 402
replace penal_pop = 60			if penal_cod == 403
replace penal_pop = 120			if penal_cod == 404
replace penal_pop = 680			if penal_cod == 405
replace penal_pop = 105			if penal_cod == 406
replace penal_pop = 85			if penal_cod == 407
replace penal_pop = 50			if penal_cod == 408
replace penal_pop = 48			if penal_cod == 409
replace penal_pop = 64			if penal_cod == 410
replace penal_pop = 1074		if penal_cod == 501
replace penal_pop = 96			if penal_cod == 502
replace penal_pop = 888			if penal_cod == 101
replace penal_pop = 65			if penal_cod == 102
replace penal_pop = .			if penal_cod == 103
replace penal_pop = 150			if penal_cod == 104
replace penal_pop = 72			if penal_cod == 105
replace penal_pop = 1518		if penal_cod == 106
replace penal_pop = 160			if penal_cod == 107
replace penal_pop = 1143		if penal_cod == 108
replace penal_pop = 1370		if penal_cod == 109
replace penal_pop = 50			if penal_cod == 110
replace penal_pop = 384			if penal_cod == 111
replace penal_pop = 667			if penal_cod == 301
replace penal_pop = 67			if penal_cod == 302
replace penal_pop = 78			if penal_cod == 303
replace penal_pop = 222			if penal_cod == 304
replace penal_pop = 40			if penal_cod == 305
replace penal_pop = 214			if penal_cod == 306
replace penal_pop = 90			if penal_cod == 601
replace penal_pop = 248			if penal_cod == 602
replace penal_pop = 800			if penal_cod == 604
replace penal_pop = 62			if penal_cod == 605
replace penal_pop = 80			if penal_cod == 606
replace penal_pop = 44			if penal_cod == 801
replace penal_pop = 352			if penal_cod == 802
replace penal_pop = 420			if penal_cod == 803


#delimit;
global sspen1="
216 106 217 203 207 109 209 604 206 405 301 204 704 304 607 802 708 709
408 306 409 215 218 211
";
#delimit cr;

#delimit;
global sspen2="
213 214 212 107 302 605 801 305 407 110 705 406 105
";
#delimit cr;

#delimit;
global sspen3="
205 108 501 401 202 503 208 210 101 803 201 111 706 701 707 404 103 602
606 303 601 702 403 502 703 102 410 402 104
";
#delimit cr;

gen penal_sex=.

foreach i in $sspen1 {
replace penal_sex=1 if penal_cod== `i'
}

foreach i in $sspen2 {
replace penal_sex=2 if penal_cod== `i'
}

foreach i in $sspen3 {
replace penal_sex=3 if penal_cod== `i'
}

gen penal_overcrowd=.

replace penal_overcrowd = 159.8			if penal_cod == 503
replace penal_overcrowd = 20.5			if penal_cod == 607
replace penal_overcrowd = 27.9			if penal_cod == 701
replace penal_overcrowd = 283.3			if penal_cod == 702
replace penal_overcrowd = -45.1			if penal_cod == 703
replace penal_overcrowd = 27.6			if penal_cod == 704
replace penal_overcrowd = -17.9			if penal_cod == 705
replace penal_overcrowd = 3.7			if penal_cod == 706
replace penal_overcrowd = 7.4			if penal_cod == 707
replace penal_overcrowd = -15.6			if penal_cod == 708
replace penal_overcrowd = 63.2			if penal_cod == 709
replace penal_overcrowd = 456.6			if penal_cod == 203
replace penal_overcrowd = 3.3		if penal_cod == 209
replace penal_overcrowd = -10.2		if penal_cod == 210
replace penal_overcrowd = .			if penal_cod == 211
replace penal_overcrowd = 5.9			if penal_cod == 212
replace penal_overcrowd = 77.6			if penal_cod == 213
replace penal_overcrowd = -38.3			if penal_cod == 214
replace penal_overcrowd = -71.4			if penal_cod == 215
replace penal_overcrowd = 196.8		if penal_cod == 216
replace penal_overcrowd = 276.3		if penal_cod == 217
replace penal_overcrowd = .			if penal_cod == 218
replace penal_overcrowd = 188.6			if penal_cod == 201
replace penal_overcrowd = 151.2			if penal_cod == 202
replace penal_overcrowd = 15.1		if penal_cod == 204
replace penal_overcrowd = 167.7		if penal_cod == 205
replace penal_overcrowd = 155.9			if penal_cod == 206
replace penal_overcrowd = 280.3			if penal_cod == 207
replace penal_overcrowd = 169.7			if penal_cod == 208
replace penal_overcrowd = 276.4			if penal_cod == 401
replace penal_overcrowd = 140.5			if penal_cod == 402
replace penal_overcrowd = 228.3			if penal_cod == 403
replace penal_overcrowd = 375.0			if penal_cod == 404
replace penal_overcrowd = 188.8			if penal_cod == 405
replace penal_overcrowd = -70.5			if penal_cod == 406
replace penal_overcrowd = 22.4			if penal_cod == 407
replace penal_overcrowd = 226.0			if penal_cod == 408
replace penal_overcrowd = 75.0			if penal_cod == 409
replace penal_overcrowd = 76.6			if penal_cod == 410
replace penal_overcrowd = 137.2		if penal_cod == 501
replace penal_overcrowd = 103.1			if penal_cod == 502
replace penal_overcrowd = 51.1			if penal_cod == 101
replace penal_overcrowd = 100.0			if penal_cod == 102
replace penal_overcrowd = .			if penal_cod == 103
replace penal_overcrowd = -47.3			if penal_cod == 104
replace penal_overcrowd = -84.7			if penal_cod == 105
replace penal_overcrowd = 192.6		if penal_cod == 106
replace penal_overcrowd = 75.6			if penal_cod == 107
replace penal_overcrowd = 174.5		if penal_cod == 108
replace penal_overcrowd = 125.5		if penal_cod == 109
replace penal_overcrowd = 82.0			if penal_cod == 110
replace penal_overcrowd = 124.0			if penal_cod == 111
replace penal_overcrowd = 193.9			if penal_cod == 301
replace penal_overcrowd = 123.9			if penal_cod == 302
replace penal_overcrowd = 234.6			if penal_cod == 303
replace penal_overcrowd = 269.4			if penal_cod == 304
replace penal_overcrowd = 172.5			if penal_cod == 305
replace penal_overcrowd = -24.3			if penal_cod == 306
replace penal_overcrowd = 181.1			if penal_cod == 601
replace penal_overcrowd = 41.5			if penal_cod == 602
replace penal_overcrowd = 184.4			if penal_cod == 604
replace penal_overcrowd = 119.4			if penal_cod == 605
replace penal_overcrowd = 327.5			if penal_cod == 606
replace penal_overcrowd = 209.1			if penal_cod == 801
replace penal_overcrowd = 63.6			if penal_cod == 802
replace penal_overcrowd = 153.6			if penal_cod == 803

gen penal_overcrowdind=.
replace penal_overcrowdind= 1 if penal_overcrowd>=20
replace penal_overcrowdind= 0 if penal_overcrowd<20

#delimit;
global ssfull="vih 	edadcat depart_nac_cat_byte educ_cat civilcat pena_efec 
int_juv_previo fam_preso its tbc depresion ansiedad adiccion hepatitis 
drogas_mes oh_mes tabaco_mes identidad";
#delimit;

** Univariate and bivariate analysis
foreach i in vih vih_quien_dx vih_tto vih_cuando_dx {
*tab1 `i' if sex==1
prop `i' if sex==1
}

foreach i in vih vih_quien_dx vih_tto vih_cuando_dx {
*tab1 `i' if sex==1
prop `i' if sex==2
}



foreach i in $ssses $sspri $ssmed $ssris{
tab1 `i'
}




** Prisons
tab penal_hacin vih if sex==1, chi2 row
tab penal_hacin vih if sex==2, chi2 row

xtset penal_cod
foreach i in penal_sex penal_hacin {
xttab `i'
}
tab penal_cod
bys sex: tab penal_cod vih, row


* Reasons for non-treatment
tab vih_notto if sex==1 & vih_notto!=2, sort
tab vih_notto if sex==2 & vih_notto!=2, sort



								*************
								*** Males ***
								*************

** Nested Models
*tabmiss $ssses $sspri $ssmed $ssris
quietly {
poisson vih 	edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				its tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes if sex==1, nolog vce(robust) irr
}
gen nomiss = e(sample)

	* Level 1
eststo m_0: quietly poisson vih if nomiss==1,nolog irr

foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				its tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih  ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*
esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				its tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
sca chi2_`i'=  chi2tail(df_`i',chi2_`i')
sca list chi2_`i'
di "--------------------------------------------------------------------------" 
}

*/


eststo clear
matrix drop _all
scalar drop _all


/* its selected*/


	* Level 2
eststo m_0: quietly poisson vih its if nomiss==1,nolog irr

foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih  its ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*
esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}


*/

eststo clear
matrix drop _all
scalar drop _all




/* tbc selected*/


	* Level 3
eststo m_0: quietly poisson vih its tbc if nomiss==1,nolog irr

foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

/*		
foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/

eststo clear
matrix drop _all
scalar drop _all




/*  civilcat selected*/

	* Level 4
eststo m_0: quietly poisson vih its tbc civilcat if nomiss==1,nolog irr

foreach i in edadcat depart_nac_cat_byte educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc civilcat ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat depart_nac_cat_byte educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}
*/



eststo clear
matrix drop _all
scalar drop _all




/*  drogas_mes selected*/

	* Level 5
eststo m_0: quietly poisson vih its tbc civilcat drogas_mes if nomiss==1,nolog irr

foreach i in edadcat depart_nac_cat_byte educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc civilcat drogas_mes ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}


/*
esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat depart_nac_cat_byte educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}
*/


eststo clear
matrix drop _all
scalar drop _all




/* depart_nac_cat_byte selected*/

	* Level 6
eststo m_0: quietly poisson vih its tbc civilcat drogas_mes depart_nac_cat_byte if nomiss==1,nolog irr

foreach i in edadcat  educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc civilcat drogas_mes depart_nac_cat_byte ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}


/*

esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}
*/



eststo clear
matrix drop _all
scalar drop _all




/* edadcat selected*/


	* Level 7
eststo m_0: quietly poisson vih its tbc civilcat drogas_mes depart_nac_cat_byte /// 
					edadcat if nomiss==1,nolog irr

foreach i in   educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc civilcat drogas_mes depart_nac_cat_byte ///
					edadcat `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}


/*

esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in  educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/


eststo clear
matrix drop _all
scalar drop _all


/* adiccion selected*/


	* Level 8
eststo m_0: quietly poisson vih its tbc civilcat drogas_mes depart_nac_cat_byte /// 
					edadcat adiccion if nomiss==1,nolog irr

foreach i in   educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad  hepatitis ///
				oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc civilcat drogas_mes depart_nac_cat_byte ///
					edadcat adiccion `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}


/*
esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in  educ_cat /// 
				int_juv_previo fam_preso ///
				depresion ansiedad hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}


*/

eststo clear
matrix drop _all
scalar drop _all

/* fam_preso selected*/


	* Level 9
eststo m_0: quietly poisson vih its tbc civilcat drogas_mes depart_nac_cat_byte /// 
					edadcat adiccion fam_preso if nomiss==1,nolog irr

foreach i in   educ_cat /// 
				int_juv_previo ///
				depresion ansiedad  hepatitis ///
				oh_mes tabaco_mes  {
eststo m_`i': quietly poisson 	vih  its tbc civilcat drogas_mes depart_nac_cat_byte ///
					edadcat adiccion fam_preso `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}



/*

esttab m_*, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in  educ_cat /// 
				int_juv_previo ///
				depresion ansiedad hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/


eststo clear
matrix drop _all
scalar drop _all

/* no variable selected*/



** Regression models
*> Crude models
glm vih ib3.edadcat if nomiss==1, 	link(log) family(poisson) eform vce(robust) nolog
glm vih ib2.depart_nac_cat_byte if nomiss==1, link(log) family(poisson) eform vce(robust) nolog
glm vih ib4.educ_cat if nomiss==1, 			link(log) family(poisson) eform vce(robust) nolog
glm vih ib2.civilcat if nomiss==1, 			link(log) family(poisson) eform vce(robust) nolog


foreach i in pena_efec n_pena_efec2 int_juv_previo  {
glm vih i.`i' if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog
}
glm vih ib2.fam_preso if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog
glm vih ib1.sit_procesal if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog
glm vih i.penal_hacin if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog

foreach i in $ssmed drogas_mes oh_mes tabaco_mes {
glm vih i.`i' if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog
}

glm vih ib2.oh_mes if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog
glm vih ib2.tabaco_mes if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog
glm vih ib1.identidad if vih!=. & nomiss==1, link(log) family(poisson) eform vce(robust) nolog



*> Multilevel parsimonious model
meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog


*> Multilevel parsimonious adjusted model
meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso ib4.educ_cat ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog

foreach i in 	 pena_efec n_pena_efec2 int_juv_previo penal_hacin depresion ansiedad ///
				adiccion hepatitis {
meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso  i.`i' ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog
}

meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso ib1.sit_procesal ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog	

meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso ib2.oh_mes ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog

meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso ib2.tabaco_mes ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog

meglm vih 	i.its i.tbc ib2.civilcat ib2.drogas_mes ib2.depart_nac_cat_byte ///
				ib3.edadcat i.adiccion ib2.fam_preso ib2.identidad ///
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog

*log close _all


								***************
								*** Females ***
								***************
version 15.1
local dir `autocd'
cd "`autocd'"
use "ds_presos.dta", clear
*log using "da_presos_f.log", replace
set linesize 200

** Setting-up 
global ssses "edadcat sex depart_nac_cat_byte educ_cat civilcat"
global sspri "pena_efec n_pena_efec2 int_juv_previo fam_preso sit_procesal"
global ssmed "its tbc depresion ansiedad adiccion hepatitis"
global ssris "drogas_mes oh_mes tabaco_mes identidad"



** Univariate and bivariate analysis
foreach i in vih vih_quien_dx vih_tto vih_cuando_dx {
tab1 `i' if sex==2
*prop `i' if sex==2
}

foreach i in $ssses $sspri $ssmed $ssris{
*tab1 `i'
*prop `i'
tab `i' vih if sex==2, row chi2
}

tab penal_hacin vih if sex==2, chi2 row

* Figure 1
tab vih_notto if sex==2 & vih_notto!=2, sort

** Nested Models
*tabmiss $ssses $sspri $ssmed $ssris
quietly {
poisson vih 	depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				its tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes if sex==2, nolog vce(robust) irr
}
gen nomiss = e(sample)

	* Level 1
eststo m_0: quietly poisson vih if nomiss==1,nolog irr

foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				its tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih  ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat depart_nac_cat_byte educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				its tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/

eststo clear
matrix drop _all
scalar drop _all

/* its selected*/


	* Level 2
eststo m_0: quietly poisson vih its if nomiss==1,nolog irr

foreach i in edadcat  educ_cat civilcat depart_nac_cat_byte /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih its ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat educ_cat civilcat depart_nac_cat_byte /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/

eststo clear
matrix drop _all
scalar drop _all

/* depart_nac_cat_byte selected*/


	* Level 3
eststo m_0: quietly poisson vih depart_nac_cat_byte its if nomiss==1,nolog irr

foreach i in edadcat  educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih depart_nac_cat_byte its ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				drogas_mes oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/


eststo clear
matrix drop _all
scalar drop _all

/* drogas_mes selected*/

	
	* Level 4
eststo m_0: quietly poisson vih depart_nac_cat_byte its drogas_mes if nomiss==1,nolog irr

foreach i in   edadcat educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				 oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih depart_nac_cat_byte its drogas_mes ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in edadcat educ_cat civilcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/

eststo clear
matrix drop _all
scalar drop _all

/*  civilcat selected*/


	* Level 5
eststo m_0: quietly poisson vih depart_nac_cat_byte its drogas_mes civilcat ///
						if nomiss==1,nolog irr

foreach i in   educ_cat edadcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				 oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih depart_nac_cat_byte its civilcat drogas_mes ///
					`i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in educ_cat edadcat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}


*/

eststo clear
matrix drop _all
scalar drop _all

/* edadcat selected*/

	* Level 6
eststo m_0: quietly poisson vih depart_nac_cat_byte its drogas_mes civilcat edadcat ///
						if nomiss==1,nolog irr

foreach i in   educ_cat  /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				 oh_mes tabaco_mes {
eststo m_`i': quietly poisson 	vih depart_nac_cat_byte its civilcat drogas_mes ///
					edadcat `i' if nomiss==1,nolog irr
lrtest m_0 m_`i'
sca df_`i'=r(df)
sca p_`i'=r(p)
sca chi2_`i'=r(chi2)
}

/*

esttab, varwidth(25) eform star (* 0.05 ** 0.01 *** 0.001) ///
		compress nogaps p  stats(df chi2 p N) ///
		mtitles("M0" "MA1" "MA2" "MA3" "MA4" "MA5" "MA6" "MA7" "MA8" "MA9" ///
			"MA10" "MA11" "MA12" "MA13" "MA14" "MA15" "MA16" "MA17") ///
		addnotes("Exponentiated coeficients are Prevalence Ratio")

		
foreach i in educ_cat /// 
				int_juv_previo fam_preso ///
				tbc depresion ansiedad adiccion hepatitis ///
				oh_mes tabaco_mes {
di "--------------------------------------------------------------------------" 
di "m_0 m_`i'"
sca list df_`i'
di chi2tail(df_`i',chi2_`i')
di "--------------------------------------------------------------------------" 
}

*/

eststo clear
matrix drop _all
scalar drop _all

/* no variables selected*/


** Regression models
*> Crude models
*glm vih ib3.edadcat if sex==2, 					link(log) family(poisson) eform vce(robust) nolog
glm vih ib2.depart_nac_cat_byte if nomiss==1, 		link(log) family(poisson) eform vce(robust) nolog
glm vih ib4.educ_cat if nomiss==1, 				link(log) family(poisson) eform vce(robust) nolog
glm vih ib2.civilcat if nomiss==1, 				link(log) family(poisson) eform vce(robust) nolog


foreach i in pena_efec n_pena_efec2 int_juv_previo  {
glm vih i.`i' if vih!=. & nomiss==1, 				link(log) family(poisson) eform vce(robust) nolog
}
glm vih ib2.fam_preso if vih!=. & nomiss==1, 		link(log) family(poisson) eform vce(robust) nolog
glm vih ib1.sit_procesal if vih!=. & nomiss==1, 	link(log) family(poisson) eform vce(robust) nolog
glm vih i.penal_hacin if vih!=. & nomiss==1, 		link(log) family(poisson) eform vce(robust) nolog

foreach i in $ssmed drogas_mes oh_mes tabaco_mes {
glm vih i.`i' if vih!=. & nomiss==1, 				link(log) family(poisson) eform vce(robust) nolog
}

glm vih ib2.oh_mes if vih!=. & nomiss==1, 			link(log) family(poisson) eform vce(robust) nolog
glm vih ib2.tabaco_mes if vih!=. & nomiss==1, 		link(log) family(poisson) eform vce(robust) nolog
glm vih ib1.identidad if vih!=. & nomiss==1, 		link(log) family(poisson) eform vce(robust) nolog


*> Multilevel parsimonious model
meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat	///			
				if nomiss==1, link(log) family(poisson) eform vce(robust) nolog
		
*> Multilevel parsimonious adjusted model
meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat	///			
				ib4.educ_cat if nomiss==1, link(log) family(poisson) eform vce(robust) nolog

foreach i in pena_efec n_pena_efec2 int_juv_previo penal_hacin depresion  ///
				tbc hepatitis depresion ansiedad adiccion{				
meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat ///
				i.`i' if nomiss==1, link(log) family(poisson) eform vce(robust) nolog
}				

meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat ///
				ib2.fam_preso if nomiss==1, link(log) family(poisson) eform vce(robust) nolog				
				
meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat ///
				ib1.sit_procesal if nomiss==1, link(log) family(poisson) eform vce(robust) nolog
				
meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat ///
				ib1.sit_procesal if nomiss==1, link(log) family(poisson) eform vce(robust) nolog

meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat	 ///
				ib2.oh_mes if nomiss==1, link(log) family(poisson) eform vce(robust) nolog
				
meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat	 ///
				ib2.tabaco_mes if nomiss==1, link(log) family(poisson) eform vce(robust) nolog	

meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat	 ///
				ib2.tabaco_mes if nomiss==1, link(log) family(poisson) eform vce(robust) nolog		

meglm vih	i.its ib2.depart_nac_cat_byte ib2.drogas_mes ib2.civilcat ib3.edadcat	 ///
				ib1.identidad if nomiss==1, link(log) family(poisson) eform vce(robust) nolog			

				
*log close _all
clear
exit
