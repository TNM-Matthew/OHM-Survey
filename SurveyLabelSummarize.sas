/* SurveyLabelSummarize.sas */
/* Generated Code (IMPORT) */
/* Source File: SurveyResults.xlsx */
/* Source Path: /folders/myfolders */
/* Code generated on: Thursday, October 29, 2015 8:17:57 PM */

%web_drop_table(WEBWORK.SURVEY);


FILENAME REFFILE "/folders/myfolders/SurveyResultsCSV.csv" TERMSTR=CR;

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WEBWORK.SURVEY;
	GETNAMES=YES;
RUN;

data WEBWORK.SURVEY;
set WEBWORK.SURVEY;
LABEL Q1 = "Q1: How long have you been coming to the Night Ministry Bus? ";
LABEL Q2 = "Q2: How many nights in a month do you visit the Bus";
LABEL Q3 = "Q3: How much time does it take you to travel to TNM bus stop?";
LABEL Q5 = "Q5: Did you or will you receive food tonight at the Bus?";
LABEL Q5a = "Q5a: Which of the following statements best describes your food intake today? Would you say that:";
LABEL Q6 = "Q6: In the last year, have you been referred by Bus staff or volunteers to another service provider, such as a health clinic or clothing closet or somewhere else?  ";
LABEL Q7 = "Q7: How often do you feel that you lack companionship/friendship?";
LABEL Q8 = "Q8: How often do you feel left out?";
LABEL Q9 = "Q9: How often do you feel isolated from others?";
LABEL Q10 = "Q10:  You feel like people accept you for who you are at the Bus.";
LABEL Q11 = "Q11: You have meaningful interactions at the Bus.";
LABEL Q12 = "Q12: Relationships you have formed at the Bus have led to new opportunities.";
LABEL Q13 = "Q13: You have a sense of togetherness with other people that visit the Bus.";
LABEL Q14 = "Q14: You are more aware of what is available to you because of the Bus, yes or no?";
LABEL Q15 = "Q15: Would you say that you trust people who work at the Bus?";
LABEL Q16 = "Q16: Would you say that people who work at the Bus care and have your best interests at heart?";
LABEL Q17 = "Q17: You take advice from people who work at the Bus…";
LABEL Q18 = "Q18: People who work at the Bus look out for you…";
LABEL Q19 = "Q19: People who work at the Bus care what happens to you…";
LABEL Q20 = "Q20: How often do you attend church or other religious meetings?";
LABEL Q21 = "Q21: How often do you spend time in private religious activities such as prayer, mediation, or Bible study?";
LABEL Q22 = "Q22: In my life, I experience the presence of the Divine (i.e. God)?";
LABEL Q23 = "Q23: My religious beliefs are what really lie behind my whole approach to life.";
LABEL Q24 = "Q24: How would you rate your overall health?";
LABEL Q26 = "Q26: Do you have a regular place you go to for health care?";
LABEL Q27 = "Q27: Where do you go to receive your Health Care?";
LABEL Q28 = "Q28: Are you aware there is a nurse available on The Night Ministry Bus?";
LABEL Q29 = "Q29: Have you visited with a nurse on The Night Ministry Bus in the past 12 months?";
LABEL Q29a = "Q29a: Where would you go for health care if the bus was not here?";
LABEL Q30 = "Q30: Which gender/sex do you identify with?";
LABEL Q31 = "Q31: What is your sexual orientation?";
LABEL Q32 = "Q32: What is your age group?";
LABEL Q33 = "Q33: What is your ethnicity?";
LABEL Q33a = "Q33a: If Hispanic/Latino, which of the following do you identify as:";
LABEL Q34 = "Q34: Which race do you best identify with?  (Check all that apply. If multiracial, please specify which races.)";
LABEL Q35 = "Q35: Please indicate your current housing situation:";
LABEL Q35a = "Q35a: From the housing option you selected, please indicate which housing status best applies to you:";
LABEL Q36 = "Q36: How many residents occupy your housing situation (Participant counts as 1)?";

run;

PROC CONTENTS DATA=WEBWORK.SURVEY; RUN;


