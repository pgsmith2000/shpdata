#install gtools for macros
library(gtools)

# read in analytic table
expandedData <- read.csv(file="./data/expandedData.csv", header=TRUE, sep=",")

# use defmacro to define the macro
FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
                   expr={
                     OutputTable <- table(InputVar);
                     write.csv(OutputTable, file = paste0("./data/frequencies/overall/", CSVTable, ".csv"))
                   })

# create data tables using macro
FreqTbl (INTFreq, expandedData$INT, "INT")
FreqTbl (PTFreq, expandedData$PT, "PT")
FreqTbl (SCCFreq, expandedData$SCC, "SCC")
FreqTbl (IPFreq, expandedData$IP, "IP")
FreqTbl (RCFreq, expandedData$RC, "RC")
FreqTbl (RCCFreq, expandedData$RCC, "RCC")
FreqTbl (MPFreq, expandedData$MP, "MP")
FreqTbl (DVCFreq, expandedData$DVC, "DVC")
FreqTbl (WUFreq, expandedData$WU, "WU")
FreqTbl (POFreq, expandedData$PO, "PO")
FreqTbl (DNOFreq, expandedData$DNO, "DNO")
FreqTbl (BTFreq, expandedData$BT, "BT")
FreqTbl (PVCFreq, expandedData$PVC, "PVC")
FreqTbl (PUTFreq, expandedData$PUT, "PIT")
FreqTbl (NPFreq, expandedData$NP, "NP")
FreqTbl (SPROFFreq, expandedData$SPROF, "SPROF")
FreqTbl (DOFreq, expandedData$DO, "DO")
FreqTbl (DOCFreq, expandedData$DOC, "DOC")
FreqTbl (COPFreq, expandedData$COP, "COP")
FreqTbl (CHCFreq, expandedData$CHC, "CHC")
FreqTbl (CODFreq, expandedData$COD, "COD")
FreqTbl (LHRFreq, expandedData$LHR, "LHR")
FreqTbl (LHIFreq, expandedData$LHI, "LHI")
FreqTbl (FISRFreq, expandedData$FISR, "FISR")
FreqTbl (FISIFreq, expandedData$FISI, "FISI")
FreqTbl (AINFreq, expandedData$AIN, "AIN")
