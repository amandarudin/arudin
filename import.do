* Created on January 11, 2016 at 09:40:00 by the following -odkmeta- command:
* odkmeta using "import2.do", csv(firstvisit_20151210_results_nonPII.csv) choices(choices.csv) survey(questionnaire.csv)
* -odkmeta- version 1.1.0 was used.

version 9

* Change these values as required by your data.

* The mask of date values in the .csv files. See -help date()-.
* Fields of type date or today have these values.
local datemask MDY
* The mask of time values in the .csv files. See -help clock()-.
* Fields of type time have these values.
local timemask hms
* The mask of datetime values in the .csv files. See -help clock()-.
* Fields of type datetime, start, or end have these values.
local datetimemask MDYhms


/* -------------------------------------------------------------------------- */

* Start the import.
* Be cautious about modifying what follows.

local varabbrev = c(varabbrev)
set varabbrev off

* Find unused Mata names.
foreach var in values text {
	mata: st_local("external", invtokens(direxternal("*")'))
	tempname `var'
	while `:list `var' in external' {
		tempname `var'
	}
}

label drop _all

#delimit ;
* area_name;
label define area_name
	1 Gujranwala
	2 Muridke
	3 Kamoke
;
* collateral;
label define collateral
	1 Gold
	2 Property
	3 "Two personal guarantors"
	4 "Don't know"
	5 "Decline to state"
;
* collateral_calc;
label define collateral_calc
	1 Gold
	2 Property
	3 "Two personal guarantors"
;
* contact_type;
label define contact_type
	1 "In person "
	2 "On the phone "
;
* difaddress;
label define difaddress
	1 "A. Shifting"
	2 "B. Property Disposed off/Sold"
	3 "C. Employment"
	4 "D. Other"
;
* education;
label define education
	1 "A. Illiterate"
	2 "B. 10th Grade"
	3 "C. 12th Grade"
	4 "D. Graduate"
;
* enumerator_name;
label define enumerator_name
	1 "Qaiser Abbas"
	2 "Ibrar Arshad Bhatti"
	3 "Waqar Zafar"
;
* firstvisit_type;
label define firstvisit_type
	1 "Scheduled visit"
	2 "Un-scheduled visit"
;
* followup_location;
label define followup_location
	1 "At Home"
	2 "At School"
	3 Other
;
* followup_means;
label define followup_means
	1 Phone
	2 "In person at school"
	3 "In person at home"
	5 "Don't need a follow up"
	4 Other
;
* followup_purpose;
label define followup_purpose
	1 "Repitching Product & answering client questions"
	2 "Updating LAF"
	3 "Collecting Documents"
	4 "Making appointment"
;
* gender;
label define gender
	0 Male
	1 Female
;
* income;
label define income
	1 "A. Job"
	2 "B. Business"
	3 "C. Other"
;
* interest;
label define interest
	1  "Very interested (wants to do LAF)"
	2  "Probably yes (do follow-up)"
	3  "Probably no (do follow-up"
	4  "Not interested"
	5  "Undecided/Still deciding"
	10 Other
;
* interest_no;
label define interest_no
	1 "Don't need a loan"
	2 "Against religious beliefs"
	3 "Do not trust banks"
	4 "Too risky"
	5 "Service fees too high"
	6 "Need a bigger loan"
	9 "Been advised not to take loan "
	7 "Don't like the fee or collateral terms"
	8 "Other (Specify)"
;
* LAF;
label define LAF
	1 "Started (incomplete)"
	2 "In progress (incomplete)"
	3 Complete
	7 "Sent for approval"
	4 "Not started"
	5 Disbursed
	6 "LAF Rejected"
;
* LAF_1stvisit;
label define LAF_1stvisit
	1 "Started (incomplete)"
	2 "In progress (incomplete)"
	3 Complete
	4 "Not started"
	5 "Sent for approval"
	6 Disbursed
;
* language;
label define language
	1 "A. Urdu"
	2 "B. Sindhi"
	3 "C. Punjabi"
	4 "D. Pashto"
	5 "E. Balochi"
	6 "F. Other"
;
* maritalstatus;
label define maritalstatus
	1 "A. Married"
	2 "B. Unmarried"
	3 "C. Divorced/Separated"
;
* notstarted;
label define notstarted
	1 "Client is undecided"
	2 "Client is not interested"
	3 "Client is not qualified for a loan"
;
* occupation;
label define occupation
	1 "A. Business"
	2 "B. Employed"
;
* ownership;
label define ownership
	1 "A. Personal"
	2 "B. Partnership"
;
* ph_contact_type;
label define ph_contact_type
	1 "Initial Contact"
	2 "Phone Follow-up"
;
* product;
label define product
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
;
* purpose_visit;
label define purpose_visit
	1 "Repitching Product & answering client questions"
	2 "Collecting Documents"
	3 "Updating LAF"
;
* questionnaire_filled_why;
label define questionnaire_filled_why
	1 "School is Shut down"
	2 "Refused to participate"
	3 "Merged with another school"
	4 "School owner/financial decision-maker not available"
	5 "Other (Specify)"
;
* reason_LAF_notstarted;
label define reason_LAF_notstarted
	4 "Need to collect documentation"
	2 "Client is busy"
	3 "Client is not qualified for a loan"
	1 "Client is undecided"
;
* reason_loan;
label define reason_loan
	1 "Construction of new building"
	2 "Maintenance/renovation of building"
	3 "Hiring new/more qualified teachers"
	4 "Teacher Trainings"
	5 "Purchase of better textbooks"
	6 "Investing on teaching aids/lesson plans"
	7 Other
;
* reason_NS;
label define reason_NS
	1 "Client is busy"
	2 "Client needs to collect documentation"
;
* rejection_reasons;
label define rejection_reasons
	1 "CRMU considers high risk"
	2 "ECIB negative"
	3 "Other (Specify)"
;
* relations;
label define relations
	1  Principal
	2  "Head Teacher"
	3  "Teacher or other School Staff"
	4  "Higher-Level School Management"
	5  Spouse
	6  "Other Relative (Not Spouse)"
	7  Friend
	8  "Religious Leader"
	9  Other
	10 "Refused to answer"
;
* residence;
label define residence
	1 "A. Owner"
	2 "B. Tenant "
	3 "C. Shared Accommodation"
	4 "D. Other"
;
* role;
label define role
	1 "School Owner"
	2 Other
	3 "Head Teacher/Principal (Not Owner)"
	4 "Deputy/Acting Head Teacher"
;
* salespitch_complete_no;
label define salespitch_complete_no
	1 "Time conflict (could not stay for entire sales pitch)"
	2 "Not interested in product and stopped sales pitch prematurely"
	3 Other
;
* school_enrolment;
label define school_enrolment
	1 4000
	2 5000
;
* school_name;
label define school_name
	131001443 "Al fajar lycum"
	131001447 "National education school system"
	131000015 "Taleem o tarbiat school system"
	131000016 "The global school of science"
	131000002 "Bright career science high school"
	131000006 "Burhan foundation school"
	132700003 "Quaid bublic middel school"
	135100002 "Oxford model school"
	135400003 "Tamer Millat School"
	136500001 "Al shahab high school"
	137000044 "Bright future public school"
	137000777 "L.A. public model school"
	138400023 "Quaid e azem foundation school"
	139500100 "Farghana educational foundation"
	144800002 "Shayne Islamia Modle High School Ali As that colony Lohianwala"
	145300004 "Top City school"
	146000007 "Nida e islam model high school"
	150000007 "Zohra Public School No.1"
	151300001 "Al bader community model school"
	152000003 "Cambridge School Of Little Scholars"
	152000005 "Cadet of SSAS Rahwali"
	152000009 "Ghazali Public Middle School"
	153700001 "Al badar model school"
	154005003 "Rising star school"
	154600004 "Ghousia divisonal public school"
	154700001 "Ehsan public school"
	155400002 "Ismail muslim high school"
	155801203 "Jannha Modle Scince School"
	156400002 "Brook  Field  Public  School"
	170000001 "Brook field high school"
	171602603 "Al sayyed public school"
	175400001 "Al sadat girls middle school"
	175902006 "Zakarya misali public school"
	186500004 "Umer Public  High School"
	131300001 "Falcon house international school"
	131300010 "Shaheen english public school"
	132700004 "Faisal public school"
	133400002 "Punjab public school"
	133400004 "ZOHAIB PUBLIC SCHOOL"
	133500013 "Bismillah public model school"
	133500014 "DK school system"
	133500022 "Robin hood high school"
	133500023 "Sirat e mustaqeen welfare school system"
	133500024 "St. Wethew trust school"
	133500028 "Faiz mamorial high school"
	135300004 "GMC public school"
	135600001 "Allied school"
	135600002 "Excelence school system"
	135700006 "Saint patrick school"
	138100007 "The knowledge foundation high school"
	141412999 "Hafiz public school"
	143300019 "Pakistan model school"
	143300004 "The education school system"
	143300056 "Iqra grammar high school"
	143300006 "Study science locus school"
	147400004 "Fedral Public Model School"
	155300001 "NATIONAL SCIENCE FOUNDATION HIGH SCHOOL"
	157700001 "Al hameed foundation public school"
	157700002 "Rehman public middle school"
	161900003 "Lal public model shigh school"
	163400002 "Oxford english model school"
	163800120 "Rehman model english middle school"
	164100001 "Zahid public middle school"
	164400001 "Ansari public middle school"
	167700001 "Allama iqbal english medium school"
	173900003 "Bright future Academy"
	178900011 "Quaid e azam public primary school"
	178900002 "Amir foundation"
	184500001 "Al rehan public school"
	184502604 "National English public school"
;
* school_revenue;
label define school_revenue
	1 4000
	2 5000
;
* tenure;
label define tenure
	6  "6 months"
	12 "12 months"
	18 "18 months"
	24 "24 months"
	30 "30 months"
	36 "36 months"
;
* time;
label define time
	1  "Monday morning"
	2  "Monday afternoon"
	3  "Monday evening"
	4  "Tuesday morning"
	5  "Tuesday afternoon"
	6  "Tuesday evening"
	7  "Wednesday morning"
	8  "Wednesday afternoon"
	9  "Wednesday evening"
	10 "Thursday morning"
	11 "Thursday afternoon"
	12 "Thursday evening"
	13 "Friday morning"
	14 "Friday afternoon"
	15 "Friday evening"
	16 "Saturday morning"
	17 "Saturday afternoon"
	18 "Saturday evening"
	19 "Sunday morning"
	20 "Sunday afternoon"
	21 "Sunday evening"
	22 "Other (Specify)"
;
* type_visit;
label define type_visit
	1 "First Visit "
	2 "Follow-up visit "
;
* visit_location;
label define visit_location
	1 "home "
	2 school
	3 "other job "
;
* yes_no;
label define yes_no
	1   Yes
	0   No
	888 "Don't know"
	999 "Refused to answer"
;
* yn;
label define yn
	1 Yes
	0 No
;
* product1;
label define product1
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	2 "Equity  - Kamyab School Qarz"
	1 "Standard Loan - School Qarz"
	2 "Equity  - Kamyab School Qarz"
;
#delimit cr

* Save label information.
label dir
local labs `r(names)'
foreach lab of local labs {
	quietly label list `lab'
	* "nassoc" for "number of associations"
	local nassoc `nassoc' `r(k)'
}

