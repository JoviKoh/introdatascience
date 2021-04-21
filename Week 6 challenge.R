# load data
mydata <- read.csv("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")
nicknames <- read.csv("nicknames.csv")

#remove row 9
mydata <- filter(mydata, State!="District of Columbia")

# combine capital and its nickname
mydata1 <- mutate(mydata, State= paste(mydata$State,nicknames$Nickname,sep = "-") )

# translate 3 column names to Malay language
mydata2 <- rename(mydata1, Indeks=Index, Negeri=State, Tahun2002=Y2002)

# remove year 2002, 2003, 2004
mydata3 <- select(mydata1, -c(Y2002,Y2003,Y2004))

#Find the average income for each state from the year 2005 – 2015
#add the average income to the dataset
mydata3 <- transform(mydata3, Average = rowMeans(mydata3[3:13],))

#top 5 highest income states 
top5highest <-top_n(mydata3, 5, mydata3$Average)

#top 5 lowest income states 
top5lowest <- top_n(mydata3, -5, mydata3$Average)

