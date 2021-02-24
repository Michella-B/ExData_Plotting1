# read table and subset the inspected dates

hpc <- read.table ('household_power_consumption.txt', skip=1 , sep= ';')
names(hpc) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 
                'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 
                'Sub_metering_3')
subhpc <- subset (hpc, hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007')


# Modify the Date and Time vars from characters into objects of type Date and
# POSIXlt respectively

subhpc$Date <- as.Date(subhpc$Date, format="%d/%m/%Y")
subhpc$Time <- strptime(subhpc$Time, format="%H:%M:%S")
subhpc[1:1440,"Time"] <- format(subhpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subhpc[1441:2880,"Time"] <- format(subhpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Code for plotting the figure 
plot(subhpc$Time,as.numeric(as.character(subhpc$Global_active_power)),
     type="l",xlab="",ylab="Global Active Power (kilowatts)", main = 'Global 
     Active Power Vs Time') 
