### R Programming Assignment 2
### Brian Prest
### 6/15/2015

## This code creates two functions that allow one to create an object containing
## a matrix and its inverse. This allows the users to store the matrix's inverse
## as part of the object, rather than having to recompute it.

# This function creates the list object for the matrix. 
# set() allows one to set the matrix values
# get() retrieves the matrix
# setInverse() allows one to set the stored value for the matrix's inverse
# getInverse() returns the stored inverse
makeCacheMatrix <- function(x = matrix()) {
        inv <-  NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


# This function checks to see if the inverse is stored in the object. If so, it
# returns this stored vavlue. If not, it calculates the inverse and stores it.
cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if(!is.null(inv)) {
                message("retrieving cached inverse")
                return(inv)
        }
        inverse = solve(x$get())
        x$setInverse(inverse)
        inverse
}
