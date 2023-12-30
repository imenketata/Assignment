## Put comments here that give an overall description of what your
## functions do
## The makeCacheMatrix function is designed to create a special "matrix" object that has the ability 
## to cache its inverse. This function takes an optional matrix x as an argument and initializes an 
## inverse matrix cache (inv).

## Write a short comment describing this function
# Function to create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  # Initialize the inverse matrix cache
  inv <- NULL
  # Setter function to set the matrix and invalidate the cache
  setMatrix <- function(matrix) {
    x <<- matrix
    inv <<- NULL  
  }
  # Getter function to retrieve the matrix
  getMatrix <- function() {
    x
  }
  # Getter function to retrieve the cached inverse if available 
  getInverse <- function() {
    inv
  }
  # Setter function to set the inverse matrix and update the cache
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  # Return a list of the functions
  list(setMatrix = setMatrix, getMatrix = getMatrix, getInverse = getInverse, setInverse = setInverse)
}


## Write a short comment describing this function
# Function to compute the inverse of the special "matrix" and cache the result
cacheSolve <- function(cacheMatrix) {
  ## Return a matrix that is the inverse of 'x'
  matrix <- cacheMatrix$getMatrix()
  inverse <- cacheMatrix$getInverse()
  # If the cached inverse is available, return it
  if (!is.null(inverse)) {
    message("Getting cached inverse.")
    return(inverse)
  }
  # If the cached inverse is not available, compute it
  message("Calculating inverse.")
  inverse <- solve(matrix)
  # Cache the computed inverse
  cacheMatrix$setInverse(inverse)
  # Return the computed inverse
  inverse
}

        
