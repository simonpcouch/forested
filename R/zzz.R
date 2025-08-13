.onLoad <- function(libname, pkgname) {
  delayedAssign("forested_wa", forested, assign.env = asNamespace(pkgname))
}
