# Inverse matrix and cache it's value in case it's
# requested again to save time
# we assume all arguments passed to the function are invertible
makeCacheMatrix <- function(matrix) {
  # accepts a matrix data type
  # makes an matrix object with 4 methods.
  
  # invertedMatrix variable to hold inverted matrix-
  # data in makeCacheMatrix function's scope
  invertedMatrix <- NULL
  
  # first method to setMatrix to the argument
  setMatrix <- function(newMatrix) {
    matrix <<- newMatrix
  }
  # second method to set InvertedMatrix to the inverted
  setInvertedMatrix <- function(inverse) {
    invertedMatrix <<- inverse
  }
  # third method to get matrix before inversion
  getMatrix <- function() {
    return (matrix)
  }
  # forth method to get matrix after inversion
  getInvertedMatrix <- function() {
    return (invertedMatrix)
  }
  # returns list with the four methods
  return(
    list(
      setMatrix = setMatrix,
      setInvertedMatrix = setInvertedMatrix,
      getMatrix = getMatrix,
      getInvertedMatrix = getInvertedMatrix
    )
  )
}
