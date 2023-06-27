data<-read.csv(file = "Life Expectancy Data.csv")
data <- data[,-5]
length(is.na(data))
na.omit(data)
