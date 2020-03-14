use data_games.dta, clear
describe
reg payment payment_type payment_method crystalls_balance_before_buy crystalls_bought
tab payment_method
tab payment_type
predict r, resid
kdensity r, normal
estat hettest
estat vif
exit
