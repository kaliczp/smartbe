smartbe <- function(fname, channel=1){
  ## Read raw data
  raw.data <- readLines(fname, encoding = "latin1")
  headsep <- which(raw.data == "========================================================")
  channelsep <- which(raw.data == "--------------------------------------------------------")
  head.length <- 8
  if(channel == 1){
    ch.start <- channelsep[1]+head.length
    ch.end <- channelsep[2]-(channelsep[1]+head.length+1)
  } else {
    ch.start <- headsep+head.length
    ch.end <- channelsep[1]-(headsep+head.length+1)
  }
  data <- scan(fname, what=list(NULL,"",NULL,NULL,NULL,NULL,numeric()),
               skip= ch.start , nlines=ch.end, sep="\t", na.strings = "?",
               fill=T,fileEncoding="latin1")
  data.frame(DateTime = data[[2]], Measure = data[[7]])
}
