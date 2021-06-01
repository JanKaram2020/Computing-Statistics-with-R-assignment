my_mode <- function(vector) {
  uniqueValues <- unique(vector)
  modeOfVector <- NULL
  
  #if(number of elements in vector==elements in unique values)=>no reps=>no mode
  if (length(vector) == length(uniqueValues)) {
    return(modeOfVector)
  }
  #frequencies vector to count repetitions of elements
  frequencies <- rep(0, length(uniqueValues))
  
  # to store repetitions in frequencies vector
  for (i in 1:length(uniqueValues)) {
    for (j in 1:length(vector)) {
      if (uniqueValues[i] == vector[j]) {
        frequencies[i] = frequencies[i] + 1
      }
    }
  }
  
  # if (mean of frequencies = max frequency){return null} to avoid doubles
  if (mean(frequencies) == max(frequencies)) {
    return(modeOfVector)
  }
  
  # Find and return the mode
  maxFrequency <- which.max(frequencies)
  modeOfVector <- uniqueValues[maxFrequency]
  return(modeOfVector)
}
vec = c(3, 5, 13, 5, 13, 3)
print(my_mode(vec))