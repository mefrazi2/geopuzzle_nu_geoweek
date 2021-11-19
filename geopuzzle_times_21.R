times <- read.csv("times.csv")

boxplot(times$North.America,
        times$Latin.America,
        times$World,
        times$Africa.and.Middle.East,
        times$Europe, times$Asia,
        main = "Distribution of Geopuzzle Challenge Final Times for 2021",
        xlab = "Puzzle Category",
        ylab = "Time in minutes",
        col = "white",
        border = "brown"
        )

# Meh. Colors weren't working. So I'm going to try ggplot2 - 
# Yay - this one works very well!

library(ggplot2)
library(RColorBrewer)
library(tidyverse)

theme_set(theme_bw(base_size = 16))

time_data <- read.csv("boxplot.csv")

time_data %>%
  ggplot(aes(x=Puzzle, y=Time, color=Puzzle)) +
  geom_boxplot()+
  geom_jitter(width=0.15, alpha=0.5)+
  labs(title = "Distribution of Final Times for Geopuzzle Challenge 2021", 
       x="Puzzle Type", 
       y = "Time (minutes)") +
  scale_x_discrete(guide = guide_axis(n.dodge=2))+
  theme(legend.position="none")

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