## To create a special object that stores a numeric matrix and cache its reverse

## This creates a list containing a function to set/get the value of the matrix/the inverse of the matrix

> makeCacheMatrix <- function(x = matrix()){
	inv <- NULL
	set <- function(y){
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) inv <<- inverse
	getinverse <- function() inv
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## This returns an inverse of special matrix created above

cacheSolve <- function(x, ...) {
	inv <- x$getinverse()
	if(!is.null(inv)) {
		message("getting cached data.")
		return(inv)
	}
	data <- x$get()
	inv <- solve(data)
	x$getinverse(inv)
	inv
}
        ## Return a matrix that is the inverse of 'x'
