************************COvid-19 Survey on Food Aid Distribution by The Gambian Government*********************


use "C:\Users\USER\Desktop\Covid Data\COVID-Research-Datasets_All\Master datasets for all three versions\Master_dataset_v1.dta" 
append using "C:\Users\USER\Desktop\Covid Data\COVID-Research-Datasets_All\Master datasets for all three versions\Master_dataset_v2.dta" "C:\Users\USER\Desktop\Covid Data\COVID-Research-Datasets_All\Master datasets for all three versions\Master_data_set_v3.dta"
duplicates report
duplicates list
ttest hhsize, by (pretest)
br if missing(h_household)
edit if !e(sample)
drop if missing(h_household)
br if missing(h_household)
count
codebook h_household
ttest monthly_hh_inc_range , by (pretest)
tab monthly_hh_inc_range

tab source_drinking_water_hh_os
 **should correct/replace the names**
 replace source_drinking_water_hh_os="Well with Pump" if substr(source_drinking_water_hh_os, strpos(source_drinking_water_hh_os,"Hand Pump"), .)!=""
tab source_drinking_water_hh_os
asdoc tab source_drinking_water_hh_os, append
asdoc tab toilet_facility_hh , append
tab toilet_facility_hh toilet_facility_hh_os
tab toilet_facility_hh_os
des toilet_facility_hh_os
br toilet_facility_hh_os

tab source_lightining_hh
ttest source_lightining_hh , by (pretest)
tab source_lightining_hh if pretest==0
asdoc tab source_lightining_hh if pretest==0, append

 **should correct/replace the names**
tab source_lightining_hh_os
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Battery lamp"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Battery"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"battery lamp"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"battery lamps"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"battery"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Battery"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"battery lamp"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"battery lamps"), .)!=""
replace source_lightining_hh_os="Battery Lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"battery"), .)!=""
replace source_lightining_hh_os="Hand lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Hand lamps"), .)!=""
replace source_lightining_hh_os="Lantern lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Lantern Lamps"), .)!=""
replace source_lightining_hh_os="Lantern lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Lantern lights"), .)!=""
replace source_lightining_hh_os="Lantern lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Lnatern lamps"), .)!=""
replace source_lightining_hh_os="Lantern lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"lantern lamps"), .)!=""
replace source_lightining_hh_os="Torchlight" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Torch lights"), .)!=""
replace source_lightining_hh_os="Torchlight" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"torch"), .)!=""
replace source_lightining_hh_os="Torchlight" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"torch light"), .)!=""
replace source_lightining_hh_os="Torchlight" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"touch light"), .)!=""
replace source_lightining_hh_os="Torchlight" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"trouch lights "), .)!=""
replace source_lightining_hh_os="Torchlight" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"trouch lights"), .)!=""
replace source_lightining_hh_os="Lantern lamp" if substr(source_lightining_hh_os, strpos(source_lightining_hh_os,"Lantern lamps"), .)!=""
tab source_lightining_hh_os
ttest source_lightining_hh_os , by (pretest)
tab source_lightining_hh_os if pretest==0

**Should present in pie chart**
tab source_cooking_energy_hh
tab source_cooking_energy_hh if pretest==0

replace floor_type_hh_os ="Concreted floor" if substr( floor_type_hh_os , strpos( floor_type_hh_os ,"concreted floor"), .)!=""
replace floor_type_hh_os ="Sand" if substr( floor_type_hh_os , strpos( floor_type_hh_os ,"sand"), .)!=""
replace wall_material_hh_os ="no wall" if substr( wall_material_hh_os , strpos( wall_material_hh_os ,"open compound"), .)!=""

egen no_assets=sum( facili_available_hh__2 + facili_available_hh__2 + facili_available_hh__3 + facili_available_hh__4 + facili_available_hh__5 + facili_available_hh__6 + facili_available_hh__7 + facili_available_hh__8 + facili_available_hh__9 + facili_available_hh__10 + facili_available_hh__11 + facili_available_hh__12 + facili_available_hh__13 + facili_available_hh__14 + facili_available_hh__15 + facili_available_hh__16 + facili_available_hh__17), by (hid)
egen no_livestock=sum( livestock_hh__1 + livestock_hh__2 + livestock_hh__3 + livestock_hh__4 + livestock_hh__5 + livestock_hh__6 + livestock_hh__7 ), by (hid)
asdoc tabstat num_rooms_in_house no_assets no_livestock longetivity_stocks_hh, statistics( mean var max min ) if pretest==0

label define aspect_suscept_corrupt_prac 1 "Procurement of the items" 2 "Transportation to distribution point" 3 "Distribution of the items in the community" 4 "Storage" 9 "Others" 5 "I don't know", replace

