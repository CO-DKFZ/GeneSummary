.onAttach = function(libname, pkgname) {

  	msg = paste0("Gene summaries were retrieved from RefSeq database release 214 (Sep 30, 2022).")

    packageStartupMessage(msg)
}

