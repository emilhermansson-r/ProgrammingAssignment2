
## The first function is creating a matrix and storing it in the cache, it can also
## initializes the inverse property of the matrix. And returning those. 
##The second function uses the solve() function to compute the inverse of the cached 
## matrix that is stored in the first function. Finally i show that the functions are
## working with by creating an example of the exercise. 

##Cachematrix function:
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse property
  inv <- NULL
  
  ## Creating method for setting the matrix
  set <- function(matrix) {
    x <<- matrix
    inv <<- NULL
  }
  
  ## Creating method for getting the matrix
  get <- function() {
    ## Returning the matrix
    x
  }
  
  ## Creating method for setting the inverse of the matrix
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  ## Creating method for getting the inverse of the matrix
  getInverse <- function() {
    ## Returning the inverse property
    inv
  }
  
  ## Return list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


##Function for creating the inverse of the matrix:
cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  ##Return the inverse of the matrix if its already set
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## Getting the matrix
  data <- x$get()
  
  ## Calculating the inverse by using the solve function in R
  m <- solve(data)
  
  ## Setting the inverse to the object
  x$setInverse(m)
  
  ## Returning the matrix
  m
}

### proving results:

#creating matrix data
matrix_data <- matrix(c(2, 2, 3, 4), 2, 2)
matrix_data
# Storing in cached matrix
cachedMatrix <- makeCacheMatrix(matrix_data)

# retrive the inverse by cache solve function
invers_matrix <- cacheSolve(cachedMatrix)

# printing inverse
print(invers_matrix)

