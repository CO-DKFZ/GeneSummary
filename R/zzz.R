.onAttach = function(libname, pkgname) {

  	msg = paste0("Gene summaries were retrieved from RefSeq database release 208 (September 7, 2021).")

    packageStartupMessage(msg)
}

