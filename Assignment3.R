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

# Issue with line 7 of my master plan. Making a text file on my mac added a bunch of unwanted things 
read.delim("hangman6.txt")
# Instead I will use R to create a one column text file. 
# I do not want to tell the user the possible words so see script named "WordsScript" so I made a new file
# The file in this repo named hangman6.txt is the file I desire (hangman2.txt to hangman5.txt can be ignored since it was not in the desired format)
# I though the error was in how I was making the file but it turns out it was how I was reading it here so that is why there are so many hangman#.txt files
# Read the file and name it bob. make it a matrix to separate the words into characters
bob <- as.matrix(read.table("hangman6.txt"))

# sample a random word from bob (error in plan line 9, sample chooses a random word, it does not let me pick one)
my_word <- sample(bob, size = 1)

# set "display" which will show the user how many letters they have in the word and where they are. 
# at the beginning, display is underscores
# I forgot to add this into my plan, it should have been after line 11 (for "display" and "counter")
display <- c("_", "_", "_", "_", "_", "_", "_")
# set "counter" to keep track of how many attempts the user has used
# at the beginning, counter is 0 as the game has not started 
counter <- 0

# explain the rules to the user. 
# As per line 11 I am being nice and letting the user have 10 tries
# I was confused while making my word file so all of the potential words have 7 letters, but use nchar(my_word) to be sure
cat(paste("Welcome to Kim's super fun game of hangman!", "\n", 
          "Today you will be guessing my to secret word.", "\n", 
          "The word is", nchar(my_word), "letters long.", "\n", 
          "You will have 10 guesses to get it right.", "\n", 
          "Have fun and don't lose."))

# create the repeat loop for hangman so that it will continue until it encounters one of two breaks (if the counter hits 10 or if the correct word is guessed)
# my master plan was not a very masterful plan. It was so not masterful in fact that although steps 12-18 are included in my loop, I missed many other steps also included in my loop
# I have indicated the steps I missed in my plan with a * for simplicity. 
repeat{
  # make the counter add one each time the loop runs to keep track of the amount of times the user has inputted*
  counter <- counter + 1
  # readline prompt to ask the user for an input of a single letter of a 7 letter guess 
  letter <- readline(prompt = "Please enter a single letter or 7 letter guess: ")
  # change the input to lower case so that if the user enters a capital letter that is accepted* 
  letter <- tolower(letter)
  # check that the user has not exceeded the maximum number of tries*
  if (counter == 10 ){
    stop("Maximum number of tries exceeded. YOU LOSE! The word was ", my_word)
    # check that the user has inputted a letter 
  } else if (grepl("[^a-z]", letter)) {
    print(paste("Entry was not a letter. Please try again and do better this time, you have", 10-counter, "tries left"))
    # check that the user has inputted something or length 1 or 7*
  } else if (nchar(letter) != 1 & nchar(letter) != 7){
    print(paste("Entry was not a 1 or 7 letters. Please try again and do better this time, you have", 10-counter, "tries left"))
    # if the input is 7 letters long check if it is the word*
  } else if (nchar(letter) == 7) {
    if (letter != my_word){
      print(paste("The word you have guessed is incorrect. You have", 10-counter, "tries left. Please try again"))
    } else if (letter == my_word){
      print(paste("Winner winner chicken dinner, you got it! The word was", my_word))
      break
    }
  }
  # if the input is not 7 letters long (1 letter) check if the letter entered is in the word
  else if (!grepl(letter, my_word)) {
    print(paste("No", letter, "does not appear in the word. You have",10-counter,"tries left"))
    next
  }else if (grepl(letter, my_word)) {
    # if the letter is in the word, use gregexpr to get the position of the letter*
    ugh <- gregexpr(letter, my_word)[[1]]
    # replace letter in "display" at position "ugh"*
    display[ugh] <- letter 
    # collapse display so that it can be printed as a single word*
    display <- paste(display, collapse = "") 
    # check if the user has got the word using individual letters
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
