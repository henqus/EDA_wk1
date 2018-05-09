## R cript: plot1.R 

library(dplyr)
library(readr)     ## Read Rectangular Text Data

# 1. Create a data directory        

if (!file.exists("./data")){dir.create("./data")}

# 2. Download the Dataset: Electric power consumption [20Mb] 
#    from the UC Irvine Machine Learning Repository
#    and unzip it (all only if it isn't done yet)

fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
localZip <- "./data/household_power_consumption.zip"
unzipped <- "./data/household_power_consumption.txt"

if (!file.exists(localZip)){ download.file(fileUrl, localZip)}

if (!file.exists(unzipped)){ unzip(localZip, exdir = "./data")}

# 3. Read the required data from the dates 2007-02-01 and 2007-02-02

if(!exists("epc")){
        epc <- read.table(text = grep("^[1,2]/2/2007", readLines(unzipped), value = TRUE), 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", 
                                       "Global_intensity", "Sub_metering_1", 
                                       "Sub_metering_2", "Sub_metering_3"), 
                         sep = ";", 
                         header = TRUE)
}

# 4. make the plot

hist(epc$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kiloWatts)",
     col = "red"
)

# 5. Copy the plot to a png file

dev.copy(png, file = "plot1.png")
dev.off()

## END OF SCRIPT