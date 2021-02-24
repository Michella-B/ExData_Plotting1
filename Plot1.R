# read table and subset the inspected dates

hpc <- read.table ('household_power_consumption.txt', skip=1 , sep= ';')
names(hpc) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 
                'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 
                'Sub_metering_3')
subhpc <- subset (hpc, hpc$Date == '1/2/2007' | hpc$Date == '2/2/2007')


# code for plotting a histogram of Global active power with the color red

hist(as.numeric(as.character(subhpc$Global_active_power)) ,
     xlab= 'Global Active Power (kilowatts)', 
     ylab = 'Frequency', main= 'Global Active Power', col = 'red')
