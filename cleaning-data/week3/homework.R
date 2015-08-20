# getting and cleaning data - week3

# 1
exe1 <- function() {
    #code book: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
    
    csvUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(csvUrl, destfile = "Downloads/housing.csv", method = "curl")
    df <- read.csv("Downloads/housing.csv")
    agricultureLogical <- with(df, ACR == 3 & AGS == 6)
    head(which(agricultureLogical), 3)
}

# 2
exe2 <- function() {
    imageUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    download.file(imageUrl, destfile = "Downloads/image.jpeg", method = "curl")
    image <- readJPEG(source = "Downloads/image.jpeg", native = TRUE)
    quantile(image, probs = seq(0, 1, 0.1))
}

finalExe <- function() {
    # 3
    grossUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(grossUrl, destfile = "Downloads/gross.csv", method = "curl")
    grossDf <- read.csv("Downloads/gross.csv", header=FALSE, skip=5, nrows=190)
    
    eduUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    download.file(eduUrl, destfile = "Downloads/edu.csv", method = "curl")
    eduDf <- read.csv("Downloads/edu.csv")
    
    mergedDf <- merge(grossDf, eduDf, by.x = "V1", by.y = "CountryCode", sort = TRUE)
    arrange(mergedDf, desc(V2))
    
    oecd <- filter(mergedDf, Income.Group == "High income: OECD")
    nonOECD <- filter(mergedDf, Income.Group == "High income: nonOECD")
    
    # 4
    mean(oecd$V2, na.rm = TRUE)
    mean(nonOECD$V2, na.rm = TRUE)
    
    # 5
    quantile(mergedDf$V2, probs = seq(0.2, 1, 0.2))
    
    q1 <- mergedDf$V2 <= 38
    xtabs(q1 ~ mergedDf$Income.Group)
}