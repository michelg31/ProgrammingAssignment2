test <- function (x, ...){
  print("start")
  y <- makeCacheMatrix(x)
  print("cacheinit")
  print("appel 1")
  cacheSolve(y)
  print("appel 2")
  cacheSolve(y)
  print("appel3")
  cacheSolve(y)
  print("appel4")
  cacheSolve(y)
  print("end")
}