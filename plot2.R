
library(dplyr);
## Read the file and apply filter on Date

hData <- read.table("G:\\Data Science\\Exdata\\household_power_consumption.txt",header=T,
                    sep=";",stringsAsFactors = FALSE,na.strings="?")

hData <- mutate(hData,Date=as.Date(Date,"%d/%m/%Y"));
hData <- mutate(hData,DateTime=paste(Date,Time));
hData <- mutate(hData,DateTime=as.POSIXct(hData$DateTime,format="%Y-%m-%d %H:%M:%S",usetz=FALSE));

hDate <- filter(hData, as.Date(DateTime) >='2007-02-01', as.Date(DateTime) <= '2007-02-02');
hDate <- hDate[complete.cases(hDate),]

rm(hData);


## Create PNG File
png(filename = "plot2.png",
    width = 480, height = 480, units = "px",  bg = "white");
plot(hDate$DateTime,as.numeric(hDate$Global_active_power),type="b",xlab=NA,ylab="Global Active Power (killowatts)");
dev.off();