tab aspect_suscept_corrupt_prac_os if pretest==0
replace aspect_suscept_corrupt_prac_os ="I don't know" if substr( aspect_suscept_corrupt_prac_os , strpos( aspect_suscept_corrupt_prac_os ,"know"), .)!=""
replace aspect_suscept_corrupt_prac_os ="I don't know" if substr( aspect_suscept_corrupt_prac_os , strpos( aspect_suscept_corrupt_prac_os ,"i don't no exactly"), .)!=""
replace aspect_suscept_corrupt_prac_os ="none of the above" if substr( aspect_suscept_corrupt_prac_os , strpos( aspect_suscept_corrupt_prac_os ,"one"), .)!=""
replace aspect_suscept_corrupt_prac_os ="I don't know" if substr( aspect_suscept_corrupt_prac_os , strpos( aspect_suscept_corrupt_prac_os ,"no idea"), .)!=""
tab aspect_suscept_corrupt_prac_os if pretest==0

*for pie chart of multiselect*
label var role_curb_menace__1 "exposing perpetrators"
label var role_curb_menace__2 "laising (law enforcement)"
label var role_curb_menace__3 "internal checks"
label var role_curb_menace__4 "none"
label var role_curb_menace__5 "I dont know"
graph pie role_curb_menace__1 role_curb_menace__2 role_curb_menace__3 role_curb_menace__4 role_curb_menace__5, sort plabel(_all percent, size(small) orientation(vertical) format(%2.1gc)) title(Community's Strategies for curbing corruption, size(small)) subtitle(, size(vsmall)), if pretest==0

label var curbing_misma_covid__2 "Setting due proccess mechanism"
label var curbing_misma_covid__3 "equip law enforcement agencies"
label var curbing_misma_covid__4 "enlight the public on consequencies"
label var curbing_misma_covid__5 "participation of local authorities"
label var curbing_misma_covid__4 "enlight the public on consequencies"
graph save Graph "C:\Users\USER\Desktop\Covid Data\COVID-Research-Datasets_All\Master datasets for all three versions\Graph_curbing_missma_covid.gph"

replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"I have not heard"), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"I was not there."), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"N/A"), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"NA"), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"No other source to base my assessment.."), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"No where"), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"doesn't know"), .)!=""
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"don't know"), .)!=""
tab base_assessm_on_os if pretest==0
replace base_assessm_on_os ="I don't know" if substr( base_assessm_on_os , strpos( base_assessm_on_os ,"dosent know"), .)!=""

*sumerizing var chng_corruption__0 and chng_corruption__1*
replace chng_corruption__0 ="Government intervention" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Government"), .)!=""
replace chng_corruption__0 ="Government intervention" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"government"), .)!=""
replace chng_corruption__0 ="Government intervention" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"security"), .)!=""
replace chng_corruption__0 ="Convict culprits" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"expose"), .)!=""
replace chng_corruption__0 ="Convict culprits" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Expose"), .)!=""
replace chng_corruption__0 ="Convict culprits" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"culprits"), .)!=""
replace chng_corruption__0 ="Convict culprits" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Culprits"), .)!=""
replace chng_corruption__0 ="Convict culprits" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"perpetrators"), .)!=""
replace chng_corruption__0 ="Convict culprits" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Perpetrators"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"officials"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Officials"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Police"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"police"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"personnel"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"personel"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"personals"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Appoint"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"appoint"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Assign"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"assign"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"officers"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"employee"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Employ"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"employ"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"competent"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Competent"), .)!=""
replace chng_corruption__0 ="Employ competent officials" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"job"), .)!=""
replace chng_corruption__0 ="Ensure transparency and fair distribution" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"transparency"), .)!=""
replace chng_corruption__0 ="Ensure transparency and fair distribution" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Transparency"), .)!=""
replace chng_corruption__0 ="Ensure transparency and fair distribution" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"transparent"), .)!=""
replace chng_corruption__0 ="Ensure transparency and fair distribution" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"fair"), .)!=""
replace chng_corruption__0 ="Ensure transparency and fair distribution" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Fair"), .)!=""
replace chng_corruption__0 ="Advocate attitudinal change" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"attitude"), .)!=""
replace chng_corruption__0 ="Advocate attitudinal change" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Attitudinal"), .)!=""
replace chng_corruption__0 ="Advocate attitudinal change" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"attitudinal"), .)!=""
replace chng_corruption__0 ="Advocate attitudinal change" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"tribalism"), .)!=""
replace chng_corruption__0 ="Advocate attitudinal change" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"loyal"), .)!=""
replace chng_corruption__0 ="Advocate attitudinal change" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"truth"), .)!=""
replace chng_corruption__0 ="Youth empowerment" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"youths"), .)!=""
replace chng_corruption__0 ="Youth empowerment" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"youth"), .)!=""
replace chng_corruption__0 ="Youth empowerment" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"Youth"), .)!=""
replace chng_corruption__0 ="Youth empowerment" if substr( chng_corruption__0 , strpos( chng_corruption__0 ,"young"), .)!=""

