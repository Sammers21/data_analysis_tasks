use data_games.dta
summarize crystalls_bought
egen mode = mode(crystalls_bought)
tab mode 
/* 
mode |      Freq.     Percent        Cum.
------------+-----------------------------------
         14 |    105,507      100.00      100.00
------------+-----------------------------------
      Total |    105,507      100.00 
*/
sum crystalls_bought, detail
                      /* crystalls_bought
-------------------------------------------------------------
      Percentiles      Smallest
 1%            0              0
 5%            5              0
10%            5              0       Obs             105,507
25%           14              0       Sum of Wgt.     105,507

50%           30                      Mean           51.36338
                        Largest       Std. Dev.      75.60694
75%           70            930
90%          120            963       Variance        5716.41
95%          210           1284       Skewness       3.620393 */
mean crystalls_bought
/* Mean estimation                   Number of obs   =    105,507

------------------------------------------------------------------
                 |       Mean   Std. Err.     [95% Conf. Interval]
-----------------+------------------------------------------------
crystalls_bought |   51.36338   .2327668      50.90716     51.8196
------------------------------------------------------------------ */
tabstat crystalls_bought, statistics(iqr)
    /* variable |       iqr
-------------+----------
crystalls_~t |        56
------------------------ */
tabstat crystalls_bought, statistics(p10, p90)
/**
    variable |       p10       p90
-------------+--------------------
crystalls_~t |         5       120
----------------------------------
*/
/* Mode: 14 
Median: 30
Mean: 51.36338
Range: 0 - 1284
Standard deviation: 75.60694
S. E. mean: .2327668 
Interquartile range: 56
Quartile deviation: 56/2=28
Decile ratio p90/p10 = 24
*/