* Import ODK attributes as characteristics.
* - label::urdu will be imported to the characteristic Odk_label_urdu.
* - image::urdu will be imported to the characteristic Odk_image_urdu.

insheet using firstvisit_20151210_results_nonPII.csv, comma nonames clear
local fields
foreach var of varlist _all {
	local field = trim(`var'[1])
	assert `:list sizeof field' == 1
	assert !`:list field in fields'
	local fields : list fields | field
}

insheet using firstvisit_20151210_results_nonPII.csv, comma names case clear
unab all : _all

* starttime
char starttime[Odk_name] starttime
char starttime[Odk_bad_name] 0
char starttime[Odk_long_name] starttime
char starttime[Odk_type] start
char starttime[Odk_or_other] 0
char starttime[Odk_is_other] 0
char starttime[Odk_label_urdu] ????

* endtime
char endtime[Odk_name] endtime
char endtime[Odk_bad_name] 0
char endtime[Odk_long_name] endtime
char endtime[Odk_type] end
char endtime[Odk_or_other] 0
char endtime[Odk_is_other] 0
char endtime[Odk_label_urdu] ??????

* deviceid
char deviceid[Odk_name] deviceid
char deviceid[Odk_bad_name] 0
char deviceid[Odk_long_name] deviceid
char deviceid[Odk_type] deviceid
char deviceid[Odk_or_other] 0
char deviceid[Odk_is_other] 0
char deviceid[Odk_label_urdu] ?????? ?? ?????

* begin group s0

* enumerator_name
char s0enumerator_name[Odk_name] enumerator_name
char s0enumerator_name[Odk_bad_name] 0
char s0enumerator_name[Odk_group] s0
char s0enumerator_name[Odk_long_name] s0-enumerator_name
char s0enumerator_name[Odk_type] select_one enumerator_name
char s0enumerator_name[Odk_list_name] enumerator_name
char s0enumerator_name[Odk_or_other] 0
char s0enumerator_name[Odk_is_other] 0
char s0enumerator_name[Odk_label] 1. RO Name
char s0enumerator_name[Odk_label_urdu] 1? ?? ?? ?? ???
char s0enumerator_name[Odk_required] yes

* area_name
char s0area_name[Odk_name] area_name
char s0area_name[Odk_bad_name] 0
char s0area_name[Odk_group] s0
char s0area_name[Odk_long_name] s0-area_name
char s0area_name[Odk_type] select_one area_name
char s0area_name[Odk_list_name] area_name
char s0area_name[Odk_or_other] 0
char s0area_name[Odk_is_other] 0
char s0area_name[Odk_label] 2. Area Name
char s0area_name[Odk_label_urdu] 2? ????? ?? ???
char s0area_name[Odk_required] yes

* school_name
char s0school_name[Odk_name] school_name
char s0school_name[Odk_bad_name] 0
char s0school_name[Odk_group] s0
char s0school_name[Odk_long_name] s0-school_name
char s0school_name[Odk_type] select_one school_name
char s0school_name[Odk_list_name] school_name
char s0school_name[Odk_or_other] 0
char s0school_name[Odk_is_other] 0
char s0school_name[Odk_label] 3. School Name
char s0school_name[Odk_label_urdu] 3? ???? ?? ???
char s0school_name[Odk_choice_filter] enumerator_name=\${enumerator_name} and area_name=\${area_name}
char s0school_name[Odk_required] yes

* assigned_product
char s0assigned_product[Odk_name] assigned_product
char s0assigned_product[Odk_bad_name] 0
char s0assigned_product[Odk_group] s0
char s0assigned_product[Odk_long_name] s0-assigned_product
char s0assigned_product[Odk_type] select_one product1
char s0assigned_product[Odk_list_name] product1
char s0assigned_product[Odk_or_other] 0
char s0assigned_product[Odk_is_other] 0
char s0assigned_product[Odk_label] "4. This school is assigned: "
char s0assigned_product[Odk_label_urdu] "4? ?? ????  ?? ??? ??? ??: "
char s0assigned_product[Odk_choice_filter] school_name=\${school_name}
char s0assigned_product[Odk_required] yes

* interview_date
char s0interview_date[Odk_name] interview_date
char s0interview_date[Odk_bad_name] 0
char s0interview_date[Odk_group] s0
char s0interview_date[Odk_long_name] s0-interview_date
char s0interview_date[Odk_type] date
char s0interview_date[Odk_or_other] 0
char s0interview_date[Odk_is_other] 0
char s0interview_date[Odk_label] 5. Date of visit
char s0interview_date[Odk_label_urdu] 5? ???? ?? ?????
char s0interview_date[Odk_required] yes

* school_gps
foreach suffix in Latitude Longitude Altitude Accuracy {
	char s0school_gps`suffix'[Odk_name] school_gps
	char s0school_gps`suffix'[Odk_bad_name] 0
	char s0school_gps`suffix'[Odk_group] s0
	char s0school_gps`suffix'[Odk_long_name] s0-school_gps
	char s0school_gps`suffix'[Odk_type] geopoint
	char s0school_gps`suffix'[Odk_geopoint] `suffix'
	char s0school_gps`suffix'[Odk_or_other] 0
	char s0school_gps`suffix'[Odk_is_other] 0
	char s0school_gps`suffix'[Odk_label] 6. School location (`suffix')
	char s0school_gps`suffix'[Odk_label_urdu] 6? ???? ?? ???? ????
	char s0school_gps`suffix'[Odk_required] yes
}

* enrolment_baseline
char s0enrolment_baseline[Odk_name] enrolment_baseline
char s0enrolment_baseline[Odk_bad_name] 0
char s0enrolment_baseline[Odk_group] s0
char s0enrolment_baseline[Odk_long_name] s0-enrolment_baseline
char s0enrolment_baseline[Odk_type] calculate
char s0enrolment_baseline[Odk_or_other] 0
char s0enrolment_baseline[Odk_is_other] 0
char s0enrolment_baseline[Odk_calculation] number(pulldata('enrolmentrevenue_data_round3','enrolment_baseline','schoolcode',\${school_name}))

* revenue_baseline
char s0revenue_baseline[Odk_name] revenue_baseline
char s0revenue_baseline[Odk_bad_name] 0
char s0revenue_baseline[Odk_group] s0
char s0revenue_baseline[Odk_long_name] s0-revenue_baseline
char s0revenue_baseline[Odk_type] calculate
char s0revenue_baseline[Odk_or_other] 0
char s0revenue_baseline[Odk_is_other] 0
char s0revenue_baseline[Odk_calculation] number(pulldata('enrolmentrevenue_data_round3','revenue_baseline','schoolcode',\${school_name}))

* revenue_baseline_120
char s0revenue_baseline_120[Odk_name] revenue_baseline_120
char s0revenue_baseline_120[Odk_bad_name] 0
char s0revenue_baseline_120[Odk_group] s0
char s0revenue_baseline_120[Odk_long_name] s0-revenue_baseline_120
char s0revenue_baseline_120[Odk_type] calculate
char s0revenue_baseline_120[Odk_or_other] 0
char s0revenue_baseline_120[Odk_is_other] 0
char s0revenue_baseline_120[Odk_calculation] number(pulldata('enrolmentrevenue_data_round3','revenue_baseline_120','schoolcode',\${school_name}))

* end group s0

* contact_type
char contact_type[Odk_name] contact_type
char contact_type[Odk_bad_name] 0
char contact_type[Odk_long_name] contact_type
char contact_type[Odk_type] select_one contact_type
char contact_type[Odk_list_name] contact_type
char contact_type[Odk_or_other] 0
char contact_type[Odk_is_other] 0
char contact_type[Odk_label] "7. Is this contact: "
char contact_type[Odk_label_urdu] " 7? ?? ???? ????? ???"
char contact_type[Odk_required] yes

* begin group s01

* introduction_note
char s01introduction_note[Odk_name] introduction_note
char s01introduction_note[Odk_bad_name] 0
char s01introduction_note[Odk_group] s01
char s01introduction_note[Odk_long_name] s01-introduction_note
char s01introduction_note[Odk_type] note
char s01introduction_note[Odk_or_other] 0
char s01introduction_note[Odk_is_other] 0
char s01introduction_note[Odk_label] "8. Introduction:  - Name   - Bank’s Name  "
char s01introduction_note[Odk_label_urdu] "8? ?????  -???? ???  -???? ?? ??? "

* supplement_note
char s01supplement_note[Odk_name] supplement_note
char s01supplement_note[Odk_bad_name] 0
char s01supplement_note[Odk_group] s01
char s01supplement_note[Odk_long_name] s01-supplement_note
char s01supplement_note[Odk_type] note
char s01supplement_note[Odk_or_other] 0
char s01supplement_note[Odk_is_other] 0
char s01supplement_note[Odk_label] "9. **Reminder: CERP’s  Visit**  - CERP team visited in October/November  -  School expressed interest in financing "
char s01supplement_note[Odk_label_urdu] "????? ?? ?????  -??????/????? ??? ??? ???  -????? ?? ??????? ??? ??????  -????? ????? "

* end group s01

* firstvisit_type
char firstvisit_type[Odk_name] firstvisit_type
char firstvisit_type[Odk_bad_name] 0
char firstvisit_type[Odk_long_name] firstvisit_type
char firstvisit_type[Odk_type] select_one firstvisit_type
char firstvisit_type[Odk_list_name] firstvisit_type
char firstvisit_type[Odk_or_other] 0
char firstvisit_type[Odk_is_other] 0
char firstvisit_type[Odk_label] 10. What type of first visit is this?
char firstvisit_type[Odk_label_urdu] ?? ?? ??? ?? ???? ???? ???
char firstvisit_type[Odk_relevant] \${contact_type}='1'
char firstvisit_type[Odk_required] yes

* introduction_note1
char introduction_note1[Odk_name] introduction_note1
char introduction_note1[Odk_bad_name] 0
char introduction_note1[Odk_long_name] introduction_note1
char introduction_note1[Odk_type] note
char introduction_note1[Odk_or_other] 0
char introduction_note1[Odk_is_other] 0
char introduction_note1[Odk_label] "11. Introduce Yourself as Tameer Loan Officer "
char introduction_note1[Odk_label_urdu] "8? ?????  -???? ???  -???? ?? ??? "
char introduction_note1[Odk_relevant] \${firstvisit_type}='2'

* supplement_note1
char supplement_note1[Odk_name] supplement_note1
char supplement_note1[Odk_bad_name] 0
char supplement_note1[Odk_long_name] supplement_note1
char supplement_note1[Odk_type] note
char supplement_note1[Odk_or_other] 0
char supplement_note1[Odk_is_other] 0
char supplement_note1[Odk_label] 12. **Reminder: CERP’s Baseline Visit**  - CERP team visited in October/November - School expressed interest in financing
char supplement_note1[Odk_label_urdu] "????? ?? ?????  ??????/????? ??? ??? ???  ????? ?? ??????? ??? ??????  ????? ????? "
char supplement_note1[Odk_relevant] \${firstvisit_type}='2'

* visit_now
char visit_now[Odk_name] visit_now
char visit_now[Odk_bad_name] 0
char visit_now[Odk_long_name] visit_now
char visit_now[Odk_type] select_one yn
char visit_now[Odk_list_name] yn
char visit_now[Odk_or_other] 0
char visit_now[Odk_is_other] 0
char visit_now[Odk_label] 13. I would like to discuss the loan offer with you in light of your financial needs. Do you have the time to meet right now?
char visit_now[Odk_label_urdu] ?? ?? ???? ??????? ?? ????? ???? ??? ?? ?? ??? ?? ????? ?? ??? ???? ????? ???? ??? ?? ?? ??? ???? ??? ?? ?? ?? ?? ??? ?? ?? ?????
char visit_now[Odk_relevant] \${firstvisit_type}='2'

* begin group s01.a.

* introduction_note2
char s01aintroduction_note2[Odk_name] introduction_note2
char s01aintroduction_note2[Odk_bad_name] 0
char s01aintroduction_note2[Odk_group] s01.a.
char s01aintroduction_note2[Odk_long_name] s01.a.-introduction_note2
char s01aintroduction_note2[Odk_type] note
char s01aintroduction_note2[Odk_or_other] 0
char s01aintroduction_note2[Odk_is_other] 0
char s01aintroduction_note2[Odk_label] "8. Introduction:  - Name   - Bank’s Name  "
char s01aintroduction_note2[Odk_label_urdu] "8? ?????  -???? ???  -???? ?? ??? "
char s01aintroduction_note2[Odk_relevant] \${firstvisit_type}='1'

* supplement_note1
char s01asupplement_note1[Odk_name] supplement_note1
char s01asupplement_note1[Odk_bad_name] 0
char s01asupplement_note1[Odk_group] s01.a.
char s01asupplement_note1[Odk_long_name] s01.a.-supplement_note1
char s01asupplement_note1[Odk_type] note
char s01asupplement_note1[Odk_or_other] 0
char s01asupplement_note1[Odk_is_other] 0
char s01asupplement_note1[Odk_label] 15. **Reminder: CERP’s Baseline Visit**  - CERP team visited in October/November - School expressed interest in financing
char s01asupplement_note1[Odk_label_urdu] "????? ?? ?????  ??????/????? ??? ??? ???  ????? ?? ??????? ??? ??????  ????? ????? "
char s01asupplement_note1[Odk_choice_filter] school_name=\${school_name}
char s01asupplement_note1[Odk_relevant] \${firstvisit_type}='1'

* supplement_note2
char s01asupplement_note2[Odk_name] supplement_note2
char s01asupplement_note2[Odk_bad_name] 0
char s01asupplement_note2[Odk_group] s01.a.
char s01asupplement_note2[Odk_long_name] s01.a.-supplement_note2
char s01asupplement_note2[Odk_type] note
char s01asupplement_note2[Odk_or_other] 0
char s01asupplement_note2[Odk_is_other] 0
char s01asupplement_note2[Odk_label] "**School's financial needs**  - School’s future plan "
char s01asupplement_note2[Odk_label_urdu] **????? ?? ???? ???????**  ????? ?? ??????  ?? ????-

* supplement_note3
char s01asupplement_note3[Odk_name] supplement_note3
char s01asupplement_note3[Odk_bad_name] 0
char s01asupplement_note3[Odk_group] s01.a.
char s01asupplement_note3[Odk_long_name] s01.a.-supplement_note3
char s01asupplement_note3[Odk_type] note
char s01asupplement_note3[Odk_or_other] 0
char s01asupplement_note3[Odk_is_other] 0
char s01asupplement_note3[Odk_label] "**Solution to fill the financial gap**  - Tameer Standard Loan "
char s01asupplement_note3[Odk_label_urdu] "**??????? ?? ??**  ????? ????? ???? -  "
char s01asupplement_note3[Odk_relevant] \${assigned_product}='1'

* supplement_note4
char s01asupplement_note4[Odk_name] supplement_note4
char s01asupplement_note4[Odk_bad_name] 0
char s01asupplement_note4[Odk_group] s01.a.
char s01asupplement_note4[Odk_long_name] s01.a.-supplement_note4
char s01asupplement_note4[Odk_type] note
char s01asupplement_note4[Odk_or_other] 0
char s01asupplement_note4[Odk_is_other] 0
char s01asupplement_note4[Odk_label] "**Solution to fill the financial gap**  - Tameer Equity Loan "
char s01asupplement_note4[Odk_label_urdu] "**??????? ?? ??**  ?????  ??????  ????? ???? -  "
char s01asupplement_note4[Odk_relevant] \${assigned_product}='2'

* supplement_note5
char s01asupplement_note5[Odk_name] supplement_note5
char s01asupplement_note5[Odk_bad_name] 0
char s01asupplement_note5[Odk_group] s01.a.
char s01asupplement_note5[Odk_long_name] s01.a.-supplement_note5
char s01asupplement_note5[Odk_type] note
char s01asupplement_note5[Odk_or_other] 0
char s01asupplement_note5[Odk_is_other] 0
char s01asupplement_note5[Odk_label] Show the tablet to the client
char s01asupplement_note5[Odk_label_urdu] ** ?????? ?? ????? ??????? **

* supplement_note6
char s01asupplement_note6[Odk_name] supplement_note6
char s01asupplement_note6[Odk_bad_name] 0
char s01asupplement_note6[Odk_group] s01.a.
char s01asupplement_note6[Odk_long_name] s01.a.-supplement_note6
char s01asupplement_note6[Odk_type] note
char s01asupplement_note6[Odk_or_other] 0
char s01asupplement_note6[Odk_is_other] 0
char s01asupplement_note6[Odk_label] Features - Tameer School Loan
char s01asupplement_note6[Odk_label_urdu] "**????? ????? ??? ?? ??????? ** "
char s01asupplement_note6[Odk_relevant] \${assigned_product}='1'
char s01asupplement_note6[Odk_image] loan.png
char s01asupplement_note6[Odk_image_urdu] loanurdu.png

* supplement_note8
char s01asupplement_note8[Odk_name] supplement_note8
char s01asupplement_note8[Odk_bad_name] 0
char s01asupplement_note8[Odk_group] s01.a.
char s01asupplement_note8[Odk_long_name] s01.a.-supplement_note8
char s01asupplement_note8[Odk_type] note
char s01asupplement_note8[Odk_or_other] 0
char s01asupplement_note8[Odk_is_other] 0
char s01asupplement_note8[Odk_label] Features - Tameer Successful School Loan
char s01asupplement_note8[Odk_label_urdu] "**????? ?????? ????? ??? ?? ??????? ** "
char s01asupplement_note8[Odk_relevant] \${assigned_product}='2'
char s01asupplement_note8[Odk_image] equity.png
char s01asupplement_note8[Odk_image_urdu] equityurdu.png

* supplement_note9
char s01asupplement_note9[Odk_name] supplement_note9
char s01asupplement_note9[Odk_bad_name] 0
char s01asupplement_note9[Odk_group] s01.a.
char s01asupplement_note9[Odk_long_name] s01.a.-supplement_note9
char s01asupplement_note9[Odk_type] note
char s01asupplement_note9[Odk_or_other] 0
char s01asupplement_note9[Odk_is_other] 0
char s01asupplement_note9[Odk_label] Show client the serviec charges table
char s01asupplement_note9[Odk_label_urdu] ** - ?????? ?? ???? ?? ??? ?? ???  ??  ????  ?? ????? ???????? **

* supplement_note10
char s01asupplement_note10[Odk_name] supplement_note10
char s01asupplement_note10[Odk_bad_name] 0
char s01asupplement_note10[Odk_group] s01.a.
char s01asupplement_note10[Odk_long_name] s01.a.-supplement_note10
char s01asupplement_note10[Odk_type] note
char s01asupplement_note10[Odk_or_other] 0
char s01asupplement_note10[Odk_is_other] 0
char s01asupplement_note10[Odk_label] "Calculating the instalment: - A visit every three months - Average of collected fees and expected fees from the past two months - Compare higher of the two to baseline collected fees "
char s01asupplement_note10[Odk_label_urdu] "**??? ?? ????**  ?? ??? ??? ??? ????? ?? ???  ?? ??? ?? ??? ??? ??? ?????  ??? ?? ????  ??? ??? ??? ?????  ??? ??? ?? ?????  ?? ???? ?? ?????? "

* supplement_note11
char s01asupplement_note11[Odk_name] supplement_note11
char s01asupplement_note11[Odk_bad_name] 0
char s01asupplement_note11[Odk_group] s01.a.
char s01asupplement_note11[Odk_long_name] s01.a.-supplement_note11
char s01asupplement_note11[Odk_type] note
char s01asupplement_note11[Odk_or_other] 0
char s01asupplement_note11[Odk_is_other] 0
char s01asupplement_note11[Odk_label] Hand over the card to the client and answer the client’s questions
char s01asupplement_note11[Odk_label_urdu] **?????? ?? ???? ????? ??? ?????? ?????? ?? ???? ??? **

* calculation_note
char s01acalculation_note[Odk_name] calculation_note
char s01acalculation_note[Odk_bad_name] 0
char s01acalculation_note[Odk_group] s01.a.
char s01acalculation_note[Odk_long_name] s01.a.-calculation_note
char s01acalculation_note[Odk_type] note
char s01acalculation_note[Odk_or_other] 0
char s01acalculation_note[Odk_is_other] 0
char s01acalculation_note[Odk_label] 23. I am going to do some calculations to show you what your instalments may look like over the repayment period based on loan amount, tenure and collateral
char s01acalculation_note[Odk_label_urdu] " ?? ??  ??????  ?? ??? ????? ???????? ?????? ?? ??? ?? ????? ?? ??? ?? ????? ??????? "

* needsloan_amt
char s01aneedsloan_amt[Odk_name] needsloan_amt
char s01aneedsloan_amt[Odk_bad_name] 0
char s01aneedsloan_amt[Odk_group] s01.a.
char s01aneedsloan_amt[Odk_long_name] s01.a.-needsloan_amt
char s01aneedsloan_amt[Odk_type] integer
char s01aneedsloan_amt[Odk_or_other] 0
char s01aneedsloan_amt[Odk_is_other] 0
char s01aneedsloan_amt[Odk_label] 24. What size loan would you want? (Up to 150,000Rs)
char s01aneedsloan_amt[Odk_label_urdu] ?? ???? ??? ???? ????? ??? (150?000 ???? ??)
char s01aneedsloan_amt[Odk_appearance] numbers

* collateral
char s01acollateral[Odk_name] collateral
char s01acollateral[Odk_bad_name] 0
char s01acollateral[Odk_group] s01.a.
char s01acollateral[Odk_long_name] s01.a.-collateral
char s01acollateral[Odk_type] select_one collateral_calc
char s01acollateral[Odk_list_name] collateral_calc
char s01acollateral[Odk_or_other] 0
char s01acollateral[Odk_is_other] 0
char s01acollateral[Odk_label] 25. What collateral would you use?
char s01acollateral[Odk_label_urdu] 4? ?? ????? ????? ??????? ???? ????? ???

* needsloan_tenure
char s01aneedsloan_tenure[Odk_name] needsloan_tenure
char s01aneedsloan_tenure[Odk_bad_name] 0
char s01aneedsloan_tenure[Odk_group] s01.a.
char s01aneedsloan_tenure[Odk_long_name] s01.a.-needsloan_tenure
char s01aneedsloan_tenure[Odk_type] select_one tenure
char s01aneedsloan_tenure[Odk_list_name] tenure
char s01aneedsloan_tenure[Odk_or_other] 0
char s01aneedsloan_tenure[Odk_is_other] 0
char s01aneedsloan_tenure[Odk_label] 26. What loan tenure are you interested in?
char s01aneedsloan_tenure[Odk_label_urdu] 5? ?? ???? ???? ?? ??? ??? ?????? ????? ????

* installment_stdloan_int
char s01ainstallment_stdloan_int[Odk_name] installment_stdloan_int
char s01ainstallment_stdloan_int[Odk_bad_name] 0
char s01ainstallment_stdloan_int[Odk_group] s01.a.
char s01ainstallment_stdloan_int[Odk_long_name] s01.a.-installment_stdloan_int
char s01ainstallment_stdloan_int[Odk_type] calculate
char s01ainstallment_stdloan_int[Odk_or_other] 0
char s01ainstallment_stdloan_int[Odk_is_other] 0
char s01ainstallment_stdloan_int[Odk_calculation] round((\${needsloan_amt}+(\${needsloan_amt}*\${collateral}*(\${needsloan_tenure} div 12))) div (\${needsloan_tenure}),0)

* installment_rcl_low_int
char s01ainstallment_rcl_low_int[Odk_name] installment_rcl_low_int
char s01ainstallment_rcl_low_int[Odk_bad_name] 0
char s01ainstallment_rcl_low_int[Odk_group] s01.a.
char s01ainstallment_rcl_low_int[Odk_long_name] s01.a.-installment_rcl_low_int
char s01ainstallment_rcl_low_int[Odk_type] calculate
char s01ainstallment_rcl_low_int[Odk_or_other] 0
char s01ainstallment_rcl_low_int[Odk_is_other] 0
char s01ainstallment_rcl_low_int[Odk_calculation] round(\${needsloan_amt} div \${needsloan_tenure},0)

* installment_rcl_med_int
char s01ainstallment_rcl_med_int[Odk_name] installment_rcl_med_int
char s01ainstallment_rcl_med_int[Odk_bad_name] 0
char s01ainstallment_rcl_med_int[Odk_group] s01.a.
char s01ainstallment_rcl_med_int[Odk_long_name] s01.a.-installment_rcl_med_int
char s01ainstallment_rcl_med_int[Odk_type] calculate
char s01ainstallment_rcl_med_int[Odk_or_other] 0
char s01ainstallment_rcl_med_int[Odk_is_other] 0
char s01ainstallment_rcl_med_int[Odk_calculation] round((\${needsloan_amt}+(\${needsloan_amt}*\${collateral}*(\${needsloan_tenure} div 12))) div (\${needsloan_tenure}),0)

* installment_rcl_high_int
char s01ainstallment_rcl_high_int[Odk_name] installment_rcl_high_int
char s01ainstallment_rcl_high_int[Odk_bad_name] 0
char s01ainstallment_rcl_high_int[Odk_group] s01.a.
char s01ainstallment_rcl_high_int[Odk_long_name] s01.a.-installment_rcl_high_int
char s01ainstallment_rcl_high_int[Odk_type] calculate
char s01ainstallment_rcl_high_int[Odk_or_other] 0
char s01ainstallment_rcl_high_int[Odk_is_other] 0
char s01ainstallment_rcl_high_int[Odk_calculation] round((\${needsloan_amt}+(\${needsloan_amt}*\${collateral}*(\${needsloan_tenure} div 6))) div (\${needsloan_tenure}),0)

* display_inst_stdloan_int
char s01adisplay_inst_stdloan_int[Odk_name] display_inst_stdloan_int
char s01adisplay_inst_stdloan_int[Odk_bad_name] 0
char s01adisplay_inst_stdloan_int[Odk_group] s01.a.
char s01adisplay_inst_stdloan_int[Odk_long_name] s01.a.-display_inst_stdloan_int
char s01adisplay_inst_stdloan_int[Odk_type] note
char s01adisplay_inst_stdloan_int[Odk_or_other] 0
char s01adisplay_inst_stdloan_int[Odk_is_other] 0
char s01adisplay_inst_stdloan_int[Odk_label] "27. YOUR MONTHLY INSTALLMENT WOULD BE: \${installment_stdloan_int} Rs. "
char s01adisplay_inst_stdloan_int[Odk_label_urdu] ?? ?? ?????? ??? ????: \${installment_stdloan_int} Rs
char s01adisplay_inst_stdloan_int[Odk_relevant] \${assigned_product}='1'

* rcl_states_low
char s01arcl_states_low[Odk_name] rcl_states_low
char s01arcl_states_low[Odk_bad_name] 0
char s01arcl_states_low[Odk_group] s01.a.
char s01arcl_states_low[Odk_long_name] s01.a.-rcl_states_low
char s01arcl_states_low[Odk_type] note
char s01arcl_states_low[Odk_or_other] 0
char s01arcl_states_low[Odk_is_other] 0
char s01arcl_states_low[Odk_label] "28. 1.   LOW installment of Rs. \${installment_rcl_low_int}.  2.   MEDIUM installment of Rs. \${installment_rcl_med_int}.  3.   HIGH installment of Rs. \${installment_rcl_high_int}.  "
char s01arcl_states_low[Odk_relevant] \${assigned_product}= '2'

* salespitch_complete
char s01asalespitch_complete[Odk_name] salespitch_complete
char s01asalespitch_complete[Odk_bad_name] 0
char s01asalespitch_complete[Odk_group] s01.a.
char s01asalespitch_complete[Odk_long_name] s01.a.-salespitch_complete
char s01asalespitch_complete[Odk_type] select_one yn
char s01asalespitch_complete[Odk_list_name] yn
char s01asalespitch_complete[Odk_or_other] 0
char s01asalespitch_complete[Odk_is_other] 0
char s01asalespitch_complete[Odk_label] 29. Did you complete the sales pitch?
char s01asalespitch_complete[Odk_label_urdu] ??? ?? ?? ?????? ?????  ???? ?? ????
char s01asalespitch_complete[Odk_required] yes

* begin group s01.aa.

* salespitch_complete_no
char s01as01aasalespitch_complete_no[Odk_name] salespitch_complete_no
char s01as01aasalespitch_complete_no[Odk_bad_name] 0
char s01as01aasalespitch_complete_no[Odk_group] s01.a. s01.aa.
char s01as01aasalespitch_complete_no[Odk_long_name] s01.a.-s01.aa.-salespitch_complete_no
char s01as01aasalespitch_complete_no[Odk_type] select_one salespitch_complete_no
char s01as01aasalespitch_complete_no[Odk_list_name] salespitch_complete_no
char s01as01aasalespitch_complete_no[Odk_or_other] 0
char s01as01aasalespitch_complete_no[Odk_is_other] 0
char s01as01aasalespitch_complete_no[Odk_label] 30. Why was the sales pitch not completed?
char s01as01aasalespitch_complete_no[Odk_label_urdu] ?????? ????? ???? ???? ???? ??? ????
char s01as01aasalespitch_complete_no[Odk_required] yes

* salespitch_complete_no_other
char s01as01aasalespitch_complete_no_[Odk_name] salespitch_complete_no_other
char s01as01aasalespitch_complete_no_[Odk_bad_name] 0
char s01as01aasalespitch_complete_no_[Odk_group] s01.a. s01.aa.
char s01as01aasalespitch_complete_no_[Odk_long_name] s01.a.-s01.aa.-salespitch_complete_no_other
char s01as01aasalespitch_complete_no_[Odk_type] text
char s01as01aasalespitch_complete_no_[Odk_or_other] 0
char s01as01aasalespitch_complete_no_[Odk_is_other] 0
char s01as01aasalespitch_complete_no_[Odk_label] 31. Other - Please specify
char s01as01aasalespitch_complete_no_[Odk_label_urdu] ???? ?? ????? ????
char s01as01aasalespitch_complete_no_[Odk_relevant] \${salespitch_complete_no}='3'
char s01as01aasalespitch_complete_no_[Odk_required] yes

* begin group s01.aaa.

* interest_no
char s01as01aas01aaainterest_no[Odk_name] interest_no
char s01as01aas01aaainterest_no[Odk_bad_name] 0
char s01as01aas01aaainterest_no[Odk_group] s01.a. s01.aa. s01.aaa.
char s01as01aas01aaainterest_no[Odk_long_name] s01.a.-s01.aa.-s01.aaa.-interest_no
char s01as01aas01aaainterest_no[Odk_type] select_multiple interest_no
char s01as01aas01aaainterest_no[Odk_list_name] interest_no
char s01as01aas01aaainterest_no[Odk_or_other] 0
char s01as01aas01aaainterest_no[Odk_is_other] 0
char s01as01aas01aaainterest_no[Odk_label] 32. Why are you not interested in the product?
char s01as01aas01aaainterest_no[Odk_label_urdu] ?? ?? ?????? ??? ?????? ???? ???? ??????
char s01as01aas01aaainterest_no[Odk_required] yes

* interest_no_other
char s01as01aas01aaainterest_no_other[Odk_name] interest_no_other
char s01as01aas01aaainterest_no_other[Odk_bad_name] 0
char s01as01aas01aaainterest_no_other[Odk_group] s01.a. s01.aa. s01.aaa.
char s01as01aas01aaainterest_no_other[Odk_long_name] s01.a.-s01.aa.-s01.aaa.-interest_no_other
char s01as01aas01aaainterest_no_other[Odk_type] text
char s01as01aas01aaainterest_no_other[Odk_or_other] 0
char s01as01aas01aaainterest_no_other[Odk_is_other] 0
char s01as01aas01aaainterest_no_other[Odk_label] 33. Specify Other
char s01as01aas01aaainterest_no_other[Odk_label_urdu] ???? ?? ????? ????
char s01as01aas01aaainterest_no_other[Odk_relevant] \${interest_no}= '8'
char s01as01aas01aaainterest_no_other[Odk_required] yes

* consult_nointerest
char s01as01aas01aaaconsult_nointeres[Odk_name] consult_nointerest
char s01as01aas01aaaconsult_nointeres[Odk_bad_name] 0
char s01as01aas01aaaconsult_nointeres[Odk_group] s01.a. s01.aa. s01.aaa.
char s01as01aas01aaaconsult_nointeres[Odk_long_name] s01.a.-s01.aa.-s01.aaa.-consult_nointerest
char s01as01aas01aaaconsult_nointeres[Odk_type] select_one yn
char s01as01aas01aaaconsult_nointeres[Odk_list_name] yn
char s01as01aas01aaaconsult_nointeres[Odk_or_other] 0
char s01as01aas01aaaconsult_nointeres[Odk_is_other] 0
char s01as01aas01aaaconsult_nointeres[Odk_label] 34. Do you need to consult someone before making a decision?
char s01as01aas01aaaconsult_nointeres[Odk_label_urdu] ??? ?? ?? ????? ???? ?? ???? ??? ?? ????? ???? ?? ????? ???

* relation_decision_nointerest
char s01as01aas01aaarelation_decision[Odk_name] relation_decision_nointerest
char s01as01aas01aaarelation_decision[Odk_bad_name] 0
char s01as01aas01aaarelation_decision[Odk_group] s01.a. s01.aa. s01.aaa.
char s01as01aas01aaarelation_decision[Odk_long_name] s01.a.-s01.aa.-s01.aaa.-relation_decision_nointerest
char s01as01aas01aaarelation_decision[Odk_type] select_multiple relations
char s01as01aas01aaarelation_decision[Odk_list_name] relations
char s01as01aas01aaarelation_decision[Odk_or_other] 0
char s01as01aas01aaarelation_decision[Odk_is_other] 0
char s01as01aas01aaarelation_decision[Odk_label] 35. What is your relation to the person you want to consult?
char s01as01aas01aaarelation_decision[Odk_label_urdu] ?? ?? ??? ??? ?? ??? ???? ?? ?? ?? ?? ????? ???? ????? ????
char s01as01aas01aaarelation_decision[Odk_relevant] \${consult_nointerest}='1'
char s01as01aas01aaarelation_decision[Odk_required] yes

* relation_noint_other
char s01as01aas01aaarelation_noint_ot[Odk_name] relation_noint_other
char s01as01aas01aaarelation_noint_ot[Odk_bad_name] 0
char s01as01aas01aaarelation_noint_ot[Odk_group] s01.a. s01.aa. s01.aaa.
char s01as01aas01aaarelation_noint_ot[Odk_long_name] s01.a.-s01.aa.-s01.aaa.-relation_noint_other
char s01as01aas01aaarelation_noint_ot[Odk_type] text
char s01as01aas01aaarelation_noint_ot[Odk_or_other] 0
char s01as01aas01aaarelation_noint_ot[Odk_is_other] 0
char s01as01aas01aaarelation_noint_ot[Odk_label] 36. Other - Please Specify
char s01as01aas01aaarelation_noint_ot[Odk_relevant] \${relation_decision_nointerest}='9'

* end group s01.aaa.
* end group s01.aa.

* begin group s01.b.

* interest_pitchcomp
char s01as01binterest_pitchcomp[Odk_name] interest_pitchcomp
char s01as01binterest_pitchcomp[Odk_bad_name] 0
char s01as01binterest_pitchcomp[Odk_group] s01.a. s01.b.
char s01as01binterest_pitchcomp[Odk_long_name] s01.a.-s01.b.-interest_pitchcomp
char s01as01binterest_pitchcomp[Odk_type] select_one interest
char s01as01binterest_pitchcomp[Odk_list_name] interest
char s01as01binterest_pitchcomp[Odk_or_other] 0
char s01as01binterest_pitchcomp[Odk_is_other] 0
char s01as01binterest_pitchcomp[Odk_label] 37. What was client's reaction to the product?
char s01as01binterest_pitchcomp[Odk_label_urdu] ?????? ?? ??? ?????? ?? ???? ??? ??? ????
char s01as01binterest_pitchcomp[Odk_required] yes

* begin group s01b.a.

* consult_pitchcomp
char s01as01bs01baconsult_pitchcomp[Odk_name] consult_pitchcomp
char s01as01bs01baconsult_pitchcomp[Odk_bad_name] 0
char s01as01bs01baconsult_pitchcomp[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01baconsult_pitchcomp[Odk_long_name] s01.a.-s01.b.-s01b.a.-consult_pitchcomp
char s01as01bs01baconsult_pitchcomp[Odk_type] select_one yn
char s01as01bs01baconsult_pitchcomp[Odk_list_name] yn
char s01as01bs01baconsult_pitchcomp[Odk_or_other] 0
char s01as01bs01baconsult_pitchcomp[Odk_is_other] 0
char s01as01bs01baconsult_pitchcomp[Odk_label] 38. Do you need to consult someone before making a decision?
char s01as01bs01baconsult_pitchcomp[Odk_label_urdu] 1? ??? ?? ?? ????? ???? ?? ???? ??? ?? ????? ???? ?? ????? ???

* relation_decision_interest
char s01as01bs01barelation_decision_i[Odk_name] relation_decision_interest
char s01as01bs01barelation_decision_i[Odk_bad_name] 0
char s01as01bs01barelation_decision_i[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01barelation_decision_i[Odk_long_name] s01.a.-s01.b.-s01b.a.-relation_decision_interest
char s01as01bs01barelation_decision_i[Odk_type] select_multiple relations
char s01as01bs01barelation_decision_i[Odk_list_name] relations
char s01as01bs01barelation_decision_i[Odk_or_other] 0
char s01as01bs01barelation_decision_i[Odk_is_other] 0
char s01as01bs01barelation_decision_i[Odk_label] 39. What is your relation to the person you want to consult?
char s01as01bs01barelation_decision_i[Odk_label_urdu] 2? ?? ?? ??? ??? ?? ??? ???? ?? ?? ?? ?? ????? ???? ????? ????
char s01as01bs01barelation_decision_i[Odk_relevant] \${consult_pitchcomp}='1'
char s01as01bs01barelation_decision_i[Odk_required] yes

* relation_noint_other
char s01as01bs01barelation_noint_othe[Odk_name] relation_noint_other
char s01as01bs01barelation_noint_othe[Odk_bad_name] 0
char s01as01bs01barelation_noint_othe[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01barelation_noint_othe[Odk_long_name] s01.a.-s01.b.-s01b.a.-relation_noint_other
char s01as01bs01barelation_noint_othe[Odk_type] text
char s01as01bs01barelation_noint_othe[Odk_or_other] 0
char s01as01bs01barelation_noint_othe[Odk_is_other] 0
char s01as01bs01barelation_noint_othe[Odk_label] 40. Other - Please Specify
char s01as01bs01barelation_noint_othe[Odk_relevant] \${relation_decision_interest}='9'

* LAF
char s01as01bs01baLAF[Odk_name] LAF
char s01as01bs01baLAF[Odk_bad_name] 0
char s01as01bs01baLAF[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01baLAF[Odk_long_name] s01.a.-s01.b.-s01b.a.-LAF
char s01as01bs01baLAF[Odk_type] select_one LAF
char s01as01bs01baLAF[Odk_list_name] LAF
char s01as01bs01baLAF[Odk_or_other] 0
char s01as01bs01baLAF[Odk_is_other] 0
char s01as01bs01baLAF[Odk_label] 41. What is the status of LAF?
char s01as01bs01baLAF[Odk_label_urdu] ??? ?? ??? ?? ????? ??? ???
char s01as01bs01baLAF[Odk_required] yes

* LAF_notstarted
char s01as01bs01baLAF_notstarted[Odk_name] LAF_notstarted
char s01as01bs01baLAF_notstarted[Odk_bad_name] 0
char s01as01bs01baLAF_notstarted[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01baLAF_notstarted[Odk_long_name] s01.a.-s01.b.-s01b.a.-LAF_notstarted
char s01as01bs01baLAF_notstarted[Odk_type] select_one reason_LAF_notstarted
char s01as01bs01baLAF_notstarted[Odk_list_name] reason_LAF_notstarted
char s01as01bs01baLAF_notstarted[Odk_or_other] 0
char s01as01bs01baLAF_notstarted[Odk_is_other] 0
char s01as01bs01baLAF_notstarted[Odk_label] 42. Why has the LAF not started?
char s01as01bs01baLAF_notstarted[Odk_label_urdu] ??? ?? ??? ?? ???? ???? ???? ??? ???
char s01as01bs01baLAF_notstarted[Odk_relevant] \${LAF}='4'
char s01as01bs01baLAF_notstarted[Odk_required] yes

* LAF_rejected
char s01as01bs01baLAF_rejected[Odk_name] LAF_rejected
char s01as01bs01baLAF_rejected[Odk_bad_name] 0
char s01as01bs01baLAF_rejected[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01baLAF_rejected[Odk_long_name] s01.a.-s01.b.-s01b.a.-LAF_rejected
char s01as01bs01baLAF_rejected[Odk_type] text
char s01as01bs01baLAF_rejected[Odk_or_other] 0
char s01as01bs01baLAF_rejected[Odk_is_other] 0
char s01as01bs01baLAF_rejected[Odk_label] Why was the LAF rejected?
char s01as01bs01baLAF_rejected[Odk_label_urdu] ??? ?? ??? LAF ???? ????? ?? ??? ????
char s01as01bs01baLAF_rejected[Odk_relevant] \${LAF} = '6'

* LAF_notstarted_why
char s01as01bs01baLAF_notstarted_why[Odk_name] LAF_notstarted_why
char s01as01bs01baLAF_notstarted_why[Odk_bad_name] 0
char s01as01bs01baLAF_notstarted_why[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01baLAF_notstarted_why[Odk_long_name] s01.a.-s01.b.-s01b.a.-LAF_notstarted_why
char s01as01bs01baLAF_notstarted_why[Odk_type] text
char s01as01bs01baLAF_notstarted_why[Odk_or_other] 0
char s01as01bs01baLAF_notstarted_why[Odk_is_other] 0
char s01as01bs01baLAF_notstarted_why[Odk_label] Why is the client not qualified to take out a loan?
char s01as01bs01baLAF_notstarted_why[Odk_label_urdu] ?????? ???? ??? ???? ?? ??? ???? ???
char s01as01bs01baLAF_notstarted_why[Odk_relevant] \${LAF_notstarted} = '3'

* date_approval
char s01as01bs01badate_approval[Odk_name] date_approval
char s01as01bs01badate_approval[Odk_bad_name] 0
char s01as01bs01badate_approval[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01badate_approval[Odk_long_name] s01.a.-s01.b.-s01b.a.-date_approval
char s01as01bs01badate_approval[Odk_type] date
char s01as01bs01badate_approval[Odk_or_other] 0
char s01as01bs01badate_approval[Odk_is_other] 0
char s01as01bs01badate_approval[Odk_label] 43. When will the form be sent for approval?
char s01as01bs01badate_approval[Odk_label_urdu] ???? ?? ?????? ?? ??? ????? ???? ???
char s01as01bs01badate_approval[Odk_relevant] \${LAF}='3'

* cnic
char s01as01bs01bacnic[Odk_name] cnic
char s01as01bs01bacnic[Odk_bad_name] 0
char s01as01bs01bacnic[Odk_group] s01.a. s01.b. s01b.a.
char s01as01bs01bacnic[Odk_long_name] s01.a.-s01.b.-s01b.a.-cnic
char s01as01bs01bacnic[Odk_type] text
char s01as01bs01bacnic[Odk_or_other] 0
char s01as01bs01bacnic[Odk_is_other] 0
char s01as01bs01bacnic[Odk_label] 44. What is your CNIC?
char s01as01bs01bacnic[Odk_label_urdu] ?? ?? ??????????? ?????? ???? ???? ??? ???
char s01as01bs01bacnic[Odk_constraint] string-length(.)=13
char s01as01bs01bacnic[Odk_required] yes
char s01as01bs01bacnic[Odk_appearance] numbers

* end group s01b.a.

* begin group s01.b.b.

* interest_no1
char s01as01bs01bbinterest_no1[Odk_name] interest_no1
char s01as01bs01bbinterest_no1[Odk_bad_name] 0
char s01as01bs01bbinterest_no1[Odk_group] s01.a. s01.b. s01.b.b.
char s01as01bs01bbinterest_no1[Odk_long_name] s01.a.-s01.b.-s01.b.b.-interest_no1
char s01as01bs01bbinterest_no1[Odk_type] select_multiple interest_no
char s01as01bs01bbinterest_no1[Odk_list_name] interest_no
char s01as01bs01bbinterest_no1[Odk_or_other] 0
char s01as01bs01bbinterest_no1[Odk_is_other] 0
char s01as01bs01bbinterest_no1[Odk_label] 45. Why are you not interested in the product?
char s01as01bs01bbinterest_no1[Odk_label_urdu] 1? ?? ?? ?????? ??? ?????? ???? ???? ??????
char s01as01bs01bbinterest_no1[Odk_required] yes

* interest_no_other1
char s01as01bs01bbinterest_no_other1[Odk_name] interest_no_other1
char s01as01bs01bbinterest_no_other1[Odk_bad_name] 0
char s01as01bs01bbinterest_no_other1[Odk_group] s01.a. s01.b. s01.b.b.
char s01as01bs01bbinterest_no_other1[Odk_long_name] s01.a.-s01.b.-s01.b.b.-interest_no_other1
char s01as01bs01bbinterest_no_other1[Odk_type] text
char s01as01bs01bbinterest_no_other1[Odk_or_other] 0
char s01as01bs01bbinterest_no_other1[Odk_is_other] 0
char s01as01bs01bbinterest_no_other1[Odk_label] 46. Specify Other
char s01as01bs01bbinterest_no_other1[Odk_label_urdu] 2? ???? ?? ????? ????
char s01as01bs01bbinterest_no_other1[Odk_relevant] \${interest_no1}= '8'

* consult_nointpc
char s01as01bs01bbconsult_nointpc[Odk_name] consult_nointpc
char s01as01bs01bbconsult_nointpc[Odk_bad_name] 0
char s01as01bs01bbconsult_nointpc[Odk_group] s01.a. s01.b. s01.b.b.
char s01as01bs01bbconsult_nointpc[Odk_long_name] s01.a.-s01.b.-s01.b.b.-consult_nointpc
char s01as01bs01bbconsult_nointpc[Odk_type] select_one yn
char s01as01bs01bbconsult_nointpc[Odk_list_name] yn
char s01as01bs01bbconsult_nointpc[Odk_or_other] 0
char s01as01bs01bbconsult_nointpc[Odk_is_other] 0
char s01as01bs01bbconsult_nointpc[Odk_label] 47. Do you need to consult someone before making a decision?
char s01as01bs01bbconsult_nointpc[Odk_label_urdu] 3? ??? ?? ?? ????? ???? ?? ???? ??? ?? ????? ???? ?? ????? ???

* relation_decision_noint
char s01as01bs01bbrelation_decision_n[Odk_name] relation_decision_noint
char s01as01bs01bbrelation_decision_n[Odk_bad_name] 0
char s01as01bs01bbrelation_decision_n[Odk_group] s01.a. s01.b. s01.b.b.
char s01as01bs01bbrelation_decision_n[Odk_long_name] s01.a.-s01.b.-s01.b.b.-relation_decision_noint
char s01as01bs01bbrelation_decision_n[Odk_type] select_multiple relations
char s01as01bs01bbrelation_decision_n[Odk_list_name] relations
char s01as01bs01bbrelation_decision_n[Odk_or_other] 0
char s01as01bs01bbrelation_decision_n[Odk_is_other] 0
char s01as01bs01bbrelation_decision_n[Odk_label] 48. What is your relation to the person you want to consult?
char s01as01bs01bbrelation_decision_n[Odk_label_urdu] 4? ?? ?? ??? ??? ?? ??? ???? ?? ?? ?? ?? ????? ???? ????? ????
char s01as01bs01bbrelation_decision_n[Odk_relevant] \${consult_nointpc}='1'
char s01as01bs01bbrelation_decision_n[Odk_required] yes

* relation_decision_noint_other
* Duplicate variable name with s01.a.-s01.b.-s01.b.b.-relation_decision_noint
local pos : list posof "s01.a.-s01.b.-s01.b.b.-relation_decision_noint_other" in fields
local var : word `pos' of `all'
char `var'[Odk_name] relation_decision_noint_other
char `var'[Odk_bad_name] 1
char `var'[Odk_group] s01.a. s01.b. s01.b.b.
char `var'[Odk_long_name] s01.a.-s01.b.-s01.b.b.-relation_decision_noint_other
char `var'[Odk_type] text
char `var'[Odk_or_other] 0
char `var'[Odk_is_other] 0
char `var'[Odk_label] 49. Other - Please Specify
char `var'[Odk_relevant] \${relation_decision_noint}='9'

* end group s01.b.b.
* end group s01.b.
* end group s01.a.

* respondent_name
char respondent_name[Odk_name] respondent_name
char respondent_name[Odk_bad_name] 0
char respondent_name[Odk_long_name] respondent_name
char respondent_name[Odk_type] text
char respondent_name[Odk_or_other] 0
char respondent_name[Odk_is_other] 0
char respondent_name[Odk_label] 50. Name of respondent (full name as  given on CNIC)
char respondent_name[Odk_label_urdu] "???? ????? ?? ???? ??? (???? ?? ???? ?????? ???? ??? ??? ??) "
char respondent_name[Odk_required] yes

* respondent_role
char respondent_role[Odk_name] respondent_role
char respondent_role[Odk_bad_name] 0
char respondent_role[Odk_long_name] respondent_role
char respondent_role[Odk_type] select_one role
char respondent_role[Odk_list_name] role
char respondent_role[Odk_or_other] 0
char respondent_role[Odk_is_other] 0
char respondent_role[Odk_label] 51. Relationship of respondent to school
char respondent_role[Odk_label_urdu] ???? ????? ?? ???? ?? ????
char respondent_role[Odk_required] yes

* respondent_role_other
char respondent_role_other[Odk_name] respondent_role_other
char respondent_role_other[Odk_bad_name] 0
char respondent_role_other[Odk_long_name] respondent_role_other
char respondent_role_other[Odk_type] text
char respondent_role_other[Odk_or_other] 0
char respondent_role_other[Odk_is_other] 0
char respondent_role_other[Odk_label] 52. Specify other
char respondent_role_other[Odk_label_urdu] ???? ?? ????? ????
char respondent_role_other[Odk_relevant] \${respondent_role} = '2'

* followup_time
char followup_time[Odk_name] followup_time
char followup_time[Odk_bad_name] 0
char followup_time[Odk_long_name] followup_time
char followup_time[Odk_type] dateTime
char followup_time[Odk_or_other] 0
char followup_time[Odk_is_other] 0
char followup_time[Odk_label] 53. I would like to confirm a date and time with you to discuss the loan offer further. When are you available?
char followup_time[Odk_label_urdu] 5? ???? ?? ?? ??? ??? ?? ?? ??? ??? ????? ?? ????? ???? ????? ??? ?? ?? ?????? ??? ???
char followup_time[Odk_hint] RO: If the respondent is not interested, DO NOT ask this question. Note a tentative follow up date.

* followup_number
char followup_number[Odk_name] followup_number
char followup_number[Odk_bad_name] 0
char followup_number[Odk_long_name] followup_number
char followup_number[Odk_type] text
char followup_number[Odk_or_other] 0
char followup_number[Odk_is_other] 0
char followup_number[Odk_label] 54. What is the best phone number to reach you at?
char followup_number[Odk_label_urdu] ?? ?? ?? ???? ?? ????? ???? ?? ?? ????? ???
char followup_number[Odk_constraint] string-length(.)=11
char followup_number[Odk_required] yes
char followup_number[Odk_appearance] numbers

* school_gps
foreach suffix in Latitude Longitude Altitude Accuracy {
	char school_gps`suffix'[Odk_name] school_gps
	char school_gps`suffix'[Odk_bad_name] 0
	char school_gps`suffix'[Odk_long_name] school_gps
	char school_gps`suffix'[Odk_type] geopoint
	char school_gps`suffix'[Odk_geopoint] `suffix'
	char school_gps`suffix'[Odk_or_other] 0
	char school_gps`suffix'[Odk_is_other] 0
	char school_gps`suffix'[Odk_label] 55. School location (`suffix')
	char school_gps`suffix'[Odk_label_urdu] ???? ?? ???? ????
}

* Rename any variable names that are difficult for -split-.
// rename ...

* Split select_multiple variables.
ds, has(char Odk_type)
foreach typevar in `r(varlist)' {
	if strmatch("`:char `typevar'[Odk_type]'", "select_multiple *") & ///
		!`:char `typevar'[Odk_is_other]' {
		* Add an underscore to the variable name if it ends in a number.
		local var `typevar'
		local list : char `var'[Odk_list_name]
		local pos : list posof "`list'" in labs
		local nparts : word `pos' of `nassoc'
		if `:list list in otherlabs' & !`:char `var'[Odk_or_other]' ///
			local --nparts
		if inrange(substr("`var'", -1, 1), "0", "9") & ///
			length("`var'") < 32 - strlen("`nparts'") {
			numlist "1/`nparts'"
			local splitvars " `r(numlist)'"
			local splitvars : subinstr local splitvars " " " `var'_", all
			capture confirm new variable `var'_ `splitvars'
			if !_rc {
				rename `var' `var'_
				local var `var'_
			}
		}

		capture confirm numeric variable `var', exact
		if !_rc ///
			tostring `var', replace format(%24.0g)
		split `var'
		local parts `r(varlist)'
		local next = `r(nvars)' + 1
		destring `parts', replace

		forvalues i = `next'/`nparts' {
			local newvar `var'`i'
			generate byte `newvar' = .
			local parts : list parts | newvar
		}

		local chars : char `var'[]
		local label : char `var'[Odk_label]
		local len : length local label
		local i 0
		foreach part of local parts {
			local ++i

			foreach char of local chars {
				mata: st_global("`part'[`char']", st_global("`var'[`char']"))
			}

			if `len' {
				mata: st_global("`part'[Odk_label]", st_local("label") + ///
					(substr(st_local("label"), -1, 1) == " " ? "" : " ") + ///
					"(#`i'/`nparts')")
			}

			move `part' `var'
		}

		drop `var'
	}
}

* Drop note variables.
ds, has(char Odk_type)
foreach var in `r(varlist)' {
	if "`:char `var'[Odk_type]'" == "note" ///
		drop `var'
}

* Date and time variables
capture confirm variable SubmissionDate, exact
if !_rc {
	local type : char SubmissionDate[Odk_type]
	assert !`:length local type'
	char SubmissionDate[Odk_type] datetime
}
local datetime date today time datetime start end
tempvar temp
ds, has(char Odk_type)
foreach var in `r(varlist)' {
	local type : char `var'[Odk_type]
	if `:list type in datetime' {
		capture confirm numeric variable `var'
		if !_rc {
			tostring `var', replace
			replace `var' = "" if `var' == "."
		}

		if inlist("`type'", "date", "today") {
			local fcn    date
			local mask   datemask
			local format %tdMon_dd,_CCYY
		}
		else if "`type'" == "time" {
			local fcn    clock
			local mask   timemask
			local format %tchh:MM:SS_AM
		}
		else if inlist("`type'", "datetime", "start", "end") {
			local fcn    clock
			local mask   datetimemask
			local format %tcMon_dd,_CCYY_hh:MM:SS_AM
		}
		generate double `temp' = `fcn'(`var', "``mask''")
		format `temp' `format'
		count if missing(`temp') & !missing(`var')
		if r(N) {
			display as err "{p}"
			display as err "`type' variable `var'"
			if "`repeat'" != "" ///
				display as err "in repeat group `repeat'"
			display as err "could not be converted using the mask ``mask''"
			display as err "{p_end}"
			exit 9
		}

		move `temp' `var'
		foreach char in `:char `var'[]' {
			mata: st_global("`temp'[`char']", st_global("`var'[`char']"))
		}
		drop `var'
		rename `temp' `var'
	}
}
capture confirm variable SubmissionDate, exact
if !_rc ///
	char SubmissionDate[Odk_type]

* Encode fields whose list contains a noninteger name.
local lists collateral_calc
tempvar temp
ds, has(char Odk_list_name)
foreach var in `r(varlist)' {
	local list : char `var'[Odk_list_name]
	if `:list list in lists' & !`:char `var'[Odk_is_other]' {
		capture confirm numeric variable `var'
		if !_rc {
			tostring `var', replace format(%24.0g)
			if !`:list list in sysmisslabs' ///
				replace `var' = "" if `var' == "."
		}
		generate `temp' = `var'

		* collateral_calc
		if "`list'" == "collateral_calc" {
			replace `temp' = "Gold"                    if `var' == "0.1"
			replace `temp' = "Property"                if `var' == "0.15"
			replace `temp' = "Two personal guarantors" if `var' == "0.2"
		}

		replace `var' = `temp'
		drop `temp'
		encode `var', gen(`temp') label(`list') noextend
		move `temp' `var'
		foreach char in `:char `var'[]' {
			mata: st_global("`temp'[`char']", st_global("`var'[`char']"))
		}
		drop `var'
		rename `temp' `var'
	}
}

* Attach value labels.
ds, not(vallab)
if "`r(varlist)'" != "" ///
	ds `r(varlist)', has(char Odk_list_name)
foreach var in `r(varlist)' {
	if !`:char `var'[Odk_is_other]' {
		capture confirm string variable `var', exact
		if !_rc {
			replace `var' = ".o" if `var' == "other"
			destring `var', replace
		}

		local list : char `var'[Odk_list_name]
		if !`:list list in labs' {
			display as err "list `list' not found in choices sheet"
			exit 9
		}
		label values `var' `list'
	}
}

* Attach field labels as variable labels and notes.
ds, has(char Odk_long_name)
foreach var in `r(varlist)' {
	* Variable label
	local label : char `var'[Odk_label]
	mata: st_varlabel("`var'", st_local("label"))

	* Notes
	if `:length local label' {
		char `var'[note0] 1
		mata: st_global("`var'[note1]", "Question text: " + ///
			st_global("`var'[Odk_label]"))
		mata: st_local("temp", ///
			" " * (strlen(st_global("`var'[note1]")) + 1))
		#delimit ;
		local fromto
			{			"`temp'"
			}			"{c )-}"
			"`temp'"	"{c -(}"
			'			"{c 39}"
			"`"			"{c 'g}"
			"$"			"{c S|}"
		;
		#delimit cr
		while `:list sizeof fromto' {
			gettoken from fromto : fromto
			gettoken to   fromto : fromto
			mata: st_global("`var'[note1]", ///
				subinstr(st_global("`var'[note1]"), "`from'", "`to'", .))
		}
	}
}

