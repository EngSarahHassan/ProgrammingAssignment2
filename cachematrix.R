## These functions aims to use caching in storing matrix with its inverse in a special object.
## This is because matrix inversion is usually a costly computation and caching the inverse will
## eliminae the need to calculate it repeatedly .


## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## cacheSolve: This function computes the inverse of the special "matrix" created by `makeCacheMatrix` function.
## If the inverse has already been calculated (and the matrix has not changed), 
## then `cacheSolve` retrieves the inverse from the cache. 
## Otherwise, it calculates the inverse, cache it in the special matrix object, then return it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()

        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
