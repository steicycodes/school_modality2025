	
clear all
//---------------------------------------------------Loading the data in 
use "/Users/steicyl/Desktop/Thesis/Stata and R/D6_Thesis.dta"
cd "/Users/steicyl/Desktop/Thesis/DataFiles/Results"
		
//generating survival variable 
	gen flag = publicreturn
	bysort uasid : replace flag = flag[_n-1] if flag[_n-1] == 1 
		//replaces the obs to one if the obs before that was one, done so after family returns to public there are ones

	gen survival = flag
		bysort uasid: replace survival = . if flag[_n-1] == 1
		//makes observations after switch missing 
		
	//Removing public school obs before returning for returners
		drop if survival ==0 & schooltype ==1
		
//modifying survival variable 
	//recoding so that switch to private = 2, homeschooling = 3, and other = 4
		replace survival = 1 if survival==1 & schooltype[_n-1] == 2
		replace survival = 2 if survival==1 & schooltype[_n-1] == 3
		replace survival = 3 if survival==1 & schooltype[_n-1] == 4

//running the regression
	mlogit survival i.survey_source working c_gender i.c_race_eth c_married_partner i.c_education2 c_ageres c_medcond i.c_urbanicity miss_c_urbanicity i.agekid i.income kids c_mediatrust1 c_institutionaltrust1 c_trust_source_fox miss_c_mediatrust1 miss_c_trumpvoter c_trumpvoter, robust
	
	margins, dydx(*) post //pulling unit changes

	outreg2 using "typesurvivalreturn.xls", replace
