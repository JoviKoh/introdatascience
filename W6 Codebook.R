data()
data("airquality")
x <- data.set(airquality)
typeof(x)
class(x)
codebook(x)
summary(x)

makeCodebook(airquality)

#manually
class(airquality)
sapply(airquality,class)
sapply(airquality,min)
sapply(airquality,max)
sapply(airquality,range)
summary(airquality)
