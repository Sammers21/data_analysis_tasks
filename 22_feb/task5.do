use "TOSSE-R.dta", clear 
factor q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20 q21 q22 q23 q24 q25 q26 q27 q28
ssc install factortest 
factortest q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20 q21 q22 q23 q24 q25 q26 q27 q28
factor q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20 q21 q22 q23 q24 q25 q26 q27 q28, pcf
rotate
predict factor1 factor2 factor3 factor4 factor5
sum
recode factor1 (min/-2.2=1) (-2.2/-1.4=2) (-1.4/-0.5=3) (-0.5/0=4) (0/1.5=5) (1.5/2.5=6) (2.5/max=7), gen(factor1_rescaled)
recode factor2 (min/-2.2=1) (-2.2/-1.4=2) (-1.4/-0.5=3) (-0.5/0=4) (0/1.5=5) (1.5/2.5=6) (2.5/max=7), gen(factor2_rescaled)
recode factor3 (min/-2.2=1) (-2.2/-1.4=2) (-1.4/-0.5=3) (-0.5/0=4) (0/1.5=5) (1.5/2.5=6) (2.5/max=7), gen(factor3_rescaled)
recode factor4 (min/-2.2=1) (-2.2/-1.4=2) (-1.4/-0.5=3) (-0.5/0=4) (0/1.5=5) (1.5/2.5=6) (2.5/max=7), gen(factor4_rescaled)
recode factor5 (min/-2.2=1) (-2.2/-1.4=2) (-1.4/-0.5=3) (-0.5/0=4) (0/1.5=5) (1.5/2.5=6) (2.5/max=7), gen(factor5_rescaled)
save "TOSSE-R-edited-drankou.dta", replace
exit