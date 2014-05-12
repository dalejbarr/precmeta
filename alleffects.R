load(file="bootres.RData", verbose=TRUE)

confreg <- function(x, r=0, g=0, b=0) {
    polygon(c(cols,rev(cols)),
            c(x["min",], rev(x["max",])), col=rgb(r,g,b,.1),
            border=NA)
}

cols <- as.numeric(dimnames(prce2)[[2]])

pdf(file="alleffects.pdf", width=8, height=3.5)
par(mgp=c(1.4,.4,0), mai=c(.35,.5,.05,.05), tcl=-.15)
plot(cols, rep(NA,length(cols)), ylim=c(-.1,.4), xaxt='n', las=1,
     xlab='', ylab='')
#axis(1, at=c(seq(0,1400,100)), labels=sprintf("%.2f", seq(0,1.4,.1)), cex.axis=.8)
axis(1, at=seq(0,1400,100), labels=seq(0,1400,100), cex.axis=.7, las=2)
abline(v=seq(0,1400,100), col='gray90')
abline(h=0, lwd=2)
confreg(prce.wt.sum, 1, 0, 0)
confreg(ssrb.wt.sum, 0, 1, 0)
confreg(dsnb.wt.sum, 0, 0, 1)
points(cols, prce.wt.sum["mean",], type='l', col=rgb(1,0,0,.5), lwd=2, lty=3)
points(cols, ssrb.wt.sum["mean",], type='l', col=rgb(0,1,0,.5), lwd=2)
points(cols, dsnb.wt.sum["mean",], type='l', col=rgb(0,0,1,.5), lwd=2, lty=2)
legend("topleft", legend=c("Precedent Main Effect",
                      "Same Speaker Advantage for Maintained Precedents",
                      "Different Speaker Advantage for Broken Precedents"),
       col=c(rgb(1,0,0,.5), rgb(0,1,0,.5), rgb(0,0,1,.5)),
       lty=c(3,1,2), lwd=2, bty='n', cex=.8)
dev.off()
