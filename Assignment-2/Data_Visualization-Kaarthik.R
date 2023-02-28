# Importing Dataset
Cereal <- read.csv("cereal.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(Cereal)

# Datatypes Check
str(Cereal)

# Datatype Conversion
Cereal$protein <- as.factor(Cereal$protein)
Cereal$fat <- as.factor(Cereal$fat)
Cereal$carbo <- as.factor(Cereal$carbo)
Cereal$calories <- as.factor(Cereal$calories)

# Datatypes Recheck
str(Cereal)

# Express Table for people calories
prop.table(table(Cereal$calories))

# Importing Library
library(ggplot2)


# Calorie calories Count Bar graph
ggplot(Cereal, aes(x = calories)) + theme_classic() + 
  geom_bar() + 
  labs(y = "Calorie count", title = "Cereal calories Count")


# Protein wise calories Plot
ggplot(Cereal, aes(x = protein, fill = calories)) + theme_light() + 
  geom_bar() + 
  labs(y = "Passenger count", 
       title = "Cereal calories Count by protein")


# Plot for calories based on fat
ggplot(Cereal, aes(x = fat, fill = calories)) + theme_light() + 
  geom_bar() + 
  labs(y = "Passenger count", 
       title = "Cereal calories Count by fat")


# Plot for protein based calories from fat
ggplot(Cereal, aes(x = protein, fill = calories)) + theme_light() + 
  facet_grid(~fat) + geom_bar() + 
  labs(y = "Calorie count", 
       title = "Cereal calories Count by fat and protein")


# Pie chart for calories ratio in fat
ggplot(Cereal, aes(x = "", fill = calories)) + 
  geom_bar(position = "fill") + 
  facet_grid(~fat) + coord_polar(theta = "y")


# Plot for rating distribution
ggplot(Cereal, aes(x = rating)) + theme_bw() + 
  geom_histogram(binwidth = 5) + 
  labs(y = "Cereal count", x = "rating", 
       title = "Cereal rating distribution")


# Box Plot for calories by rating
ggplot(Cereal, aes(x = calories, y = rating)) + theme_bw() + 
  geom_boxplot() + 
  labs(y = "age", x = "calories", 
       title = "Cereal calories by rating")


# Density plot
ggplot(Cereal, aes(x = rating, fill = calories)) + theme_bw() + 
  facet_wrap(protein~fat) + geom_density(alpha = 0.5) + 
  labs(y = "rating", x = "calories", 
       title = "Cereal rating by calorie, fat and protein")