proc format;	
 VALUE Q1f 1 = "Less than one month" 2 = "1 to 6 months" 3 = "7 months to a year" 4 = "1 to 5 years" 5 = "5 to 10 years" 6 = "10+ years" 9999 = "Skip";
 VALUE Q2f 1 = "1 night a month" 2 = "2 to 4 nights a month2" 3 = "5 to 8 nights a month" 4 = "More than 8 nights a month" 9999 = "Skip";
 VALUE Q3f 1 = "Less than 10 minutes" 2 = "10-30 minutes" 3 = "30 minutes – 1 hour" 4 = "More than 1 hour";
 VALUE Q5f 1 = "Yes" 2 = "No" 9999 = "Skip";
 VALUE Q5af 1 = "The food from the Bus was the only food you ate today" 2 = "You ate other food today, but not enough" 3 = "You ate enough food today before coming to the Bus" 9999 = "Skip";
 VALUE Q6f 1 = "Yes" 2 = "No" 9999 = "Skip";
 VALUE Q7f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q8f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q9f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q10f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q11f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q12f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q13f 1 = "Hardly ever" 2 = "Some of the time" 3 = "Often" 9999 = "Skip";
 VALUE Q14f 1 = "Yes" 2 = "No" 9999 = "Skip";
 VALUE Q15f 1 = "More than you trust other people" 2 = "The same as you trust other people" 3 = "Less than you trust other people" 9999 = "Skip";
 VALUE Q16f 1 = "More than other people do" 2 = "The same as other people do" 3 = "Less than other people do" 9999 = "Skip";
 VALUE Q17f 1 = "More than from other people" 2 = "The same from other people" 3 = "Less than from other people" 9999 = "Skip";
 VALUE Q18f 1 = "More than other people do" 2 = "The same as other people do" 3 = "Less than other people do" 9999 = "Skip";
 VALUE Q19f 1 = "More than other people do" 2 = "The same as other people do" 3 = "Less than other people do" 9999 = "Skip";
 VALUE Q20f 1 = "Never" 2 = "Once a year or less" 3 = "A few times a year" 4 = "A few times a month" 5 = "Once a week" 6 = "More than once a week" 9999 = "Skip";
 VALUE Q21f 1 = "Rarely or never" 2 = "A few times a month" 3 = "Once a week" 4 = "Two or more times a week" 5 = "Daily" 6 = "More than once a day" 9999 = "Skip";
 VALUE Q22f 1 = "Definitely not true" 2 = "Tends not to be true" 3 = "Unsure" 4 = "Tends to be true" 5 = "Definitely true for me" 9999 = "Skip";
 VALUE Q23f 1 = "Definitely not true" 2 = "Tends not to be true" 3 = "Unsure" 4 = "Tends to be true" 5 = "Definitely true for me" 9999 = "Skip";
 VALUE Q24f 1 = "Excellent" 2 = "Good" 3 = "Fair " 4 = "Poor" 9999 = "Skip";
 VALUE Q26f 1 = "Yes" 2 = "No" 9999 = "Skip";
 VALUE Q27f 1 = "ER" 2 = "Primary Care/Doctor" 3 = "Clinic/Community Health Center" 4 = "The Night Ministry Health Outreach Bus" 5 = "Other" 9999 = "Skip";
 VALUE Q28f 1 = "Yes" 2 = "No" 9999 = "Skip";
 VALUE Q29f 1 = "Yes" 2 = "No" 9999 = "Skip";
 VALUE Q29af 1 = "ER" 2 = "Primary Care" 3 = "Clinic" 4 = "Client doesn't know where to go" 5 = "Client would not have pursued care" 6 = "Other (Please specify) ";
 VALUE Q30f 1 = "Male" 2 = "Female" 3 = "Transgender" 4 = "Other" 9999 = "Skip";
 VALUE Q31f 1 = "Heterosexual/Straight" 2 = "Homosexual (Lesbian or Gay) " 3 = "Bisexual" 4 = "Other" 9999 = "Skip";
 VALUE Q32f 1 = "18-24" 2 = "25-34" 3 = "35-44" 4 = "45-54" 5 = "55-64" 6 = "65 and over " 9999 = "Skip";
 VALUE Q33f 1 = "Hispanic or Latino" 2 = "Non-Hispanic or Latino" 3 = "Don't Know" 4 = "Other" 9999 = "Skip";
 VALUE Q33af 1 = "Mexican" 2 = "Puerto Rican" 3 = "Other Hispanic/Latino" 9999 = "Skip";
 VALUE Q34f 1 = "Caucasian/White " 2 = "African American/Black " 3 = "Asian" 4 = "Native American or Alaska Native" 5 = "Native Hawaiian or Other Pacific Islander" 6 = "Other (Please specify) " 7 = "Multiracial" 8 = "Unknown/undetermined" 9999 = "Skip";
 VALUE Q35f 1 = "Homeless – Street" 2 = "Homeless – Shelter" 3 = "Apartment" 4 = "House" 5 = "Medical Care Facility" 6 = "Hotel" 7 = "SRO" 8 = "Living with Family - not paying rent" 9 = "Living with Friend - not paying rent" 10 = "Vehicle" 11 = "Refused" 12 = "Don’t know " 9999 = "Skip";
 VALUE Q35af 1 = "Unstably housed or at risk of experiencing homelessness" 2 = "Stably housed" 9999 = "Skip";
 VALUE Q36f 1 = "1" 2 = "2 to 4" 3 = "5+" 9999 = "Skip";

	
run;

proc freq data=WEBWORK.SURVEY;
format 	Q1 Q1f.
Q2 Q2f.
Q3 Q3f.
Q5 Q5f.
Q5a Q5af.
Q6 Q6f.
Q7 Q7f.
Q8 Q8f.
Q9 Q9f.
Q10 Q10f.
Q11 Q11f.
Q12 Q12f.
Q13 Q13f.
Q14 Q14f.
Q15 Q15f.
Q16 Q16f.
Q17 Q17f.
Q18 Q18f.
Q19 Q19f.
Q20 Q20f.
Q21 Q21f.
Q22 Q22f.
Q23 Q23f.
Q24 Q24f.
Q26 Q26f.
Q27 Q27f.
Q28 Q28f.
Q29 Q29f.
Q29a Q29af.
Q30 Q30f.
Q31 Q31f.
Q32 Q32f.
Q33 Q33f.
Q33a Q33af.
Q34 Q34f.
Q35 Q35f.
Q35a Q35af.
Q36 Q36f.
;
	tables Location Spanish Q1 Q2 Q3 Q5 Q5a Q6 Q7 Q8 Q9 
		Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 
		Q26 Q27 Q28 Q29 Q29a Q30 Q31 Q32 Q33 Q33a Q34 Q35 Q35a Q36 / plots=(freqplot);
run;

%web_open_table(WEBWORK.SURVEY);