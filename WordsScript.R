# Script for words for assignment 3
my_words <- c("chicken", "sizzle", "cabbage", "iceberg", "macaron", "pacific", "rabbits", "ukelele", "vaccine")
length(my_words)

# Make my words a one column data frame
hangman2 <- matrix(my_words)
length(hangman2)
str(hangman2)

# view hangman2
View(hangman2)

# export hangman2 as a 1 column text file
# use sep = \t to separate the words by tabs
# call it hangman3 because I made hangman2 earlier but did not like the format
# use row.names = F to remove names 
# use quote = F so that quotes are not around the words
write.table(hangman2, file = "hangman6.txt", row.names = F, col.names = F, sep = "\t")
