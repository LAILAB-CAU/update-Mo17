pdf(file="x00.pdf",width=10,height=4)
aa=read.table("Depth.x00.origin")
bb=read.table("Depth.x00.filter")
plot(aa[,2],aa[,4],type="l",col="red",main="read depth",ylim=c(0,300))
lines(bb[,2],bb[,4],type="l",col="green",ylim=c(0,300))
dev.off()

pdf(file="x01.pdf",width=10,height=4)
aa=read.table("Depth.x01.origin")
bb=read.table("Depth.x01.filter")
plot(aa[,2],aa[,4],type="l",col="red",main="read depth",ylim=c(0,300))
lines(bb[,2],bb[,4],type="l",col="green",ylim=c(0,300))
dev.off()

