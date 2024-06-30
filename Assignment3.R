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
cat(paste("Welcome to Kim's super fun game of hangman.", "\n", 
          "Today you will be guessing my word.", "\n", 
          "The word is", nchar(my_word), "letters long.", "\n", 
          "You will have 10 guesses to get it right.", "\n", 
          "Have fun and don't lose."))

display <- c("_", "_", "_", "_", "_", "_", "_")


# attempt to create the hangman game... first try, I am not very hopeful but we shall see
# use a repeat loop 

repeat{
  letter <- readline(prompt = "Please enter a single letter: ")
  if (nchar(letter) != 1){
    stop("Entry was not a single digit. Please try again and do better this time.")
  } else if (grepl("[^A-Za-z]", letter))
    stop("Entry was not a letter. Please try again and do better this time.")
  else for (i in 1:10) {
    if (!grepl(letter, my_word)) {
      print(paste("No", letter, "does not appear in the word. You have",10-i," tries left"))
      break
    } else if (grepl(letter, my_word)) 
      ugh <- gregexpr(letter, my_word)[[1]]
    display[ugh] <- letter 
    display <- paste(display, collapse = "")
    print(paste("Yay!", letter, "appears in the word", display, "You have",10-i,"tries left. Please input the next letter"))
    display <- unlist(strsplit(display, ""))
    break 
  }
}
### WHY WAS DISPLAY WORKING HERE BUT IT ISNT IN MY UPDATED LOOOOOOP!!!!! 
  # I have a few problems I need to solve. 
  #' I do want to show the user where their letters are. SOLVED! 
  #' I also need to fix the number of attempts they have!!!
  #' I also need to have a end result where they have found the word!!!
  }

## This is what was working before in case I screw up and loose it all: 
display <- c("_", "_", "_", "_", "_", "_", "_")
counter <- 0
letter <- c("c")
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
  }else if (grepl(letter, my_word)) {
    # if the letter is in the word, use gregexpr to get the position of the letter
        ugh <- gregexpr(letter, my_word)[[1]]
    # replace letter in display at position ugh
        display[ugh] <- letter 
    # collapse display so that it is a single word
        display <- paste(display, collapse = "")
    # paste the results and let the user know whats up
        print(paste("Yay!", letter, "appears in the word", display, "You have",10-counter,"tries left. Please input the next letter"))
    # make display back into individual letters for next time. 
        display <- unlist(strsplit(display, ""))  
        next
  }
  # check if the user has gotten it
  if (display <- paste(display, collapse = "") == my_word) {
    print(paste("Winner winner chicken dinner, you got it! The word was ", my_word))
    break
  }
}
## END 
## its always two steps forward and one step back
## now display works but if you get the word right it does not go to the next part
## TO DO LIST: 
### fix the issue so that the user can win
### allow the user to attempt to input the full word

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
  } 
  if (!grepl(letter, my_word)) {
    print(paste("No", letter, "does not appear in the word. You have",10-counter," tries left"))
  }else if (grepl(letter, my_word)) {
    # if the letter is in the word, use gregexpr to get the position of the letter
    ugh <- gregexpr(letter, my_word)[[1]]
    # replace letter in display at position ugh
    display[ugh] <- letter 
    # collapse display so that it is a single word
    display <- paste(display, collapse = "")
  } if (display == my_word){
    print(paste("Winner winner chicken dinner, you got it! The word was ", my_word))
  break
} else 
    # paste the results and let the user know whats up
    print(paste("Yay!", letter, "appears in the word", display, "You have",10-counter,"tries left. Please input the next letter"))
    # make display back into individual letters for next time. 
    display <- unlist(strsplit(display, ""))
    next
}

# practice to figure it out
?for
kay <- c("p")
poop <- c("poopies")
length(poop)
length(display)
newpoo <- unlist(strsplit(poop, ""))
length(newpoo)

!grepl(kay, poop)
length(grep(kay, poop))
sum(grepl(kay, poop))
str_count(poop, kay)
str_sort(poop, kay)
str_extract_all(poop, kay)
str_view(poop, kay)
str_locate_all(poop, kay)
gregexpr(kay, newpoo)[[1]]
gregexpr(kay, poop)[[1]]

ugh <- gregexpr(kay, poop)[[1]]
display[ugh] <- kay 


grep()

gsub(display, kay, str_count(poop, kay), ignore.case = TRUE)

str_replace(display, "_", str_locate_all(poop, kay), ignore.case = TRUE)

# Kim get the position of where the letter is

display[gregexpr(kay, poop)] = kay


for (i in 1:10) {
  if (!grepl(kay, poop)) {
    print(paste("No", kay, "does not appear in the word. You have",10-i," tries left"))
    break
  } else {
    print(paste("Yay!", kay, "appears in the word", str_count(poop, kay), "times"))
}}


for (i in 1:10) {
  if (grepl(kay, poop)) {
    print(paste("Yay!", kay, "appears in the word", str_count(poop, kay), "times"))
  } else {
    next
  }}




if (grepl(letter, my_word)) {
  print(paste("Yay!", letter, "appears in the word", str_count(my_word, letter), "times")))


