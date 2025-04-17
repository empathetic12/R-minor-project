library(ggplot2)
library(dplyr)
library(tidyr)

students_data <- data.frame(
  Student = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Math = c(85, 92, 78, 88, 95),
  English = c(88, 79, 91, 85, 96)
)

students_data_long <- students_data %>%
  pivot_longer(cols = starts_with("Math"):starts_with("English"), 
               names_to = "Subject", 
               values_to = "Score")

ggplot(students_data_long, aes(x = Student, y = Score, fill = Subject)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Scores of Students in Different Subjects", 
       x = "Student", 
       y = "Score") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(students_data_long, aes(x = Subject, y = Score, fill = Subject)) +
  geom_boxplot() +
  labs(title = "Boxplot of Scores in Different Subjects", 
       x = "Subject", 
       y = "Score") +
  theme_minimal()

ggplot(students_data, aes(x = Math)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Math Scores", x = "Math Score", y = "Frequency") +
  theme_minimal()

ggplot(students_data, aes(x = English)) +
  geom_histogram(binwidth = 2, fill = "lightgreen", color = "black", alpha = 0.7) +
  labs(title = "Distribution of English Scores", x = "English Score", y = "Frequency") +
  theme_minimal()
