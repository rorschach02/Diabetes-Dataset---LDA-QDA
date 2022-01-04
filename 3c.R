### Clear the environment 
rm(list = ls())


### First we will set the directory of the R script 
setwd("C:/Users/anike/Desktop/Sem 1/EAS 506 Statistical Data Mining/Homework/Homework 3")


## Loading all the libraries 
#install.packages("MVN")
library(ISLR)
library(corrplot)
library(MASS)
library(klaR)
library(leaps)
library(lattice)
library(ggplot2)
library(corrplot)
library(car)
library(caret)
library(class)
library(MVN)


## Loading dataset
data("Diabetes")

## 
head(Diabetes)
dim(Diabetes)

table(Diabetes$group)

## Null values check 
NAmat1 = matrix(as.numeric(is.na(Diabetes)) , ncol = 6)
nonNAdx1 = which(rowSums(NAmat1) == 0)
nonNAdx1 ## so no rows have empty or null values.


## Plotting 
x11()
col <- c("blue", "red", "darkgreen")[Diabetes$group]
table(Diabetes$group)
pch <- c(16,15,17)[Diabetes$group]
plot(Diabetes[,1:5], col=col, pch=pch , main = "Pairwise Scatter Plots")


# Checking whether classes have different COvariance : using Multivariate Normatality Test
MVN <- mvn(Diabetes[1:5], subset = NULL, mvnTest = "mardia")
MVN$multivariateNormality
MVN

#Normalizing Dataset
normalize <- function(x) {
  (x -min(x)) / (max(x) - min(x))
  
}

Diabetes_Norm <- as.data.frame(lapply(Diabetes[1:5], normalize))
head(Diabetes_Norm , 4)
full_dataset_Diabetes <- cbind(Diabetes_Norm , Diabetes)
head(full_dataset_Diabetes)
full_dataset_Diabetes <- subset(full_dataset_Diabetes , select = -c(6:10))
head(full_dataset_Diabetes ,1)

# Test and Training Data
# As our target feature has 
set.seed(1)
trainIndex <- createDataPartition(full_dataset_Diabetes$group, p = 0.70,list = FALSE,times = 1)
train_data <- full_dataset_Diabetes[trainIndex,]
test_data <- full_dataset_Diabetes[-trainIndex,]
dim(train_data)
dim(test_data)
dim(full_dataset_Diabetes)

## LDA ## 
colnames(Diabetes)
lda.fit <- lda(group~., data = train_data)
lda.fit
test_pred <- predict(lda.fit , newdata = test_data)
test_pred_y = test_pred$class
test_pred_y
table(test_data$group ,test_pred_y )
mean(test_data$group != test_pred_y)

## QDA ##
qda.fit <- qda(group~., data = train_data)
qda.fit
qda_test_pred <- predict(qda.fit , newdata = test_data)
qda_test_pred_y = qda_test_pred$class
qda_test_pred_y
table(test_data$group ,qda_test_pred_y )
mean(test_data$group != qda_test_pred_y)

## testing ##
given_data = data.frame(relwt = c(1.86),glufast = c(184),glutest = c(68),instest = c(122),sspg = c(544),group = c('x'))
given_data
y_lda_given_data = predict(lda.fit, newdata = given_data)
y_qda_given_data = predict(qda.fit, newdata = given_data)

y_lda_given_data
y_qda_given_data





