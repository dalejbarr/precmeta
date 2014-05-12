load(file="bootres.RData", verbose=TRUE)

normalizeRowNames2 <- function(x) {
    sub("\\.[a-z][a-z][a-z]$", "", rownames(x))
}

lget <- function(lx, x) {
    unlist(lapply(lx, function(ix) {
        ix[[x]]
    }))
}

rownames(exp2) <- normalizeRowNames2(exp2)
rownames(exp.wt.sum) <- normalizeRowNames2(exp.wt.sum)
rownames(exp.eq.sum) <- normalizeRowNames2(exp.eq.sum)
rownames(exp.no.mb03.sum) <- normalizeRowNames2(exp.no.mb03.sum)

allstudynames <- normalizeRowNames2(exp2)
rcols <- rainbow(nrow(exp2), alpha=.4)
#rcols <- rainbow(nrow(ssrb2))
lcfg <- lapply(seq_len(length(allstudynames)), function(x) {
    list(col=rcols[x], pch=x)
})
names(lcfg) <- allstudynames

lcfg[["barrkeysar02.2"]] <- c(lcfg[["barrkeysar02.2"]], list(shortName="Barr & Keysar (2002) Exp. 2"))
lcfg[["metzingbrennan03"]] <- c(lcfg[["metzingbrennan03"]], list(shortName="Metzing & Brennan (2003)"))
lcfg[["kronmullerbarr07.1"]] <- c(lcfg[["kronmullerbarr07.1"]], list(shortName="Kronmüller & Barr (2007), Exp. 1"))
lcfg[["kronmullerbarr07.2.nl"]] <- c(lcfg[["kronmullerbarr07.2.nl"]], list(shortName="Kronmüller & Barr (2007), Exp. 2 No Load"))
lcfg[["kronmullerbarr07.2.ld"]] <- c(lcfg[["kronmullerbarr07.2.ld"]], list(shortName="Kronmüller & Barr (2007), Exp. 2 Load"))
lcfg[["brownschmidt09.1a"]] <- c(lcfg[["brownschmidt09.1a"]], list(shortName="Brown-Schmidt (2009), Exp. 1a"))
lcfg[["brownschmidt09.1b"]] <- c(lcfg[["brownschmidt09.1b"]], list(shortName="Brown-Schmidt (2009), Exp. 1b"))
lcfg[["brownschmidt09.2"]] <- c(lcfg[["brownschmidt09.2"]], list(shortName="Brown-Schmidt (2009), Exp. 2"))

# x <- "prce"; x.sfx <- "wt"; mylim=c(-.2,.6); maintt <- "Weighted by Sample Size"
plotall <- function(x, x.sfx, mylim, maintt, exclMB) {
    curv <- get(paste0(x, "2"))
    curv.sum <- get(paste0(x, ".", x.sfx, ".sum"))
    #par(mai=c(0,.4,0,0))
    par(mai=c(.2,.4,.15,.05), mgp=c(1.6,.3,0), tcl=-.1)  
    plot(cols, rep(NA,length(cols)), ylim=mylim,type='n', 
         xaxt="n", yaxt="n", xlab="", ylab="")#, bty="n")
    abline(v=seq(0, 1400, 100), col='gray90')
    if (exclMB) {
        tddd <- setdiff(rownames(curv), "metzingbrennan03")
    } else {
        tddd <- rownames(curv)
    }
    lapply(tddd, function(nx) {
        cfg <- lcfg[[nx]]
        points(cols, curv[nx,], pch=cfg$pch, col=cfg$col, type='l')
    })
    points(cols, curv.sum["mean",], lwd=2, type='l')
    points(cols, curv.sum["min",], lwd=1, col='black', lty=2, type='l')
    points(cols, curv.sum["max",], lwd=1, col='black', lty=2, type='l')
    abline(v=200)
    abline(h=0)
    #axis(1, at=c(seq(0,1400,100)), labels=sprintf("%.2f", seq(0,1.4,.1)), cex.axis=.7)
    axis(1, at=c(seq(0,1400,100)), labels=seq(0,1400,100), cex.axis=.6, las=2)
    axis(2, at=c(seq(mylim[1],mylim[2], .1)), labels=sprintf("%.1f", seq(mylim[1],mylim[2], .1)), las=1)
    if (!is.null(maintt)) {
        title(maintt, cex.main=.8)
    } else {}
}

cols <- as.numeric(dimnames(prce2)[[2]])

pdf(file="spkrspec.pdf", width=6, height=2.7)
layout(matrix(c(1,1,1,2:4),ncol=3,byrow=TRUE), c(3,3,3), c(1,2))
par(mar=c(1,1,1,1))
plot(c(0,1), c(0,1), type="n", xaxt="n", yaxt="n", bty="n")
legend(0.5, 0.5, legend=lget(lcfg, "shortName"),
       #pch=lget(lcfg, "pch"), 
       lty=1, lwd=1, col=lget(lcfg, "col"),
       ncol=3, yjust=0.5, xjust=0.5, cex=.7, x.intersp=0.4,
       text.width = 0.3)

todo.eff <- rep(c("exp"),each=3)
todo.sfx <- rep(c("wt","eq","no.mb03"),times=1)
lims <- list(c(0,1), c(-.2,.3), c(-.2,.6))
todo.mylim <- lims[c(1,1,1)]
todo.main <- list("Weighted by Sample Size", "Equally Weighted", "Equal, No Metzing & Brennan (2003)")
excludeMB <- rep(c(FALSE,FALSE,TRUE),1)
mapply(plotall, todo.eff, todo.sfx, todo.mylim, todo.main, excludeMB)
dev.off()

##################################################################
