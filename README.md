### Introduction

The second programming assignment required students to code several functions that would store a cached computed value for the inverse of a matrix.  This was achieved via two functions.  The makeCacheMatrix() function sets up the special matrix for caching and the cacheSolve() function determines whether the inverse of the matrix has already been cached or needs to be computed, then returns the result.

### Sample Usage

<pre><code> > x <- c(2,3)
            > x <- rbind(x, c(2,2))
            > solve(x)
                  x     
            [1,] -1  1.5
            [2,]  1 -1.0
            > z <- makeCacheMatrix(x)
            
            </code></pre>


