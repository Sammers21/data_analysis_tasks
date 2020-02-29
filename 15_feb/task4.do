use Worldbank_data.dta, clear
egen zhightech = std(hightech)
egen zinternet = std(internet)
egen zexport = std(export)
egen zmobile = std(mobile)
cluster  wardslinkage   zinternet zexport zmobile zhightech , measure(L2) name(myclust)
cluster stop myclust,  rule(calinski) 
cluster dendrogram myclust, horizontal cutnumber(4)
cluster generate clustdes = groups (4), name (myclust) 
sort clustdes
by clustdes: list  if _n<=5
save Worldbank_data_with_clusters.dta, replace
exit