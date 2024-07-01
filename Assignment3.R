# Assignment #3
# BTC 1855H
# Kimberly Corneil
# July 2, 2024

## My master plan for a super fun game of hangman
#' Make a txt file on my mac and save it as "words.txt"
#' Read the word file with R
#' Use sample() to choose the word (it is secret so that you can play too)
#' Using nchar() let the user know the word is 7 letters long
#' I have decided to be nice so I will let the user know they have 10 tries 
#' Finally, I will ask them for their input with the readline() prompt 
#' I will check that the input is a single letter character
#' If the letter is in the word I will let them know they have found a letter and where in the word it is
#' If the letter is not in the word I will tell them sadly that they have not found a letter and ask them to try again
#' I will let them know each time how many attempts they have left
#' If they fail I will let them know they have lost and reveal the secret word
#' If they get it I will let them know they are a winner :))

# Install stringr
install.packages("stringr")
library(stringr)

# Issue with line 7 of my master plan. Making a text file on my mac added a bunch of unwanted things 
read.delim("hangman.txt")
# Instead I will use R to create a one column text file. 
# I do not want to tell the user the possible words so see script named "WordsScript" so I made a new file
# The file in this repo named hangman4.txt is the file I desire (hangman2.txt and hangman3 can be ignored since it was not in the desired format)
# Read the file and name it bob. make it a matrix to separate the words into characters
bob <- as.matrix(read.table("hangman6.txt"))
length(bob)
typeof(bob)

# sample a random word from bob (error in plan line 9, sample chooses a random word, it does not let me pick one)
my_word <- sample(bob, size = 1)

# explain the rules to the user. 
cat(paste("Welcome to Kim's super fun game of hangman!", "\n", 
          "Today you will be guessing my word.", "\n", 
          "The word is", nchar(my_word), "letters long.", "\n", 
          "You will have 10 guesses to get it right.", "\n", 
          "Have fun and don't lose."))

# set "display" which will show the user how many letters they have in the word and where they are. 
# at the beginning, display is underscores
display <- c("_", "_", "_", "_", "_", "_", "_")
# set "counter" to keep track of how many attempts the user has used
# at the beginning, counter is 0 as the game has not started 
counter <- 0

# create the repeat loop for hangman so that it will continue until it encounters one of two breaks (if the counter hits 10 or if the correct word is guessed)
repeat{
  # make the counter to keep track of the amount of times the user has inputted
  counter <- counter + 1
  # readline prompt to ask the user for an input. CHANGE TO ALLOW FOR 7 WORDS
  letter <- readline(prompt = "Please enter a single letter: ")
  # check that the user has not exceeded the maximum number of tries
  if (counter == 10 ){
    stop("Maximum number of tries exceeded. YOU LOSE! The word was ", my_word)
    # check that the user has inputted something or length 1
  } else if (nchar(letter) != 1){
    print("Entry was not a single digit. Please try again and do better this time, you have", 10-counter, "tries left")
    # check that the user has inputted a letter ### CHECK HERE THAT CAPITALS ARE ACCEPTED!!!!!
  } else if (grepl("[^A-Za-z]", letter)) {
    print("Entry was not a letter. Please try again and do better this time, you have", 10-counter, "tries left")
    # check that the user has not exceeded the maximum number of tries
  } else if (!grepl(letter, my_word)) {
    print(paste("No", letter, "does not appear in the word. You have",10-counter," tries left"))
    next
  }else if (grepl(letter, my_word)) {
    # if the letter is in the word, use gregexpr to get the position of the letter
    ugh <- gregexpr(letter, my_word)[[1]]
    # replace letter in display at position ugh
    display[ugh] <- letter 
    # collapse display so that it is a single word
    display <- paste(display, collapse = "") 
    if (display == my_word) {
      print(paste("Winner winner chicken dinner, you got it! The word was", my_word))
      break
    } else {
      # paste the results and let the user know whats up
      print(paste("Yay!", letter, "appears in the word", display, "You have",10-counter,"tries left. Please input the next letter"))
      # make display back into individual letters for next time. 
      display <- unlist(strsplit(display, ""))  
      next
    }
  }
}

## END 
## its always two steps forward and one step back
## TO DO LIST: 
### see if the user can enter capital letters. if not, let them know it must be lower case
### allow the user to attempt to input the full word

