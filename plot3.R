set_plot <- function(){
    Sys.setlocale("LC_TIME", "en_US.UTF-8")
    png(
        "plot3.png",
        width = 480,
        height = 480,
        units = "px"
    )
}
load_data <-function(filename){
    my_data <-read.table(filename,header=TRUE,na.strings="?",sep=";")
    # 2007-02-01 and 2007-02-02
    filtro <- my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007"
    my_data <- my_data[filtro,]
    my_data$TimeStamp <- as.POSIXlt(paste(my_data$Date, my_data$Time), format="%d/%m/%Y %H:%M:%S")
    my_data
}
MyPlot<-function(datos){
    plot(datos$TimeStamp, datos$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
    lines(datos$TimeStamp, datos$Sub_metering_2, col="red")
    lines(datos$TimeStamp, datos$Sub_metering_3, col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
}
datos <- load_data("household_power_consumption.txt")
set_plot()
MyPlot(datos)
dev.off()
