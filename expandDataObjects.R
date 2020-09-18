library(xlsx)
library(dplyr)
library(stringr)
library(tidyr)

reportData <- read.csv(file = 'data/Report.csv', na.strings = c("","NA"))

names(reportData)[1] <- "Date"
names(reportData)[2] <- "v143"
names(reportData)[3] <- "v155"

expandedData <- reportData[complete.cases(reportData), ]

# define function to extract matching strings from vector
getStrings <- function(arg1, arg2, arg3){
  pattern <- paste(arg1, "\\s*(.*?)\\s*", arg2, sep="")
  return(str_match(arg3, pattern)[,2])
}

# add columns for individual components of v143
expandedData$APP <- sapply(str_split(expandedData$v143, ":"), "[[", 1)
expandedData$INT <- getStrings("INT_", ":", expandedData$v143)
expandedData$PT <- getStrings("PT_", ":", expandedData$v143)
expandedData$SC <- getStrings("SC_", ":", expandedData$v143)
expandedData$SCC <- getStrings("SCC_", ":", expandedData$v143)
expandedData$RC <- getStrings("RC_", ":", expandedData$v143)
expandedData$IP <- getStrings("IP_", ":", expandedData$v143)
expandedData$RCC <- getStrings("RCC_", ":", expandedData$v143)
expandedData$MP <- getStrings("MP_", ":", expandedData$v143)
expandedData$DV <- getStrings("DV_", ":", expandedData$v143)
expandedData$DVC <- getStrings("DVC_", ":", expandedData$v143)
expandedData$WU <- getStrings("WU_", ":", expandedData$v143)
expandedData$WV <- getStrings("WV_", ":", expandedData$v143)
expandedData$PO <- getStrings("PO_", ":", expandedData$v143)
expandedData$INV <- getStrings("INV_", ":", expandedData$v143)
expandedData$DNO <- getStrings("DNO_", ":", expandedData$v143)
expandedData$BT <- getStrings("BD_", ":", expandedData$v143)
expandedData$TRK <- getStrings("TRK_", ":", expandedData$v143)
expandedData$PV <- getStrings("PV_", ":", expandedData$v143)
expandedData$PVC <- getStrings("PVC_", ":", expandedData$v143)
expandedData$PUT <- getStrings("PUT_", ":", expandedData$v143)
expandedData$NP <- getStrings("NP_", ":", expandedData$v143)

# extract the last variable which has no colon after it
expandedData$SPROF <- str_match(expandedData$v143, "SPROF_*(.)")[,2]

# move v155 to last column
expandedData <- relocate(expandedData, v155, .after = last_col())

# expand the v155 column
expandedData$DO <- getStrings("DO_", ":", expandedData$v155)
expandedData$DOV <- getStrings("DOV_", ":", expandedData$v155)
expandedData$DOC <- getStrings("DOC_", ":", expandedData$v155)
expandedData$PCON <- getStrings("PCON_", ":", expandedData$v155)
expandedData$COP <- getStrings("COP_", ":", expandedData$v155)
expandedData$COQ <- getStrings("COQ_", ":", expandedData$v155)
expandedData$CHC <- getStrings("CHC_", ":", expandedData$v155)
expandedData$TC <- getStrings("TC_", ":", expandedData$v155)
expandedData$TCV <- getStrings("TCV_", ":", expandedData$v155)
expandedData$TCVC <- getStrings("TCVC_", ":", expandedData$v155)
expandedData$COD <- getStrings("COD_", ":", expandedData$v155)
expandedData$LHR <- getStrings("LHR_", ":", expandedData$v155)
expandedData$LHI <- getStrings("LHI_", ":", expandedData$v155)
expandedData$FISR <- getStrings("FISR_", ":", expandedData$v155)
expandedData$FISI <- getStrings("FISI_", ":", expandedData$v155)

# extract the last variable which has no colon after it
expandedData$AIN <- str_match(expandedData$v155, "AIN_*(.)")[,2]

str(expandedData)

# Specify columns to be factors
i <- c(3:7)
i <- c("APP", "INT", "PT", "SCC", "IP", "RC", "RCC", "MP", "DVC", "WU", "PO",
                   "INV", "DNO", "BT", "PVC", "PUT", "NP", "SPROF",
                   "DO", "DOC", "COP", "CHC", "COD", "LHR", "LHI", "FISR", "FISI",
                   "AIN")                                  

# use the lapply function to change columns to factor
expandedData[i] <- lapply(expandedData[i], as.factor)
str(expandedData)

write.csv(expandedData, "data/expandedData.csv", row.names=FALSE)

summary(expandedData)
length(unique(expandedData$TRK))
