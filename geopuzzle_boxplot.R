library(ggplot2)
library(RColorBrewer)
library(tidyverse)

time_data <- read.csv("times22.csv")

theme_set(theme_bw(base_size = 16))

times <- time_data %>%
  ggplot(aes(x=Puzzle, y=Time, color=Puzzle)) +
  geom_boxplot()+
  geom_jitter(width=0.1, alpha=0.5)+
  scale_y_log10()+
  theme(plot.title = element_text (hjust = 0.5)) +
  labs(title = "Distribution of Times for Geopuzzle Challenge '22",
       x="Puzzle Type", 
       y = "Time (minutes)") +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 15)) + # wrapping x-axis labels
  #scale_x_discrete(guide = guide_axis(n.dodge=2))+
  theme(legend.position="none")

times

# Other type of Box Plot with color
time_data %>%
  ggplot(aes(x=Puzzle, y=Time, fill=Puzzle)) +
  geom_boxplot()+
  geom_jitter(width=0.15, alpha=0.5)+
  scale_y_log10()+
  labs(title = "Distribution of Final Times for Geopuzzle Challenge 2021", 
       x="Puzzle Type", 
       y = "Time (minutes)") +
  theme(legend.position="none")+
  scale_x_discrete(guide = guide_axis(n.dodge=2))+
  scale_fill_brewer(palette="OrRd")
