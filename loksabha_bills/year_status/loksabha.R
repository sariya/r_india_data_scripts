#Date April 12 2017
#LokSabh private bills
#
#

setwd("/Users/sariyasanjeev/Documents/files_work/data_indian_govt/loksabhapvtbills/")
library(ggplot2)
library(dplyr)
library(reshape2)

df<-read.csv("datafile.csv",header = TRUE,strip.white=TRUE)
df<-read.csv("small.csv",header = TRUE,strip.white=TRUE)

dfnew <- data.frame(lapply(df, trimws))
dim(df)

col_names<-colnames(dfnew)

factor(dfnew$Ministry)
selected_column<-c(col_names[2],col_names[8])
years<-unique(dfnew$Bill.Year)

status<-unique(dfnew$Status)

length(unique(dfnew$Ministry))
only_columns<-subset(dfnew,select = selected_column)

unique(only_columns$Bill.Year)

modified_fd<-apply(only_columns, 2, function(x) gsub("^$|^ $", "Unavailable", x))

df_formelt<-as.data.frame(modified_fd)

factor(df_formelt$Status)

ggplot(df_formelt,aes(x=factor(df_formelt$Bill.Year) ,fill=factor(df_formelt$Status) ) ) + 
  geom_bar(position = "dodge", width = 0.9)+
  xlab("Year")+ylab("Number")+  scale_fill_discrete(name="Status")+
  scale_y_continuous(breaks=seq(0, 150, 25))  

