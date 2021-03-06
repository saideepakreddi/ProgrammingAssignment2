## makeCacheMatrix function sets and gets the data(matrix) and 
## it sets the inverse of the matrix to 'inv' and gets the inverse 
## by calling getInverse. 
## cacheSolve function returns the inverse matrix if its present 
## in cache and computes if its not present using the makeCacheMatrix
## function.

## returns list which gets and sets the data and result.

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
          x <<- y
          inv <<- NULL
      }
      get <- function() x
      setInverse <- function(solve) inv <<- solve
      getInverse <- function() inv
      list(set = set, get = get,
           setInverse = setInverse,
           getInverse = getInverse)
}


## The function returns the inverse of the matrix by checking cache
## and by computing if its not in cache.

cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      inv <- x$getInverse()
      if(!is.null(inv)) {
          message("getting cached data for Inverse")
          return(inv)
      }
      data <- x$get()
      inv <- solve(data, ...)
      x$setInverse(inv)
      inv
}
