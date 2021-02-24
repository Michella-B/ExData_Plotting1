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


# Fit the bg for 4 plots 
par(mfrow=c(2,2))


# code for plotting the figure
with(subhpc,{
  plot(subhpc$Time,as.numeric(as.character(subhpc$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subhpc$Time,as.numeric(as.character(subhpc$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subhpc$Time,subhpc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subhpc,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subhpc,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subhpc,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subhpc$Time,as.numeric(as.character(subhpc$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})