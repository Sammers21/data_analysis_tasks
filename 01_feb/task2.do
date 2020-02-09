// 1.x tasks
use salary.dta, clear
describe
tab position
encode position, generate(num_position)
tab num_position
describe
generate dollor_rub_ratio = 64
generate tax = .
replace tax = (salary / dollor_rub_ratio) * 0.13 if foreigner == 0
replace tax = (salary / dollor_rub_ratio) * 0.30 if foreigner == 1
tab tax
egen rnk = rank(salary), field
gsort -salary
list
save salary_modif.dta, replace
// 2.x tasks
use data_games.dta, clear
describe
drop if payment < 100 | payment > 14000
tab payment
recode payment (100/500 = 1 "1st group") (501/1000 = 2 "2nd group") (1001/2000 = 3 "3rd group") (2000/max = 4 "4rd group" ), gen(payment_group)
tab payment_group
// 3.x tasks
use revenue.dta, clear
collapse (sum) year_revenue=rev, by(year company)
list
// 4.x
use data_games.dta, clear
describe
tab2 payment_method country
tab payment_method,  nolabel 
tab payment_method
drop if payment_method != 4
tab2 payment_method country, colsort
use data_games.dta, clear
graph bar (percent), over(country) over(payment_method) nofill 
exit