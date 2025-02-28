#To create a vector named 'z' with the values 1 to 200.
z<-1:200  
z

#To print the mean and standard deviation of z
mean(z)
sd(z)

#To create a logical vector named zlog that is 'TRUE' for z values and 'FALSE' otherwise.
zlog<-z>30
zlog

#To make a dataframe with z and zlog as columns.Name the dataframe zdf
zdf<-data.frame(z,zlog)
zdf

#To change the column names in your new dataframe to equal "zvec" and "zlogic"
colnames(zdf)<-c("zvec","zlogic")
zdf

#To make a new column names in your dataframe equal to zvec squared (i.e, z^2). Call the new column zsquared.
zdf$zsquared<-(zdf$zvec^2)
zdf

#To subset the dataframe with the subset() function to only include values of zsquared greater than 10 and less than 100 
subset(zdf,zsquared>10 & zsquared<100)

#To subset the dataframe without the subset() function to only include values of zsquared greater than 10 and less than 100
zdf[zdf$zsquared>10 & zdf$zsquared<100,]


#To subset the zdf dataframe to only include the values on row 26
subset(zdf[26,])

#To subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf$zsquared[zdf$zvec==180]
