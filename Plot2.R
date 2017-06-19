
######################## PLOT 2 ###################################
#clear console

#cat("\014")

# clear workspace
#rm(list=ls())

#get current directory
getwd()
setwd("C:/Users/Documents/Python_learning/R")

#read in data specifying the directory where the data is located, the seperator 
#which is ";" while using the accompanying headers and specifying that the NA values 
# are denoted as "?" as instructed
energ <- read.delim(file.path("household_power_consumption.txt"),
                    sep = ";",
                    stringsAsFactors = FALSE,
                    header = TRUE, 
                    na.strings = "?")

# create a subset of the data with all rows with incomplete/NA values gone
energy <- energ[complete.cases(energ), ]

#check what type of Data is the Date column
summary(energy$Date)

#as can be seen it is a character, we could convert this to the normal date 
#format, that is we convert the character to date objects so we can work with them properly
#energy$Date <- strptime(energy$Date, "%d/%m/%Y")
#energy$Date <- as.Date(energy$Date, "%d%m%Y")

#i chose to work with the character direcetly since we can do a subset of the data
# to be analyzed but having to specify it is a character
subenergy <- energy[energy$Date %in% c("1/2/2007","2/2/2007") ,]

# we want a plot of the category  Global_active_power hence we could subset this and
#specify it is numeric using the as.numeric function
Global.active.power <- as.numeric(subenergy$Global_active_power)


# We have two columns for time, hence we should combine the two columns using the paste
# function and a seperator, I chose to use space i.e " " 
# the format also has to be defined in order to include the time up till seconds for this
#exercise. We could do this in two steps by first combining the first two columns with
# the following command 
#Date.and.time <- (paste(subenergy$Date, subenergy$Time, sep=" ")
#Date.and.time <- strptime(Date.and.time, "%d/%m/%Y %H:%M:%S") 
#Date.and.time <- as.Date(energy$Date, "%d%m%Y")
# I chose to do this with a single command

Date.and.time <- strptime(paste(subenergy$Date, subenergy$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# use plot function to plot but specifiy the type is line "l" else it would be circles 
#by default
plot(Date.and.time, Global.active.powerr, type="l", xlab="Weekdays", ylab="Global Active Power (kW)")

