# same speaker repetition benefit
ff <- load(file="alldatasets.RData", verbose=TRUE)

barrkeysar02.2.ssrb <-
  (barrkeysar02.2["Same-Prec",]-barrkeysar02.2["Same-None",])-
  (barrkeysar02.2["Diff-Prec",]-barrkeysar02.2["Diff-None",])

metzingbrennan03.ssrb <-
  metzingbrennan03["Same-Maintain",]-metzingbrennan03["Diff-Maintain",]

barr08.3.ssrb <-
  barr08.3["Same",]-barr08.3["Diff",]

kronmullerbarr07.1.ssrb <-
  kronmullerbarr07.1["Same-Maint",]-kronmullerbarr07.1["Diff-Maint",]

kronmullerbarr07.2.nl.ssrb <-
  kronmullerbarr07.2.nl["Same-Maint",]-kronmullerbarr07.2.nl["Diff-Maint",]

kronmullerbarr07.2.ld.ssrb <-
  kronmullerbarr07.2.ld["Same-Maint",]-kronmullerbarr07.2.ld["Diff-Maint",]

brownschmidt09.1a.ssrb <-
  brownschmidt09.1a["Same-Maintain",]-brownschmidt09.1a["Diff-Maintain",]

brownschmidt09.1b.ssrb <-
  brownschmidt09.1b["Same-Maintain",]-brownschmidt09.1b["Diff-Maintain",]

brownschmidt09.2.ssrb <-
  brownschmidt09.2["Same-Maintain",]-brownschmidt09.2["Diff-Maintain",]

hortonslaten11.ssrb <-
  hortonslaten11["Same",]-hortonslaten11["Diff",]

vnames <- paste(ff, "ssrb", sep=".")
names(vnames) <- vnames

min2max <- matrix(unlist(lapply(vnames, function(x) {
  gg <- get(x)
  c(min(as.numeric(names(gg))), max(as.numeric(names(gg))))
})), ncol=2, byrow=T)
rownames(min2max) <- vnames

t0 <- min(min2max[,1])
t1 <- max(min2max[,2])

cols <- as.character(seq(t0,t1,by=20))

ssrb.mx <- matrix(unlist(lapply(vnames, function(x) {
  gg <- get(x)
  gg[cols]
})), byrow=TRUE, ncol=length(cols),
                  dimnames=list(vnames,cols))

ssrb.mx <- ssrb.mx[c(4,8,5:7,9,1:3,10),]

save(ssrb.mx, cols, file="ssrb.mx.RData")

# different speaker novelty benefit
bpnames <- setdiff(ff, c("barr08.3", "barrkeysar02.2", "hortonslaten11"))

metzingbrennan03.dsnb <-
  metzingbrennan03["Diff-Break",]-metzingbrennan03["Same-Break",]

kronmullerbarr07.1.dsnb <-
  kronmullerbarr07.1["Diff-Break",]-kronmullerbarr07.1["Same-Break",]

kronmullerbarr07.2.nl.dsnb <-
  kronmullerbarr07.2.nl["Diff-Break",]-kronmullerbarr07.2.nl["Same-Break",]

kronmullerbarr07.2.ld.dsnb <-
  kronmullerbarr07.2.ld["Diff-Break",]-kronmullerbarr07.2.ld["Same-Break",]

brownschmidt09.1a.dsnb <-
  brownschmidt09.1a["Diff-Break",]-brownschmidt09.1a["Same-Break",]

brownschmidt09.1b.dsnb <-
  brownschmidt09.1b["Diff-Break",]-brownschmidt09.1b["Same-Break",]

brownschmidt09.2.dsnb <-
  brownschmidt09.2["Diff-Break",]-brownschmidt09.2["Same-Break",]
  
vnames <- paste(bpnames, "dsnb", sep=".")
names(vnames) <- vnames

min2max <- matrix(unlist(lapply(vnames, function(x) {
  gg <- get(x)
  c(min(as.numeric(names(gg))), max(as.numeric(names(gg))))
})), ncol=2, byrow=T)
rownames(min2max) <- vnames

t0 <- min(min2max[,1])
t1 <- max(min2max[,2])

cols <- as.character(seq(t0,t1,by=20))

dsnb.mx <- matrix(unlist(lapply(vnames, function(x) {
  gg <- get(x)
  gg[cols]
})), byrow=TRUE, ncol=length(cols),
                  dimnames=list(vnames,cols))

dsnb.mx <- dsnb.mx[c(7,4:6,1:3),]

save(dsnb.mx, cols, file="dsnb.mx.RData")

# precedent main effect
barrkeysar02.2.prce <-
    (barrkeysar02.2["Same-Prec",]+barrkeysar02.2["Diff-Prec",])/2-
    (barrkeysar02.2["Same-None",]+barrkeysar02.2["Diff-None",])/2

metzingbrennan03.prce <-
    (metzingbrennan03["Same-Maintain",] + metzingbrennan03["Diff-Maintain",])/2-
    (metzingbrennan03["Same-Break",] + metzingbrennan03["Diff-Break",])/2

kronmullerbarr07.1.prce <-
    (kronmullerbarr07.1["Same-Maint",] + kronmullerbarr07.1["Diff-Maint",])/2-
    (kronmullerbarr07.1["Same-Break",] + kronmullerbarr07.1["Diff-Break",])/2

kronmullerbarr07.2.nl.prce <-
    (kronmullerbarr07.2.nl["Same-Maint",] + kronmullerbarr07.2.nl["Diff-Maint",])/2-
    (kronmullerbarr07.2.nl["Same-Break",] + kronmullerbarr07.2.nl["Diff-Break",])/2

kronmullerbarr07.2.ld.prce <-
    (kronmullerbarr07.2.ld["Same-Maint",] + kronmullerbarr07.2.ld["Diff-Maint",])/2-
    (kronmullerbarr07.2.ld["Same-Break",] + kronmullerbarr07.2.ld["Diff-Break",])/2

brownschmidt09.1a.prce <-
    (brownschmidt09.1a["Same-Maintain",]+brownschmidt09.1a["Diff-Maintain",])/2 -
    (brownschmidt09.1a["Same-Break",]+brownschmidt09.1a["Diff-Break",])/2

brownschmidt09.1b.prce <-
    (brownschmidt09.1b["Same-Maintain",]+brownschmidt09.1b["Diff-Maintain",])/2 -
    (brownschmidt09.1b["Same-Break",]+brownschmidt09.1b["Diff-Break",])/2

brownschmidt09.2.prce <-
    (brownschmidt09.2["Same-Maintain",]+brownschmidt09.2["Diff-Maintain",])/2 -
    (brownschmidt09.2["Same-Break",]+brownschmidt09.2["Diff-Break",])/2

vnames <- paste(ff[c(1,2,3,4,5,6,7,8)], "prce", sep=".")
names(vnames) <- vnames

min2max <- matrix(unlist(lapply(vnames, function(x) {
    gg <- get(x)
    c(min(as.numeric(names(gg))), max(as.numeric(names(gg))))
})), ncol=2, byrow=T)
rownames(min2max) <- vnames

t0 <- min(min2max[,1])
t1 <- max(min2max[,2])

cols <- as.character(seq(t0,t1,by=20))

prce.mx <- matrix(unlist(lapply(vnames, function(x) {
    gg <- get(x)
    gg[cols]
})), byrow=TRUE, ncol=length(cols),
                  dimnames=list(vnames,cols))

prce.mx <- prce.mx[c(4,8,5,6,7,1,2,3),]

save(prce.mx, cols, file="prce.mx.RData")
