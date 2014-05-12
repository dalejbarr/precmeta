ff <- load(file="alldatasets.RData", verbose=TRUE)

notneg <- function(x) {
    ifelse(x<0, 0, x)
}

calcPE <- function(ms, bs, md, bd) {
    sseff <- notneg(ms-bs)
    dseff <- notneg(md-bd)
    #correff <- ifelse(dseff>sseff, sseff, dseff)
    correff <- dseff
    fff <- 2*( sseff / (sseff+correff) - .5)
    fff[is.nan(fff)] <- NA
    fff
}

barrkeysar02.2.exp <- calcPE(ms=barrkeysar02.2["Same-Prec",], bs=barrkeysar02.2["Same-None",],
                             md=barrkeysar02.2["Diff-Prec",], bd=barrkeysar02.2["Diff-None",])

metzingbrennan03.exp <- calcPE(metzingbrennan03["Same-Maintain",], metzingbrennan03["Same-Break",],
                               metzingbrennan03["Diff-Maintain",], metzingbrennan03["Diff-Break",])

kronmullerbarr07.1.exp <- calcPE(kronmullerbarr07.1["Same-Maint",], kronmullerbarr07.1["Same-Break",],
                                 kronmullerbarr07.1["Diff-Maint",], kronmullerbarr07.1["Diff-Break",])
  
kronmullerbarr07.2.nl.exp <- calcPE(kronmullerbarr07.2.nl["Same-Maint",], kronmullerbarr07.2.nl["Same-Break",],
                                    kronmullerbarr07.2.nl["Diff-Maint",], kronmullerbarr07.2.nl["Diff-Break",])

kronmullerbarr07.2.ld.exp <- calcPE(kronmullerbarr07.2.ld["Same-Maint",], kronmullerbarr07.2.ld["Same-Break",],
                                    kronmullerbarr07.2.ld["Diff-Maint",], kronmullerbarr07.2.ld["Diff-Break",])
  
brownschmidt09.1a.exp <- calcPE(brownschmidt09.1a["Same-Maintain",], brownschmidt09.1a["Same-Break",],
                                brownschmidt09.1a["Diff-Maintain",], brownschmidt09.1a["Diff-Break",])

brownschmidt09.1b.exp <- calcPE(brownschmidt09.1b["Same-Maintain",], brownschmidt09.1b["Same-Break",],
                                brownschmidt09.1b["Diff-Maintain",], brownschmidt09.1b["Diff-Break",])

brownschmidt09.2.exp <- calcPE(brownschmidt09.2["Same-Maintain",], brownschmidt09.2["Same-Break",],
                                brownschmidt09.2["Diff-Maintain",], brownschmidt09.2["Diff-Break",])

vnames <- paste(ff[c(1,2,3,4,5,6,7,8)], "exp", sep=".")
names(vnames) <- vnames
  
min2max <- matrix(unlist(lapply(vnames, function(x) {
    gg <- get(x)
    c(min(as.numeric(names(gg))), max(as.numeric(names(gg))))
})), ncol=2, byrow=T)
rownames(min2max) <- vnames
  
t0 <- min(min2max[,1])
t1 <- max(min2max[,2])
  
cols <- as.character(seq(t0,t1,by=20))
  
exp.mx <- matrix(unlist(lapply(vnames, function(x) {
    gg <- get(x)
    gg[cols]
})), byrow=TRUE, ncol=length(cols),
                 dimnames=list(vnames,cols))

exp.mx <- exp.mx[c(4,8,5,6,7,1,2,3),]

save(exp.mx, cols, file="exp.mx.RData")
