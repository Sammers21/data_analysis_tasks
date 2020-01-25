use data_games.dta
hist payment
sum payment, detail
/* 
                      payment in cents
-------------------------------------------------------------
      Percentiles      Smallest
 1%           55              0
 5%          127              0
10%          205              0       Obs             105,507
25%          321              0       Sum of Wgt.     105,507

50%          644                      Mean           1198.627
                        Largest       Std. Dev.      1410.607
75%         1499          14183
90%         3087          14183       Variance        1989811
95%         3273          14183       Skewness       3.115122
99%         6452          14183       Kurtosis        17.1964 */

/**
The distribution is positivly skewed and leptokurtic.
*/