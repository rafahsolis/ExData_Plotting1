set_plot <- function(){
    Sys.setlocale("LC_TIME", "en_US.UTF-8")
    png(
        "plot4.png",
        width     = 480,
        height    = 480,
        units     = "px"
    )
    par(mfcol= c(2,2))
}

load_data <-function(filename){
    my_data <-read.table(filename, header=TRUE, na.strings="?", sep=";")
    
    # 2007-02-01 and 2007-02-02
    filtro <- my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007"
    my_data <- my_data[filtro,]
    my_data$TimeStamp <- as.POSIXlt(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")
    my_data
}

MyPlot1<-function(datos){
    plot(datos$TimeStamp, datos$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
}

MyPlot2<-function(datos){
    plot(datos$TimeStamp, datos$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
    lines(datos$TimeStamp, datos$Sub_metering_2, col="red")
    lines(datos$TimeStamp, datos$Sub_metering_3, col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n")
}

MyPlot3<-function(datos){
    plot(datos$TimeStamp, datos$Voltage, type="l", xlab="datetime", ylab="Voltage")
}

MyPlot4<-function(datos){
    plot(datos$TimeStamp, datos$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
}
    

datos <- load_data("household_power_consumption1.txt")
set_plot()
MyPlot1(datos)
MyPlot2(datos)
MyPlot3(datos)
MyPlot4(datos)
dev.off()