## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  i_x <- NULL
  set <- function(y) {
    x <<- y
    i_x <<- NULL
  }
  get <- function() x
  setinv <- function(inv_x) i_x <<- inv_x
  getinv <- function() i_x
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getinv() ##grab current inverse value
  
  ##If the inverse matrix is available, send the cached info
  if(!is.null(inv)){
    message("getting cached inv")
    return(inv)
  }
  ##If not cached, grab the matrix
  matrix <- x$get()
  inv <- ginv(x$get())
  x$setinv(inv)
  inv
}
