clear all
//---------------------------------------------------Loading the data in 
use "/Users/steicyl/Desktop/Thesis/Stata and R/D6_Thesis.dta"
cd "/Users/steicyl/Desktop/Thesis/DataFiles/Results"

//analysis by phases 
//phase 1 is april 2020 to dec 2020
//phase 2 is jan 2020 to june 2020
//phase 3 aug 2021 to june 2022
//phase 4 aug 2022 to june 2023

//-------------------------- Overall Model Tests
	preserve 
	
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter [pweight = final_weight], robust 
	
	margins, dydx(*) post //pulling unit changes
 
	outreg2 using "multinomial.xls", replace title(Multinomial)
	
	restore
	
//Phase 1
	preserve
	
//keeping only relevant waves 
 	keep if phase == 1

//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids e_remote miss_e_remote, robust
	
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timemultinomial1.xls", replace title(Multinomial By Phase)
	
	restore 
	
//Phase 2
	preserve

 //keeping only relevant waves 
	keep if phase == 2
 
//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timemultinomial1.xls", append 
	restore
	
//Phase 3 
	preserve
	
//keeping only relevant waves 
	keep if phase == 3
 	
//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timemultinomial1.xls", append 
	restore 
	
//Phase 4
	preserve
 	
//keep only relevant waves 
	keep if phase == 4

//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timemultinomial1.xls", append 

	restore
	
//Phase 1
	preserve
	
//keeping only relevant waves 
 	keep if phase == 1

//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 e_remote miss_e_remote, robust
		
	margins, dydx(*) post //pulling unit changes

	outreg2 using "otimemultinomial2.xls", replace 
	restore 
	
//Phase 2
	preserve

 //keeping only relevant waves 
	keep if phase == 2
 
//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "otimemultinomial2.xls", append 
	restore
	
//Phase 4
	preserve
 	
//keep only relevant waves 
	keep if phase == 4

//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "otimemultinomial2.xls", append

	restore
	

//Phase 1
	preserve
	
//keeping only relevant waves 
 	keep if phase == 1 // sept to dec 2020

//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter e_remote miss_e_remote, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "otimemultinomial3.xls", replace
	restore 
	
//Phase 2
	preserve

 //keeping only relevant waves 
	keep if phase == 2 // jan to june 2021
 
//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "otimemultinomial3.xls", append
	restore
	
//Phase 4
	preserve
 	
//keep only relevant waves 
	keep if phase == 4 // july 2022 to july 2023

//running the regression
	mlogit schooltype i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "otimemultinomial3.xls", append

	restore

