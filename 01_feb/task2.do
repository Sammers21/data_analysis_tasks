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
save salary_modif.dta
exit