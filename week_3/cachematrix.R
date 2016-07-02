## These functions create an special matrix, where you can compute the inverse
## and storage the result. So, if the value of the matrix does not change and
## if the inverse is already calculated, you just get the value and do not need
## to calculate it again.

## Create an special type of matrix, where a variable storage the inverse and you can
## do the operations set, get, setinverse, getinverse on the object.

makeCacheMatrix <- function(x = matrix())
{
  #Set the inverse variable into NULL
  i <- NULL
  #Function that set the parameter y as new value for the x variable
  set <- function(y)
  {
    #The new value for x is y using the '<<-' operator
    x <<- y 
    #The new value for i is NULL using the '<<-' operator
    i <<- NULL 
  }
  #Function that return the matrix
  get <- function() x
  #Function that set the inverse parameter to the i variable
  setinverse <- function(inverse) i <<- inverse
  #Function that return the inverse
  getinverse <- function() i
  #list of the function of the object
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Here you use de above function and ask for the inverse, if this is not calcutade yet
## it is calculated, the value is update in the matrix object else the inverse is
## returned from the getinverse function

cacheSolve <- function(x, ...)
{
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  
  #If the inverse is already calculated
  if(!is.null(i))
  {
    #Print message
    message("getting cached data")
    #Return the inverse
    return(i)
  }
  #If the inverse is not precalculated
  #get tha matrix using the get function
  data <- x$get()
  # set to i variable the inverse of the matrix
  i <- solve(data, ...)
  #use setinverse function tu update the inverse
  x$setinverse(i)
  #return the inverse
  i
}