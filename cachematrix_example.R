## Example:
source("cachematrix.R")
v <- matrix(rnorm(25), 5, 5)
cm <- makeCacheMatrix(v)
cacheSolve(cm, v)
cacheSolve(cm, v)
v <- matrix(rnorm(9), 3, 3)
cacheSolve(cm, v)