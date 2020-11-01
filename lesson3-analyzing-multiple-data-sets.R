# lesson3-analyzing-multiple-data-sets.R

# We have created a function called analyze that creates graphs of the minimum,
# average, and maximum daily inflammation rates for a single data set:

analyze <- function(filename) {
    # Plots the average, min, and max inflammation over time.
    # Input is character string of a csv file.
    dat <- read.csv(file = filename, header = FALSE)
    avg_day_inflammation <- apply(dat, 2, mean)
    plot(avg_day_inflammation)
    max_day_inflammation <- apply(dat, 2, max)
    plot(max_day_inflammation)
    min_day_inflammation <- apply(dat, 2, min)
    plot(min_day_inflammation)
  }

analyze("data/inflammation-01.csv")

# We can use it to analyze other data sets one by one:
analyze("data/inflammation-02.csv")

###

# Suppose we want to print each word in a sentence. One way is to use six print statements:

best_practice <- c("Let", "the", "computer", "do", "the", "work")
print_words <- function(sentence) {
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}

print_words(best_practice)

# works, but not variable and scalable
# Here’s a better approach:

print_words <- function(sentence){
  for (word in sentence) {
    print(word)
  }
}

print_words(best_practice)

## MORE GENERAL FORM
# for (variable in collection){
#   do things with variable
# }

## Look at this
len <- 0
vowels <- c("a", "e", "i", "o", "u")
class(vowels) # [1] "integer"
for (v in vowels) {
  len <- len + 1
}
# Number of vowels
len
#
# [1] 5

## Try it again
len <- 0
# vowels <- c("y","m","c","a")
vowels <- seq(1:100)
for (v in vowels) {
  len <- len + 1
}
len
# [1] 4
# [1] 100

## Note that this code is not detecting or counting vowels; it is counting
## how many elements are in a vector

### Another example
letter <- "z"
for (letter in c("a", "b", "c")) {
  print(letter)
}
# [1] "a"
# [1] "b"
# [1] "c"
# after the loop, letter is
letter
# [1] "c"

# seq(3)
# [1] 1 2 3
#Using seq, write a function that prints the first N natural numbers,
# one per line:

# print_N(3)
# [1] 1
# [1] 2
# [1] 3

print_N <- function(my_seq){
  myseq <- seq(my_seq)
  for (n in myseq){
    print(n)
    }
}

print_N(1000)

### EXERCISE; DIY SUM FUNCTION

# Write a function called total that calculates the sum of the values in a
# vector. (R has a built-in function called sum that does this for you. Please
# don’t use it for this exercise.)

ex_vec <- c(4, 8, 15, 16, 23, 42)
# total(ex_vec)
# [1] 108

total <- function(my_vec){
  my_sum = 0 # Must be initialized/declared for this to work
  for (el in my_vec){
  my_sum <- my_sum + el
  }
  return(my_sum) # Must be outside of loop for this to work as intended
}

total(ex_vec)


### USING FUNCTIONS AND LOOPS TO PROCESS MULTIPLE FILES

### Read multiple files of a disired type
list.files(path = "data", pattern = "csv")
# [1] "car-speeds-cleaned.csv" "car-speeds.csv"         "inflammation-01.csv"    "inflammation-02.csv"
# [5] "inflammation-03.csv"    "inflammation-04.csv"    "inflammation-05.csv"    "inflammation-06.csv"
# [9] "inflammation-07.csv"    "inflammation-08.csv"    "inflammation-09.csv"    "inflammation-10.csv"
# [13] "inflammation-11.csv"    "inflammation-12.csv"    "sample.csv"             "small-01.csv"
# [17] "small-02.csv"           "small-03.csv"

list.files(path = "data", pattern = "inflammation")
# [1] "inflammation-01.csv" "inflammation-02.csv" "inflammation-03.csv" "inflammation-04.csv" "inflammation-05.csv"
# [6] "inflammation-06.csv" "inflammation-07.csv" "inflammation-08.csv" "inflammation-09.csv" "inflammation-10.csv"
# [11] "inflammation-11.csv" "inflammation-12.csv"

## Example using analyze() created in lesson 1 to process first three data sets
filenames <- list.files(path = "data",
                        # Now follows a regular expression that matches:
                        pattern = "inflammation-[0-9]{2}.csv",
                        #          |            |        the standard file extension of comma-separated values
                        #          |            the variable parts (two digits, each between 0 and 9)
                        #          the static part of the filenames
                        full.names = TRUE)
filenames <- filenames[1:3]
for (f in filenames) {
  print(f)
  analyze(f)
}


