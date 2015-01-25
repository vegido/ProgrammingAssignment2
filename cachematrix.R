## An inverse of matrix is calculated and stored in cache. 
## Recalculation of inverse of matrix is done only if cache is empty or if
## the matrix has changed.

# makeCacheMatrix ---------------------------------------------------------
## Function that prepares a special object which is a list of functions.
## Takes a matrix as a parameter.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverseMatrix) m <<- inverseMatrix
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# cacheSolve --------------------------------------------------------------
## Calculates the inverse of a matrix or retrieves the result from cache 
## if the calculation has been already done and if the matrix has not changed.
## Takes 2 parameters:
## x - an object of makeCacheMatrix function
## curMatrix - matrix for which inverse should be calculated

cacheSolve <- function(x, curMatrix, ...) {
  # Check if cached matrix differs from the current matrix
  if(!(identical(curMatrix, x$get()))) {
    ## Set current matrix to valid value and cached inverse matrix to NULL
    x$set(curMatrix) 
    message("not identical matrices, recaching")
    return(cacheSolve(x, curMatrix, ...))
  }
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  ## Return a matrix that is the inverse of 'curMatrix
  m 
}
