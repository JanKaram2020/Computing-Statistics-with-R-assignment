# <<- allows you to assign value in the outer scope

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

# checks if value exists in cache and return it
# else compute the value and return it
cacheSolve <- function(matrix) {
  #variable to hold InvertedMatrix's value
  invertedMatrix <- matrix$getInvertedMatrix()
  
  if (!is.null(invertedMatrix)) {
    # if invertedMarix not empty return it from cache
    return(invertedMatrix)
  }
  
  # else compute it and return it
  invertedMatrix <- solve(matrix$getMatrix())
  matrix$setInvertedMatrix(invertedMatrix)
  return(invertedMatrix)
}

# speed test function to check if previous functions working
speedTest <- function(matrix) {
  temporary = makeCacheMatrix(matrix)
  
  # calculates time took for first calculation then prints it
  startTime = Sys.time()
  cacheSolve(temporary)
  duration = Sys.time() - startTime
  print(duration)
  
  # calculates time took to return value form cache then prints it
  startTime = Sys.time()
  cacheSolve(temporary)
  duration = Sys.time() - startTime
  print(duration)
}

# random numbers from normal population to check the functions with it
r = rnorm(1000000)
testMatrix = matrix(r, nrow = 1000, ncol = 1000)
speedTest(testMatrix)