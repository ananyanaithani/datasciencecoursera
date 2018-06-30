## Calculate the inverse of a matrix with caching


## creates a list containing a function to get/set values of a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  
  set <- function(y){
    
    x <<- y
    m <<- NULL
  
  }
  
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## calculates the inverse of a matrix or returns its cahced value if pre-existing

cacheSolve <- function(x, ...) {
  
  m <- x$getinverse()
  
  #check if inverse already exists in cache
  
  if(!is.null(m)){
    
    message("getting cached data")
    return(m)
  
    }
  
  #import matrix
  data <- x$get()
  
  #solve for inverse, assuming square matrix
  m <- solve(data) %*% data
  x$setinverse(m)
  m
   
}
