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
read.delim("hangman.txt")
# Instead I will use R to create a one column text file. 
# I do not want to tell the user the possible words so see script named "WordsScript" so I made a new file
# The file in this repo named hangman4.txt is the file I desire (hangman2.txt and hangman3 can be ignored since it was not in the desired format)
# Read the file
read.delim("hangman4.txt")



