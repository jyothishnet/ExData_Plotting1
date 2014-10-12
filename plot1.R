
library(dplyr);
library(grDevices);
## Read the file and apply filter on Date

hData <- read.table("G:\\Data Science\\Exdata\\household_power_consumption.txt",header=T,
                    sep=";",stringsAsFactors = FALSE,na.strings="?")
hData <- mutate(hData,DateTime=paste(Date,Time));

hData <- mutate(hData,Date=as.Date(Date,"%d/%m/%Y"));
hData <- mutate(hData,DateTime=as.Date(Date,"%d/%m/%Y"));

hDate <- filter(hData, DateTime >='2007-02-01', DateTime <= '2007-02-02');
hDate <- hDate[complete.cases(hDate),]

rm(hData);

## Create PNG File
png(filename = "plot1.png",
    width = 480, height = 480, units = "px",  bg = "white");
hist(as.numeric(hDate$Global_active_power),breaks=15,col="red",
     xlab="Global Active Power (killowatts)",ylab="Frequency",main="Global Active Power");
dev.off();