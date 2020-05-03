#'
#'Project: analyze data from Friendly Fire podcast
#'
#'Last modified: 5/2/20
#'
#'User: IanthineR
#'


# Libraries and raw data --------------------------------------------------

#load libraries
library(tidyverse)
library(readxl)
library(ggridges)

#raw data
ff <- read_xlsx("C:/Users/Ian/OneDrive/Programming/R/FF/ff.xlsx")


# ggplot ------------------------------------------------------------------

#import data
ffgg <- read_excel("C:/Users/Ian/OneDrive/Programming/R/FF/ff.xlsx", sheet="rating")
ffgg <- as_tibble(ffgg)

# Weekly ------------------------------------------------------------

#Density plot of ratings separated by host
ffden <- ggplot(ffgg,aes(x=rating,y=host))+
  geom_density_ridges(aes(fill=host))
ffden

#faceted plot separated by host; year vs rating 
#with trendlines
yvr_plot <- ggplot(ffgg,aes(year,rating))+
  geom_point(aes(color=host))+
  geom_line(aes(color=host))+
  geom_smooth()+
  scale_y_continuous(name = "Rating",breaks = seq(0,6,0.25))+
  facet_wrap(~host,nrow=1)
yvr_plot

#faceted plot separated by host; epnum vs rating 
#with trendlines
evr_plot <- ggplot(ffgg,aes(epnum,rating))+
  geom_point(aes(color=host))+
  geom_line(aes(color=host))+
  geom_smooth()+
  facet_wrap(~host,nrow=1)+
  scale_y_continuous(name = "Rating",breaks = seq(0,6,0.25))+
  xlab("Episode Number")
evr_plot

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