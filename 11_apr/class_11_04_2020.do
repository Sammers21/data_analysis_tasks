//Multinomial logistic regression model with coefficients
mlogit bfast i.agecat i.marital i.active i.gender
//Multinomial logistic regression model with relative risk ratio
mlogit bfast i.agecat i.marital i.active i.gender, rrr

//Saving probabilities for each case
predict prob*

//Column with the maximum probability: 
egen pred_max = rowmax(prob*)

//Predicting group 
g pred_choice = .
forv i=1/3 {
 replace pred_choice = `i' if (pred_max == prob`i')
}
//Confusion Matrix
local bfast_lab: value label bfast
label values pred_choice `bfast_lab'
tab pred_choice bfast, column row
