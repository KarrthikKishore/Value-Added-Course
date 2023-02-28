library(robotstxt)
library(rvest)
url <- "https://www.icc-cricket.com/rankings/mens/player-rankings/t20i/batting"
path = paths_allowed(url)
#html from website
web = read_html(url)
View(web)
pos <- web %>% html_nodes(".rankings-table__pos-number")%>% html_text()
View(pos)
players <- web %>%html_nodes(".name a") %>% html_text()
View(players)
team<- web %>%html_nodes(".table-body__logo-text") %>% html_text()
View(team)
rating<- web %>% html_nodes(".rating") %>% html_text()
View(rating)

#creating dataframe
iccranking <- data.frame(pos,players,team,rating)
View(iccranking)
#save
write.csv(iccranking,"iccranking.csv")