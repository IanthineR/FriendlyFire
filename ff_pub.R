#'
#'Project: analyze data from Friendly Fire podcast
#'
#'Last modified: 4/16/20
#'
#'User: IanthineR
#'

#load libraries
library(tidyverse)
library(ggplot2)
library(readxl)

# Libraries and raw data --------------------------------------------------

#load libraries
library(tidyverse)
library(readxl)
library(lattice)

#raw data
ff <- read_xlsx("C:/Users/Ian/OneDrive/Programming/R/FF/ff.xlsx")


# ggplot ------------------------------------------------------------------

#import data
ffgg <- read_excel("C:/Users/Ian/OneDrive/Programming/R/FF/ff.xlsx", sheet="rating")
ffgg <- as_tibble(ffgg)

# * All host plots ------------------------------------------------------------

#faceted plot separated by host; year vs rating 
#with trendlines
yvr_plot <- ggplot(ffgg,aes(year,rating))+
  geom_point(aes(color=host))+
  geom_line(aes(color=host))+
  geom_smooth()+
  facet_wrap(~host,nrow=1)
yvr_plot

#faceted plot separated by host; epnum vs rating 
#with trendlines
evr_plot <- ggplot(ffgg,aes(epnum,rating))+
  geom_point(aes(color=host))+
  geom_line(aes(color=host))+
  geom_smooth()+
  facet_wrap(~host,nrow=1)+
  xlab("Episode Number")
evr_plot

#plot of rating vs year
ffgg_plot <- ggplot(ffgg,aes(year, rating))+
  geom_point(aes(color=host, shape=host))
ffgg_plot + labs(title = "host rating by film year")

#plot of rating vs epnum
ffgg_plot_ep <- ggplot(ffgg,aes(epnum, rating))+
  geom_point(aes(color=host, shape=host))
ffgg_plot_ep + labs(title = "host rating by Episode Number") + xlab("Episode Number")

#rating histogram
ffgg_hist <- ggplot(ffgg, aes(x=rating, color=host))+
  geom_histogram(binwidth = 0.25, alpha=0.1, position = "identity", fill="black")
ffgg_hist + labs(title = "host rating Histogram")

#density plot
rden <- ggplot(ffgg,aes(rating,color=host))+
  geom_density(alpha=0.5,position = 'identity',linetype="dashed",aes(color=host))+
  ylab("Frequency of rating")+
  xlab("Rating")
rden

# * Adam data ---------------------------------------------------------------

ff_adam <- subset(ffgg,ffgg$host=="Adam")

#adam plot - rating vs yr
ff_adamplot <- ggplot(ff_adam,aes(year, rating))+
  geom_point(color="red", shape=1)
ff_adamplot + labs(title = "Adam rating by film year")

#adam plot - rating vs. ep
ff_adamplotep <- ggplot(ff_adam,aes(epnum, rating))+
  geom_point(color="red", shape=1)
ff_adamplotep + labs(title = "Adam rating by Episode Number") + xlab("Episode Number")

#adam rating histogram
adam_hist <- ggplot(ff_adam, aes(x=rating))+
  geom_histogram(binwidth = 0.25,color="red", fill="red")
adam_hist + labs(title = "Adam rating Histogram")


# * Ben data ----------------------------------------------------------------

ff_ben <- subset(ffgg,ffgg$host=="Ben")

#ben plot - rating vs. yr
ff_benplot <- ggplot(ff_ben,aes(year, rating))+
  geom_point(color="black", shape=2)
ff_benplot + labs(title = "Ben rating by film year")

#ben plot - rating vs. ep
ff_benplotep <- ggplot(ff_ben,aes(epnum, rating))+
  geom_point(color="black", shape=2)
ff_benplotep + labs(title = "Ben rating by Episode Number") + xlab("Episode Number")

#ben rating histogram
ben_hist <- ggplot(ff_ben, aes(x=rating))+
  geom_histogram(binwidth = 0.25,color="green", fill="green")
ben_hist + labs(title = "Ben rating Histogram")


# * John data ---------------------------------------------------------------

ff_john <- subset(ffgg,ffgg$host=="John")

#john plot - rating vs. yr
ff_johnplot <- ggplot(ff_john,aes(year, rating))+
  geom_point(color="blue", fill="white", shape=0)
ff_johnplot + labs(title = "John rating by film year")

#john plot - rating vs. ep
ff_johnplotep <- ggplot(ff_john,aes(epnum, rating))+
  geom_point(color="blue", fill="white", shape=0)
ff_johnplotep + labs(title = "John rating by Episode Number") + xlab("Episode Number")

#john rating histogram
john_hist <- ggplot(ff_john, aes(x=rating))+
  geom_histogram(binwidth = 0.25,color="blue", fill="blue")
john_hist + labs(title = "John rating Histogram")