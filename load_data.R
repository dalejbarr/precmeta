interpolate <- function(x, ms) {
  ivec <- rep(NA, length(ms))

  for (j in 1:length(ms)) {
    if (ms[j] <= min(x$ms)) {
      ms0 <- min(x$ms)
    } else {
      ms0 <- max(x$ms[x$ms<=ms[j]])
    }
    if (ms[j] >= max(x$ms)) {
      ivec[j] <- x[x$ms==max(x$ms),'TAS']
    } else {
      ms1 <- min(x$ms[x$ms>ms[j]])
      row0 <- x[x$ms==ms0,]
      row1 <- x[x$ms==ms1,]
      yper <- (row1$TAS - row0$TAS)/(row1$ms - row0$ms)
      ivec[j] <- row0$TAS + (ms[j]-ms0)*yper
    }
  }

  return(ivec)
}

processexp <- function(x1a,m1=-200,m2=1800) {

  x.list <- split(x1a, x1a$Cond)
  bins <- seq(m1,m2,by=20)

  mx1a <- matrix(nrow=length(x.list), ncol=length(bins))
  colnames(mx1a) <- bins
  rname <- rep(NA,length(unique(x1a$Cond)))

  for (i in 1:length(x.list)) {
    if (is.factor(x.list[[i]][,'Cond'])) {
      rname[i] <- levels(x.list[[i]][,'Cond'])[x.list[[i]][1,'Cond']]
    } else {
      rname[i] <- x.list[[i]][1,'Cond']
    }
    mx1a[i,] <- interpolate(x.list[[i]], bins)
  }
  rownames(mx1a) <- rname

  return(mx1a)
}

plotexp <- function(mx,y1=-.1,y2=.6) {
  
  prec.main <- mx[4,]-mx[2,]
  prec.break <- mx[3,]-mx[1,]

  maineff <- (mx[2,]+mx[4,])/2 - (mx[1,]+mx[3,])/2

  bins <- as.numeric(colnames(mx))
  plot(bins, mx[1,], type='l', ylim=c(y1,y2), xlim=c(-200,1800),
       col='red', lty=2, lwd=2)
  points(bins, mx[2,], type='l', lty=2, lwd=2)
  points(bins, mx[3,], type='l', col='red', lty=1, lwd=2)
  points(bins, mx[4,], type='l', lty=1, lwd=2)
  abline(h=0, col='blue')
  abline(v=180, col='green')
  abline(h=0, col='blue')
  legend("topleft",c("S-M","S-B","D-M","D-B"),
         lty=c(1,1,2,2),col=c("black","red","black","red"),
         bg='white', box.col='white')

  plot(bins, prec.main, type='l', lty=1, ylim=c(-.4,.4), xlim=c(-200,1800))
  points(bins, prec.break, type='l', lty=2)
  points(bins, maineff, type='l', col='red')
  abline(h=0, col='blue')
  abline(v=180, col='green')
  legend("topright",c("maint","break","maineff"),lty=c(1,2,3),cex=.8,bty='n',
         col=c("black","black","red"))
}

##########################
# Barr & Keysar (2002)
load(file="SourceData/bk02.2.bin")
load(file="SourceData/bk02-3raw.bin")
x.tas$Cond <- paste(x.tas$Phase, x.tas$Who, x.tas$Cover, sep='-')
x.tas$ms <- x.tas$bin

mx.bk.2 <- processexp(bk02.2,0,1800)
mx.bk.3 <- processexp(x.tas,0,1800)

rownames(mx.bk.2) <- c("Same-None","Same-Prec","Diff-None","Diff-Prec")
rownames(mx.bk.3) <- c("Pos-Diff-Live","Pos-Diff-Reco",
                       "Pos-Same-Live","Pos-Same-Reco",
                       "Pre-Diff-Live","Pre-Diff-Reco",
                       "Pre-Same-Live","Pre-Same-Reco")

barrkeysar02.2 <- mx.bk.2
barrkeysar02.3 <- mx.bk.3

##########################
# Metzing & Brennan (2003)
x.bh <- read.csv("SourceData/BrennanHanna.csv", header=FALSE)
names(x.bh) <- c("Cond", "x", "y", "ms", "TAS")

metzingbrennan03 <- processexp(x.bh,0,2100)

##########################
# Kronmuller & Barr (2007)
ff <- load(file="SourceData/KB07-exp1.bin", verbose=TRUE)

kronmullerbarr07.1 <- processexp(x2.tas, 0,1800)
rownames(kronmullerbarr07.1) <- c("Diff-Break","Diff-Maint","Same-Break","Same-Maint")

ff <- load(file="SourceData/kb07-new.RData", verbose=TRUE)

et2m.cell[[1]]$ms <- et2m.cell[[1]]$bin
et2m.cell[[2]]$ms <- et2m.cell[[2]]$bin
kronmullerbarr07.2.nl <- processexp(et2m.cell[[1]],-180,1800)
kronmullerbarr07.2.ld <- processexp(et2m.cell[[2]],-180,1800)

rownames(kronmullerbarr07.2.nl) <- c("Diff-Break","Diff-Maint","Same-Break","Same-Maint")
rownames(kronmullerbarr07.2.ld) <- c("Diff-Break","Diff-Maint","Same-Break","Same-Maint")

##########################
# Barr 2008 Experiment 3
load(file="SourceData/Barr2008-3.RData")
pogm.wbin$ms <- pogm.wbin$bin
barr08.3 <- processexp(pogm.wbin,-200,1450)

##########################
# Brown-Schmidt 2009
x1a <- read.csv("SourceData/BSexp1a.csv", header=FALSE)
x1b <- read.csv("SourceData/BSexp1b.csv", header=FALSE)
x2 <- read.csv("SourceData/BSexp2.csv", header=FALSE)
  
names(x1a) <- c("Cond", "x", "y", "ms", "TAS")
names(x1b) <- c("Cond", "x", "y", "ms", "TAS")
names(x2) <- c("Cond", "x", "y", "ms", "TAS")

brownschmidt09.1a <- processexp(x1a)
brownschmidt09.1b <- processexp(x1b)
brownschmidt09.2 <- processexp(x2)

##########################
# Horton & Slaten 2011
# data entered by hand
yx <- function(x,...){
  1.0482 + (-1/228)*x
}

t <- seq(-600,1700,100)

wds <- c(226.5,228.5,225,224.5,206.5,180.5,144,146.5,146,155,154,138,146.5,146.5,142.5,124,109.5,98,
84.5,54,51.5,42.5,32.5,29)

wss <- c(231,229,226.5,221.5,195.5,169,143.5,147,132,147,149.5,157.5,164,154.5,146,146,130,114.5,
76,62,51.5,39.5,45.5,45.5)

bss <- c(221,217,217,210,191,174.5,147,121.5,109.5,125.5,115,123,120.5,121.5,106.5,111,105,99,99.5,78.5,66.5,
42.5,53,51)

bds <- c(221,217,218.5,214.5,191,169,152.5,155,145,148.5,154.5,156.5,153.5,150.5,156,152.5,134.5,115.5,84,68,
62,50,32.5,29)

hs1 <- data.frame(ms=t,Cond=rep(c("Diff","Same"),c(length(t),length(t))),TAS=c(yx(bds),yx(bss)))

hortonslaten11 <- processexp(hs1,-300,1500)

save(brownschmidt09.1a, brownschmidt09.1b, brownschmidt09.2,
     barrkeysar02.2, kronmullerbarr07.1, kronmullerbarr07.2.nl,
     kronmullerbarr07.2.ld, metzingbrennan03, barr08.3,
     hortonslaten11, file="alldatasets.RData")
