nydata <- read.csv("~/Desktop/NYPD_Motor_Vehicle_Collisions.csv", header=FALSE)
View(nydata)
library(dplyr)

# Q1
df <- distinct(nydata, BOROUGH)%>%
  filter(BOROUGH!="")
head(df,na.rm=TRUE)
na.exclude(df)

# Q2
summarise(group_by(nydata, BOROUGH), num_of_persons_injured = sum(NUMBER.OF.PERSONS.INJURED,na.rm = TRUE))

# Q3
summarise(group_by(nydata, BOROUGH), num_of_persons_killed = sum(NUMBER.OF.PERSONS.KILLED,na.rm = TRUE))

#Q4

df1 <- filter(nydata,BOROUGH=="BROOKLYN")
df2 <- summarise(group_by(nydata, LOCATION), num_of_persons_injured = sum(NUMBER.OF.PERSONS.INJURED, na.rm = TRUE))
df2
df3 <- df2[order(df3$num_of_persons_injured,decreasing = TRUE),]
df3[2:11,]


# Q5
library(stringr)
nydata$Address <- str_c(nydata$BOROUGH, ',' ,nydata$ZIP.CODE, ',' ,nydata$ON.STREET.NAME)
View(nydata)


# Q6
df4<- filter(nydata,BOROUGH == "BROOKLYN")
df4$TIME.HOURS <- str_sub(df4$TIME,1,2)
df4$TIME.HOURS <- str_replace(df4$TIME.HOURS,":","")
df4
df5<- summarise(group_by(df5, TIME.HOURS), num_of_persons_injured = mean(NUMBER.OF.PERSONS.INJURED, na.rm = TRUE))
df5
df6 <- df5[order(df5$num_of_persons_injured,decreasing = TRUE),]
df6[1:10,]

#Q7
library(chron)
df7<- select(nydata,NUMBER.OF.PERSONS.INJURED,NUMBER.OF.PERSONS.KILLED,DATE,BOROUGH)
df7$DATE <- as.Date(nydata$DATE,"%m/%d/%Y")
str(nydata)
df7$YEAR <- as.numeric(format(df7$DATE,"%Y"))
YEARBOROUGH<-df7%>%
  group_by(YEAR,BOROUGH)%>%
  filter(BOROUGH!="")%>%
  summarise(sum_of_persons_injured=sum(NUMBER.OF.PERSONS.INJURED,na.rm = TRUE), sum_of_persons_killed=sum(NUMBER.OF.PERSONS.KILLED,na.rm = TRUE))
head(YEARBOROUGH)

