## Two functions for use in memoizing the inversion of a matrix
## the first: makeCacheMatrix, returns a container usable by the 
## second in order to cache a matrix and its inverse.
## The second: cachesolve, checks to see if there is a viable 
## cached value for the inversion of the matrix and if so, returns
## it. Otherwise it takes the inverse, caches it, and returns the
## result.

## Takes an argument of a matrix and returns a list of functions
## usable as follows:
## x$set()              # Set a new matrix
## x$get()              # Return the stored matrix
## x$setinverse()       # Set a cached value for the matrix's inverse
## x$getinverse()       # Return the cached value for the matrix's inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## Takes an argument which is a special makeCacheMatrix object. It
## Then sees if the inverse matrix is already stored in that object
## and if so returns it. Otherwise it calculates the inverse of the
## matrix, caches the result, and returns it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        m <- solve(matrix, ...)
        x$setinverse(m)
        m
}
