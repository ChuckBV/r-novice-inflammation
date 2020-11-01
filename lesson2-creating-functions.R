# lesson2-creating-functions.R

### BEGINNING EXAMPLE
fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

fahrenheit_to_celsius(32)
# [1] 0

fahrenheit_to_celsius(32)

### PRACTICE ASSIGNMENT

## Asignment A
# In the last lesson, we learned to combine elements into a vector using the
# c function, e.g. x <- c("A", "B", "C") creates a vector x with three elements.
# Furthermore, we can extend that vector again using c, e.g. y <- c(x, "D")
# creates a vector y with four elements. Write a function called highlight that
# takes two vectors as arguments, called content and wrapper, and returns a new
# vector that has the wrapper vector at the beginning and end of the content:

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"  # R interprets a variable with a single value as a vector
# with one element.
highlight(best_practice, asterisk)
# [1] "***"       "Write"     "programs"  "for"       "people"    "not"
# [7] "computers" "***"

highlight <-function(content,wrapper){
  hl <- c(wrapper,content,wrapper)
  return(hl)
}
highlight(best_practice,asterisk)


##Asignment B

# If the variable v refers to a vector, then v[1] is the vector’s first element
# and v[length(v)] is its last (the function length returns the number of
# elements in a vector). Write a function called edges that returns a vector
# made up of just the first and last elements of its input:
#
dry_principle <- c("Don't", "repeat", "yourself", "or", "others")
edges(dry_principle)
# [1] "Don't"  "others"

edges <-function(v){
  out <- c(v[1],v[length(v)])
  return(out)
}

### RETURN TO TESTING, ERROR HANDLING, AND DOCUMENTING