local repeats `"`repeats' """'

local badnames
ds, has(char Odk_bad_name)
foreach var in `r(varlist)' {
	if `:char `var'[Odk_bad_name]' & ///
		("`:char `var'[Odk_type]'" != "begin repeat" | ///
		("`repeat'" != "" & ///
		"`:char `var'[Odk_name]'" == "SET-OF-`repeat'")) {
		local badnames : list badnames | var
	}
}
local allbadnames `"`allbadnames' "`badnames'""'

ds, not(char Odk_name)
local datanotform `r(varlist)'
local exclude SubmissionDate KEY PARENT_KEY metainstanceID
local datanotform : list datanotform - exclude
local alldatanotform `"`alldatanotform' "`datanotform'""'

compress

local dta `""firstvisit_20151210_results_nonPII""'
save `dta', replace
local dtas : list dtas | dta

capture mata: mata drop `values' `text'

set varabbrev `varabbrev'

* Display warning messages.
quietly {
	noisily display

	#delimit ;
	local problems
		allbadnames
			"The following variables' names differ from their field names,
			which could not be {cmd:insheet}ed:"
		alldatanotform
			"The following variables appear in the data but not the form:"
	;
	#delimit cr
	while `:list sizeof problems' {
		gettoken local problems : problems
		gettoken desc  problems : problems

		local any 0
		foreach vars of local `local' {
			local any = `any' | `:list sizeof vars'
		}
		if `any' {
			noisily display as txt "{p}`desc'{p_end}"
			noisily display "{p2colset 0 34 0 2}"
			noisily display as txt "{p2col:repeat group}variable name{p_end}"
			noisily display as txt "{hline 65}"

			forvalues i = 1/`:list sizeof repeats' {
				local repeat : word `i' of `repeats'
				local vars   : word `i' of ``local''

				foreach var of local vars {
					noisily display as res "{p2col:`repeat'}`var'{p_end}"
				}
			}

			noisily display as txt "{hline 65}"
			noisily display "{p2colreset}"
		}
	}
}
