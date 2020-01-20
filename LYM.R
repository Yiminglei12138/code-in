library(reshape2)
library(ggplot2)
library(stringr)

#Read data
sj<-read.csv("https://raw.githubusercontent.com/benubah/r-community-explorer/master/docs/data/rugs.csv")
dim(sj)

#Activity created data for 2018 and 2019 respectively
sj2018<-sj[str_which(sj$created,"2018"),]
sj2019<-sj[str_which(sj$created,"2019"),]
dim(sj2018)
dim(sj2019)

#Sum the total number of name, members, country, and city variables
#Among them, because the number of members is too large, the number of members is taken as 1%
name<-c(sum(duplicated(sj2018$name)==FALSE),sum(duplicated(sj2019$name)==FALSE))
name
members<-c(sum(sj2018$members),sum(sj2019$members))
members
country<-c(sum(duplicated(sj2018$country)==FALSE),sum(duplicated(sj2019$country)==FALSE))
country
city<-c(sum(duplicated(sj2018$city)==FALSE),sum(duplicated(sj2019$city)==FALSE))
city
year<-c("2018","2019")
year

#Visualize bar charts of variables, comparing 2018 and 2019
new_sj<-data.frame(year,name,members/100,country,city)
new_sj
new_sj<-melt(new_sj,id=c("year"))
ggplot(data=new_sj,aes(x=variable,y=value,fill=year))+
 geom_col(position = position_dodge())