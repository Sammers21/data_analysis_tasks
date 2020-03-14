use "WARRANTY.dta", clear
logit Bought Gender Gift Age Race Price100
estat gof
logistic Bought Gender Gift Age Race Price100
tab Gender
tab Race
predict predict_percent
recode predict_percent (0/0.5=0) (0.5/1=1), gen(predict_final)
compare predict_final Bought

predict r, resid
egen r_mu = mean(r)
egen r_s = sd(r)
ksmirnov r = normprob((r-r_mu)/r_s)
tabstat r, stats(range)
kdensity r, normal
exit