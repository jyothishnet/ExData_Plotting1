
library(dplyr);
## Read the file and apply filter on Date

hData <- read.table("G:\\Data Science\\Exdata\\household_power_consumption.txt",header=T,
                    sep=";")
hData <- mutate(hData,DateTime=paste(Date,Time));

hData <- mutate(hData,DateTime=as.Date(DateTime,"%d/%m/%y"))

hDate <- filter(hData, DateTime >='2007-02-01',DateTime <= '2007-02-02' )
