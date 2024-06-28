# Script for words for assignment 3
my_words <- c("chicken", "sizzle", "cabbage", "iceberg", "macaron", "pacific", "rabbits", "ukelele", "vaccine")


# Make my words a one column data frame
hangman2 <- data.frame(my_words)

# view hangman2
View(hangman2)

# export hangman2 as a 1 column text file
# use sep = \t to separate the words by tabs
# call it hangman3 because I made hangman2 earlier but did not like the format
# use row.names and col.names = F to remove names 
# use quote = F so that quotes are not around the words
write.table(hangman2, file = "hangman4.txt", row.names = F, quote= F, sep = "\t")
