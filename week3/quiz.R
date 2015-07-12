library(datasets)
data("iris")

## 1 - what is the mean of 'Sepal.Length' for the species virginica?
tapply(iris$Sepal.Length, iris$Species, mean)

## 2 - what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
apply(iris[, 1:4], 2, mean)

data(mtcars)

## 3 - How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
tapply(mtcars$mpg, mtcars$cyl, mean)
with(mtcars, tapply(mpg, cyl, mean))

## 4 - what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
hpmean <- tapply(mtcars$hp, mtcars$cyl, mean)
abs(hpmean["4"] - hpmean["8"])