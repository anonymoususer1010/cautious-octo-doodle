library(robotstxt)
path=paths_allowed("https://en.wikipedia.org/wiki/COVID-19_pandemic_by_country_and_territory")

library(rvest)
web=read_html("https://en.wikipedia.org/wiki/COVID-19_pandemic_by_country_and_territory")
My_table<-html_nodes(web,"table")

Covid_table<-html_table(My_table,fill = TRUE)[[2]]
View(Covid_table)

Covid<-Covid_table[,2:5]
View(Covid)

names(Covid)<-c("Location","Cases","Deaths","Recovered")
View(Covid)

Covid$Location=gsub("\\[+\\w||\\]","",Covid$Location)
View(Covid)

write.csv(Covid,"COVID STATS.csv")
