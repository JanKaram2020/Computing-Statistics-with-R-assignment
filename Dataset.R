# dataset[dataset$column != value] # filters data set column based on a value
data(mtcars)
#Is an automatic or manual transmission better for MPG
automaticCars = mtcars[mtcars$am==0,] #filter mtcars data set based on am = 0 (Automatic)
manualCars =  mtcars[mtcars$am==1,] # 
meanOfAutomatic = mean(automaticCars)
meanOfManual = mean(manualCars)
if(mean(automaticCars$mpg) < mean(manualCars$mpg)){
  print("mpg is better in manual cars")
} else{
  print("mpg is better in automatic cars")
}

#Quantify the MPG difference between automatic and manual transmissions
mgpDiffrence = (meanOfAutomatic - meanOfManual)

#Try to looking at relationships between multiple variables. You should aim
#to analyze at least one dependent variable and three independent variables
View(mtcars)
relatedMpg = lm(mpg ~ am , data=mtcars) 
summary(relatedMpg) # mpg is dependent on am (p-value is so small)
relatedGear = lm(gear ~ cyl + disp + am , data=mtcars) 
summary(relatedGear) # gear is independent (p-value is so big)
relatedAm = lm(am ~ wt , data=mtcars) 
summary(relatedAm) # am is independent on weight (p-value is so big)
relatedVs = lm(vs ~ wt + cyl + disp , data=mtcars) 
summary(relatedVs) # vs is independent on weight (p-value is so big)