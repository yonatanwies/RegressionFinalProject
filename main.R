data<-read.csv(file = "Life Expectancy Data.csv")
data <- data[,-5]
data<-na.omit(data)
#Q1
# Values that we believe should be linked to life expectancy that must be included
# in the model, are: 1) Status 2) Alcohol 3) Percentage Expenditure 4) Schooling 
# Findings: 1) Status is either Developed or Developing. Categorical variable.
# 2) Alcohol is in a range of [0,17.87], where 17.87 is from using max(data$Alcohol)
# 3)Percentage Expenditure; in a range of [0,1] where 0 is 0% from domestic income 
# is used towards healthcare, and 1 is 100%.
# 4) Schooling; range of [4.2,20.7], showing the number of years in the school system.
# Expectation is the higher the number, the lower the mortality rate.

#Q2
sample_size <- floor(0.85*nrow(data))
set.seed(123)
picked = sample(seq_len(nrow(data)),size = sample_size)
training <- data[picked,]
test <- data[-picked,]

#Q3
create_cor<-function(data){
  mat <- matrix(nrow=nrow(data),ncol=ncol(data))
  for(i in 1:length(ncol(data))){
    for(j in 1:length(nrow(data))){
      mat[i,j] <- cor(data[i],data[j])
    }
  }
}
cor_dat<-create_cor(training)

plot(cor(training$percentage.expenditure,training$infant.deaths))
cor(training$percentage.expenditure,training$infant.deaths)