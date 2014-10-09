
library(dplyr);
## Read the file and apply filter on Date

hData <- read.table("G:\\Data Science\\Exdata\\household_power_consumption.txt",header=T,
                    sep=";")
hData <- mutate(hData,DateTime=paste(Date,Time));

hData <- mutate(hData,Date=as.Date(Date,"%d/%m/%Y"))

hDate <- filter(hData, Date =='2020-12-16')
