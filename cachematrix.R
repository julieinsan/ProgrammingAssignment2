## cachematrix.R: calculate inverse of matrix, utilizing cache when available.
## makeCacheMatrix: creates special matrix
## cacheSolve: return the inverse of the matrix, by using solve() function or retrieving from cache


## makeCacheMatrix takes matrix argument

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL             ## m stores the inverse of matrix x
    set <- function(y) {  ## set a new matrix y, set inverse to null because it's not calculated yet
        x <<- y
        m <<- NULL
    }
    get <- function() x  ## retrieve x
    setinv <- function(inverse) m <<- inverse  ## set the inverse of x to arg inverse
    getinv <- function() m  ## function that returns the variable that stores inverse
    list(set = set, get = get,   ## return the special matrix
        setinv = setinv,
        getinv = getinv)
}


## cacheSolve: computes the inverse of the matrix returned by makeCacheMatrix
## if inverse has already been calculated, returns cached value
## Note: fails with non-invertible matrices.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## Call to stored function result getinv, NULL returned if inv has not been calculated
  m <- x$getinv()
  
  if(!is.null(m)) {
    message("getting cached data")  ## alert user that cached data will be accessed, no new calculation
    return(m)     ## exit function
  }
  
  data <- x$get()   ## This section gets executed if getinv returns null
  m <- solve(data, ...)   ## solve calculates inverse of matrix
  x$setinv(m)           ## store for later use
  m                     ## return calculated inverse
}

