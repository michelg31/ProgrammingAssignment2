## This files contains 2 functions that allow to put the inverse of a matrix in cache
## so that when solve function is called, it is only compute the first time

## The first function, `makeCacheMatrix` creates a special "Matrix", which is
## really a list containing a function to
## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  set the value of the inverse
## 4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

  i <- NULL

  set <- function(z) {
    x <<- z
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)  
}


## The second function calculates the mean of the inverse "matric"
## created with the above function. However, it first checks to see if the
## inverse has already been computed. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i   
}

