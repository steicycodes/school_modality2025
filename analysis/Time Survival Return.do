	
clear all
//---------------------------------------------------Loading the data in 
use "/Users/steicyl/Desktop/Thesis/Stata and R/D6_Thesis.dta"
cd "/Users/steicyl/Desktop/Thesis/DataFiles/Results"
//individual survival models 
//analysis by phases 
//phase 1 is august 2020 to dec 2020
//phase 2 is jan 2020 to june 2020
//phase 3 aug 2021 to june 2022
//phase 4 aug 2022 to june 2023

//generating survival variable 
	gen flag = publicreturn
	bysort uasid : replace flag = flag[_n-1] if flag[_n-1] == 1 
		//replaces the obs to one if the obs before that was one, done so after family returns to public there are ones

	gen survival = flag
		bysort uasid: replace survival = . if flag[_n-1] == 1
		//makes observations after switch missing 
		
	//Removing public school obs before returning for returners
		drop if survival ==0 & schooltype ==1
		

//Overall


//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", replace
	
				
//Phase 1
	preserve
	
//keeping only relevant waves 
 	keep if phase == 1 

//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids e_remote miss_e_remote, robust
	
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 2
	preserve

 //keeping only relevant waves 
	keep if phase == 2
 
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore
	
//Phase 3 
	preserve
	
//keeping only relevant waves 
	keep if phase == 3
 	
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 4 
	preserve
	
//keeping only relevant waves 
	keep if phase == 4 
 	
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 

	
//Phase 1
	preserve
	
//keeping only relevant waves 
 	keep if phase == 1

//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 e_remote miss_e_remote, robust
	
// percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 2
	preserve

 //keeping only relevant waves 
	keep if phase == 2
 
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore
	
//Phase 3 
	preserve
	
//keeping only relevant waves 
	keep if phase == 3
 	
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 percievedrisk miss_percievedrisk, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 4 
	preserve
	
//keeping only relevant waves 
	keep if phase == 4
 	
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 1
	preserve
	
//keeping only relevant waves 
 	keep if phase == 1

//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter e_remote miss_e_remote, robust
	
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 2
	preserve

 //keeping only relevant waves 
	keep if phase == 2
 
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids percievedrisk c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_percievedrisk miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore
	
//Phase 3 
	preserve
	
//keeping only relevant waves 
	keep if phase == 3
 	
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	
//Phase 4
	preserve
	
//keeping only relevant waves 
	keep if phase == 4
 	
//running the regression
	logit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "timesurvivalreturn.xls", append
	restore 
	

