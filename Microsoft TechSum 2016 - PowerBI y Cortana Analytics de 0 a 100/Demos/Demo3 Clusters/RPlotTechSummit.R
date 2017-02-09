library(data.table) #reading in the data
library(dplyr) #dataframe manipulation
library(ggplot2) #viz
library(plotly) #3D plotting
library(tidyr) #dataframe manipulation
library(FNN) #k nearest neighbors algorithm


#setting environment
setwd("D:/Datos/Git/sessions/Microsoft TechSum 2016 - PowerBI y Cortana Analytics de 0 a 100/Demos/Demo3 Clusters")

#get data
train <- read.csv("./data2.csv")


plot_ly(data = train, x = followers_count_log , y = friends_count_log, z = statuses_count_log, color = id,  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")
plot_ly(data = train, x = followers_count_log , y = listed_count_log, z = statuses_count_log, color = id,  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")
plot_ly(data = train, x = followers_count_log , y = friends_count_log, z = favourites_count_log, color = id,  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")
plot_ly(data = train, x = followers_count_log , y = listed_count_log, z = favourites_count_log, color = id,  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")



small_train = train[train$lang == "es",]

plot_ly(data = small_train, x = followers_count_log , y = friends_count_log, z = listed_count_log,text = paste("User: ", screen_name),  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")


k1 <- kmeans(train[,4:8], centers=7, iter.max=10,nstart = 100)
train$cluster = factor(k1$cluster)


plot_ly(data = train, x = followers_count_log , y = friends_count_log, z = listed_count_log,color = cluster,text = paste("User: ", screen_name),  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")
plot_ly(data = train, x = followers_count_log , y = listed_count_log, z = statuses_count_log,color = cluster,text = paste("User: ", screen_name),  type = "scatter3d", mode = "markers", marker=list(size= 5)) %>% layout(title = "Twitter username ")
