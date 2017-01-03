#!/usr/bin/env Rscript

# Main plotting function
run <- function(font) {

    # Load data
    dataUrl <- "http://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=AB3F3788-E751-4875-A5B8-BF7BD54FD750"
    data <- read.csv(url(dataUrl))

    # Setup margin
    par(mar = c(4,10,4,4))

    # Plot
    title <- "易發生婦幼被害犯罪地點"
    deptNmSorted <- sort(table(data$DeptNm))
    barplot(deptNmSorted, main=title, family=font, las=1, horiz=T)

}

# Plot on screen
# run(font="PingFang TC")
run(font="CNS1")

# Save to PDF
pdf("output.pdf")
run(font="CNS1")
dev.off()

# Save to JPG
jpeg("output.jpg", width=10, height=6, units='in', res=300)
run(font="PingFang TC")
dev.off()
