//  1.x
use data_games.dta, clear
describe
tabulate payment_method payment_type, chi2
graph bar (percent), over(payment_type) over(payment_method) nofill 
// 2.x
twoway scatter crystalls_balance_before_buy payment
egen payment_mu = mean(payment)
egen payment_s = sd(payment)
ksmirnov payment = normprob((payment-payment_mu)/payment_s)
swilk payment
pwcorr crystalls_balance_before_buy payment
pwcorr crystalls_balance_before_buy crystalls_bought
pwcorr payment crystalls_bought
// 3.x
use health_funding.dta, clear
describe
pwcorr funding disease , sig
pcorr funding disease visits
// 4.x
use auto.dta, clear
describe
ttest length, by(foreign)
use data_games.dta, clear 
ttest payment, by(payment_type)
kwallis payment, by(payment_method)
exit