

x = seq(-5, 5, 0.01)

y = rnorm(x, 10, .7) * x + rnorm(x, mean = 0, sd = 1)

y2 = rnorm(x, 4, .7) * x + rnorm(x, mean = 0, sd = 1)

df = data.frame(
  x, y, y2
)


# library(ggplot2)

ggplot(data = NULL) + 
  geom_point(data = df , aes(x = x, 
                            y = y), 
             color = 'darkred',
             alpha = .2) + 
  geom_smooth(data = df, aes(x = x, y = y),
              color = 'darkred') + 
  geom_point(data = df, aes(x = x, y = y2), 
             color = 'darkgreen', alpha = .2) + 
  geom_smooth(data = df, aes(x = x, y = y2), 
              color = 'darkgreen') + 
  labs(title = "Extreme climatic events buffering",
       x = "Macroclimatique temperature",
       y = "Ecosystem temperature") +
  annotate(geom = 'segment', 
           x = -5, xend = -5, 
           y = -50, yend = -25,
           arrow = arrow(length=unit(.2,"cm")),
           size = 1) + 
  annotate(geom = 'segment', 
           x = 5, xend = 5, 
           y = 50, yend = 25,
           arrow = arrow(length=unit(.2,"cm")),
           size = 1) +
  annotate(geom = 'text', 
           x = -2, y = -30,
           label = "Low diversity ecosystem",
           size = 4, color = 'darkred', 
           angle = 30) +
  annotate(geom = 'text', 
           x = -2.5, y = 0,
           label = "High diversity ecosystem",
           size = 4, color = 'darkgreen', 
           angle = 10) +
  theme_classic() + 
  theme(axis.text = element_blank())


df.2 = data.frame(
  x, 
  y = cos(1.2*x) + 1.5*sin(1.2*x) + rnorm(x, mean = 0, sd = .1),
  y2 = .6*cos(1.2*x) + 1.0*sin(1.2*x) + rnorm(x, mean = 0, sd = .1)
)

ggplot(data = NULL) + 
  geom_point(data = df.2 , 
             aes(x = x,
                 y = y), 
             color = 'darkred',
             alpha = .2) + 
  geom_smooth(data = df.2, aes(x = x, y = y),
              color = 'darkred') +
  geom_point(data = df.2, aes(x = x, y = y2),
             color = 'darkgreen', alpha = .2) +
  geom_smooth(data = df.2, aes(x = x, y = y2),
              color = 'darkgreen') +
  labs(title = "Temperature buffering",
       x = "Time",
       y = "Temperature") +
  annotate(geom = 'segment',
           x = -4.4, xend = -4.4,
           y = 1.7, yend = 1.2,
           arrow = arrow(length=unit(.2,"cm")),
           size = 1) +
  annotate(geom = 'segment',
           x = 1, xend = 1,
           y = 1.7, yend = 1.2,
           arrow = arrow(length=unit(.2,"cm")),
           size = 1) +
  annotate(geom = 'segment',
           x = 3.4, xend = 3.4,
           y = -1.7, yend = -1.2,
           arrow = arrow(length=unit(.2,"cm")),
           size = 1) +
  annotate(geom = 'segment',
           x = -1.7, xend = -1.7,
           y = -1.7, yend = -1.2,
           arrow = arrow(length=unit(.2,"cm")),
           size = 1) +
  annotate(geom = 'text',
           x = -2.5, y = 1.5,
           label = "Low diversity\necosystem",
           size = 4, color = 'darkred') +
  annotate(geom = 'text',
           x = -4.4, y = 0,
           label = "High diversity\necosystem",
           size = 4, color = 'darkgreen') +
  theme_classic() + 
  theme(axis.text = element_blank())
