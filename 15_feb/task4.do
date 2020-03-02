use Worldbank_data.dta, clear
egen zhightech = std(hightech)
egen zinternet = std(internet)
egen zexport = std(export)
egen zmobile = std(mobile)
cluster  wardslinkage   zinternet zexport zmobile zhightech , measure(L2) name(myclust)
cluster stop myclust,  rule(calinski) 
// cluster dendrogram myclust, horizontal cutnumber(4)
cluster generate clustdes = groups (4), name (myclust) 
sort clustdes
by clustdes: list  if _n<=5
save Worldbank_data_with_clusters.dta, replace
use video_games_sales.dta, clear
destring Global_Sales User_Score, replace
egen zCritic_Score = std(Critic_Score)
egen zUser_Count = std(User_Count)
egen zGlobal_Sales = std(Global_Sales)
egen zUser_Score = std(User_Score)
cluster wardslinkage zCritic_Score zUser_Count zGlobal_Sales zUser_Score, measure(L2) name(myclust)
cluster stop myclust,  rule(calinski) 
describe
exit