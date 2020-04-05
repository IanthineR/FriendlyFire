#'
#'Project: analyze data from Friendly Fire podcast
#'
#'Last modified: 4/5/20
#'
#'User: IanthineR
#'

#load libraries
library(tidyverse)
library(ggplot2)
library(readxl)

#load data - xlsx
ff <- read_xlsx("C:/Users/imarr/OneDrive/Programming/R/FF/ff.xlsx")

#ggplot###
#import data
ffgg <- read_excel("C:/Users/imarr/OneDrive/Programming/R/FF/ff.xlsx", sheet="rating")
#use only completed cases
ffgg_comp <- ffgg[complete.cases(ffgg), ]

#host plots####

#plot of rating vs year
ffgg_plot <- ggplot(ffgg_comp,aes(Year, Rating))+
  geom_point(aes(color=Host, shape=Host))
ffgg_plot + labs(title = "Host rating by Film Year")

#plot of rating vs epnum
ffgg_plot_ep <- ggplot(ffgg_comp,aes(Epnum, Rating))+
  geom_point(aes(color=Host, shape=Host))
ffgg_plot_ep + labs(title = "Host rating by Episode Number") + xlab("Episode Number")

#rating histogram
ffgg_hist <- ggplot(ffgg_comp, aes(x=Rating, color=Host))+
  geom_histogram(binwidth = 0.25, alpha=0.1, position = "identity", fill="black")
ffgg_hist + labs(title = "Host rating Histogram")

#adam data####
ff_adam <- subset(ffgg,ffgg$Host=="Adam")

#adam plot - rating vs yr
ff_adamplot <- ggplot(ff_adam,aes(Year, Rating))+
  geom_point(color="red", shape=1)
ff_adamplot + labs(title = "Adam rating by Film Year")

#adam plot - rating vs. ep
ff_adamplotep <- ggplot(ff_adam,aes(Epnum, Rating))+
  geom_point(color="red", shape=1)
ff_adamplotep + labs(title = "Adam rating by Episode Number") + xlab("Episode Number")

#adam rating histogram
adam_hist <- ggplot(ff_adam, aes(x=Rating))+
  geom_histogram(binwidth = 0.25,color="red", fill="red")
adam_hist + labs(title = "Adam rating Histogram")

#ben data####
ff_ben <- subset(ffgg,ffgg$Host=="Ben")

#ben plot - rating vs. yr
ff_benplot <- ggplot(ff_ben,aes(Year, Rating))+
  geom_point(color="black", shape=2)
ff_benplot + labs(title = "Ben rating by Film Year")

#ben plot - rating vs. ep
ff_benplotep <- ggplot(ff_ben,aes(Epnum, Rating))+
  geom_point(color="black", shape=2)
ff_benplotep + labs(title = "Ben rating by Episode Number") + xlab("Episode Number")

#ben rating histogram
ben_hist <- ggplot(ff_ben, aes(x=Rating))+
  geom_histogram(binwidth = 0.25,color="green", fill="green")
ben_hist + labs(title = "Ben rating Histogram")

#john data####
ff_john <- subset(ffgg,ffgg$Host=="John")

#john plot - rating vs. yr
ff_johnplot <- ggplot(ff_john,aes(Year, Rating))+
  geom_point(color="blue", fill="white", shape=0)
ff_johnplot + labs(title = "John rating by Film Year")

#john plot - rating vs. ep
ff_johnplotep <- ggplot(ff_john,aes(Epnum, Rating))+
  geom_point(color="blue", fill="white", shape=0)
ff_johnplotep + labs(title = "John rating by Episode Number") + xlab("Episode Number")

#john rating histogram
john_hist <- ggplot(ff_john, aes(x=Rating))+
  geom_histogram(binwidth = 0.25,color="blue", fill="blue")
john_hist + labs(title = "John rating Histogram")
