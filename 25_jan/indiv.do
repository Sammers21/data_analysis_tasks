clear
/* 1. What should be written in the command line to create an “age” variable with represents the age of a person in years? */
generate int age = 1
/* 2. What should be written in the command line to rename the variable “q1” to “gender”? */
gen int q1 = 2 
rename q1 gender
/* 3. What should be written in the command line to give to the “age” variable the label “Age in years”? */
label variable age "Age in years"
/* 4 Open nlsw88.dta file (from Example Datasets) */
sysuse nlsw88.dta, clear
/* a. How many unique value labels the file contains? */
/* Answer: 17 */
describe
/* 
Contains data from /Applications/Stata/ado/base/n/nlsw88.dta
  obs:         2,246                          NLSW, 1988 extract
 vars:            17                          1 May 2014 22:52
 size:        60,642                          (_dta has notes)
-----------------------------------------------------------------------------
              storage   display    value
variable name   type    format     label      variable label
-----------------------------------------------------------------------------
idcode          int     %8.0g                 NLS id
age             byte    %8.0g                 age in current year
race            byte    %8.0g      racelbl    race
married         byte    %8.0g      marlbl     married
never_married   byte    %8.0g                 never married
grade           byte    %8.0g                 current grade completed
collgrad        byte    %16.0g     gradlbl    college graduate
south           byte    %8.0g                 lives in south
smsa            byte    %9.0g      smsalbl    lives in SMSA
c_city          byte    %8.0g                 lives in central city
industry        byte    %23.0g     indlbl     industry
occupation      byte    %22.0g     occlbl     occupation
union           byte    %8.0g      unionlbl   union worker
wage            float   %9.0g                 hourly wage
hours           byte    %8.0g                 usual hours worked
ttl_exp         float   %9.0g                 total work experience
tenure          float   %9.0g                 job tenure (years)
-----------------------------------------------------------------------------
Sorted by: idcode */
/* b. Analyse occupation variable and answer the questions below: */
/* - How many Managers/admins participated in the research? */
/* Answer:  264 */
tab occupation
/* 
            occupation |      Freq.     Percent        Cum.
-----------------------+-----------------------------------
Professional/technical |        317       14.17       14.17
        Managers/admin |        264       11.80       25.97
                 Sales |        726       32.45       58.43
    Clerical/unskilled |        102        4.56       62.99
             Craftsmen |         53        2.37       65.36
            Operatives |        246       11.00       76.35
             Transport |         28        1.25       77.60
              Laborers |        286       12.78       90.39
               Farmers |          1        0.04       90.43
         Farm laborers |          9        0.40       90.84
               Service |         16        0.72       91.55
     Household workers |          2        0.09       91.64
                 Other |        187        8.36      100.00
-----------------------+-----------------------------------
                 Total |      2,237      100.00 */

tab occupation, missing
/* 
            occupation |      Freq.     Percent        Cum.
-----------------------+-----------------------------------
Professional/technical |        317       14.11       14.11
        Managers/admin |        264       11.75       25.87
                 Sales |        726       32.32       58.19
    Clerical/unskilled |        102        4.54       62.73
             Craftsmen |         53        2.36       65.09
            Operatives |        246       10.95       76.05
             Transport |         28        1.25       77.29
              Laborers |        286       12.73       90.03
               Farmers |          1        0.04       90.07
         Farm laborers |          9        0.40       90.47
               Service |         16        0.71       91.18
     Household workers |          2        0.09       91.27
                 Other |        187        8.33       99.60
                     . |          9        0.40      100.00
-----------------------+-----------------------------------
                 Total |      2,246      100.00 */

/* What in the percent of Professional/technical out of all the research participants? */
/* Answer: 14.11 */
/* What in the percent of Professional/technical out of the research participants that gave valid information about their occupation? */
/* Answer: 14.17 */
/* c. Indicate the following statistical characteristics for age variable: */
sum age, detail
/* 
                     age in current year
-------------------------------------------------------------
      Percentiles      Smallest
 1%           34             34
 5%           35             34
10%           35             34       Obs               2,246
25%           36             34       Sum of Wgt.       2,246

50%           39                      Mean           39.15316
                        Largest       Std. Dev.      3.060002
75%           42             45
90%           44             45       Variance       9.363614
95%           44             46       Skewness       .2003234
99%           45             46       Kurtosis       1.932389 */
egen mode = mode(age)
tab mode
/* 
       mode |      Freq.     Percent        Cum.
------------+-----------------------------------
         35 |      2,246      100.00      100.00
------------+-----------------------------------
      Total |      2,246      100.00 */
mean age
/* 
Mean estimation                   Number of obs   =      2,246

--------------------------------------------------------------
             |       Mean   Std. Err.     [95% Conf. Interval]
-------------+------------------------------------------------
         age |   39.15316   .0645679      39.02654    39.27978
-------------------------------------------------------------- */

tabstat age, statistics(iqr)
/* 
    variable |       iqr
-------------+----------
         age |         6
------------------------ */

/* Mode: 35 */
/* Median: 39  */
/* Mean: 39.15316 */
/* Range: 34-45 */
/* Standard deviation: 3.060002 */
/* S. E. mean: .0645679  */
/* Interquartile range: 6  */
/* Quartile deviation: 6/2=3 */
/* Decile ratio: p90/p10 = 44/35 = 1.257  */

// Crate a histogram for age variable with normal density plot and copy it into this file.
hist age

// d. Indicate the mean age for those who
// are married and not married.
mean age if married == 1
// Mean estimation                   Number of obs   =      1,442

// --------------------------------------------------------------
//              |       Mean   Std. Err.     [95% Conf. Interval]
// -------------+------------------------------------------------
//          age |    39.1165   .0807417      38.95812    39.27489
// --------------------------------------------------------------
mean age if married == 0
// Mean estimation                   Number of obs   =        804
// --------------------------------------------------------------
//              |       Mean   Std. Err.     [95% Conf. Interval]
// -------------+------------------x------------------------------
//          age |   39.21891   .1075621      39.00777    39.43004
// --------------------------------------------------------------
// e, Indicate the maximum age of those who are not married and have the tenure variable greater than 50. 
// Answer: No such people
summarize tenure
// How many college graduates are married:
// Answer: 344
// what is the percent of college graduates that are married?
// Answer:  344/532 = 0.6466...
drop if collgrad == 0
// (1,714 observations deleted)
count if married == 1
//  344
count
// 532
// g. How many research participants have the following characteristics:
// - are not married,
// Answer: 804
clear
sysuse nlsw88.dta
count if married == 0
// - are not college graduates,
// Answer: 1714
count if collgrad == 0
//  are not members of the union. 
// Answer: 1,630
drop if married == 0 & collgrad == 0
count
mean age
exit