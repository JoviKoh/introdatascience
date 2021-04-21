# load data
mydata <- read.csv("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")

#select random rows of data
sample_n(mydata,3) 

# returns randomly N% of rows
sample_frac(mydata,0.1)

#Remove Duplicate Rows based on all the variables (Complete Row)
# distinct function is used to eliminate duplicates
x1 <- distinct(mydata)  #no duplicates for this dataset

#Remove Duplicate Rows based on a variable
# .keep_all function is used to retain all other variables in the output data frame
x2 <- distinct(mydata, Index, Y2010, .keep_all = TRUE)

#select() Function
# Selecting Variables
mydata2 <- select(mydata,Index,State:Y2008)

# Dropping Variable
mydata2 <- select(mydata2, -Index, -State)
# Alternate way: select(mydata2, -c(Index, State)

# Selecting or Dropping Variables starts with 'Y'
mydata3 <- select(mydata, starts_with("Y"))
mydata3 <- select(mydata3, -starts_with("Y200"))

# Selecting Variables contain 'I' in their names
mydata4 <- select(mydata, contains("I"))

#Reorder Variables
mydata5 <- select(mydata, State, everything())
mydata5

#Rename Variables
mydata6 <- rename(mydata, Index1=Index)
names(mydata6)

#Filter Rows
mydata7 <- filter(mydata, Index=="A")
mydata7

#Multiple Selection Criteria
mydata7 <- filter(mydata, Index %in% c("A","D"))
mydata7

# 'AND' Condition in Selection Criteria
mydata8 <- filter(mydata, Index %in% c("A","C")&Y2002>=1300000)
mydata8

# 'OR' Condition in Selection Criteria
mydata9 <- filter(mydata, Index %in% c("A","C")|Y2002>=1300000)
mydata9                                       

#NOT Condition
mydata10 <- filter(mydata, !Index %in% c("A","C"))
mydata10

#CONTAINS Condition
mydata10 <- filter(mydata, grepl("Ar",State))
mydata10

#Summarize selected variables
summarise(mydata, Y2015_mean = mean(Y2015), Y2015_med = median(Y2015))

#Summarize Multiple Variables
summarize_at(mydata, vars(Y2005,Y2006), list(n=~n(), mean=mean, median=median))
summarize_at(mydata, vars(Y2005,Y2006), list(n=~n(), ~mean(.), ~median(.)))

#Summarize with Custom Functions
summarize_at(mydata, vars(Y2011,Y2012), list(~n(),missing=~sum(is.na(.)),
                                             ~mean(.,na.rm = TRUE), 
                                             ~median(.,na.rm = TRUE)))

#How to apply Non-Standard Functions
set.seed(222)
my_data <- data.frame(X1=sample(1:100,100), X2=runif(100))
summarise_at(my_data, vars(X1,X2), ~var(.-mean(.)))

#Summarize all Numeric Variables
summarise_if(mydata, is.numeric, list(~n(),~mean(.),~median(.)))

#Summarize Factor Variable
summarise_all(mydata["Index"], list(nmiss=~sum(is.na(.))))

