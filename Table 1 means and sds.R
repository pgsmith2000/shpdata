library(gtools)
library(plyr)

# read in analytic table
expandedData <- read.csv(file="./data/expandedData.csv", header=TRUE, sep=",")



# USING MACROS
SumTbl <- defmacro(OutputTable, GroupVar, CSVTable,
                   expr={
                     OutputTable <- ddply(expandedData,~GroupVar,summarise,mean=mean(SLEPTIM2),sd=sd(SLEPTIM2));
                     write.csv(OutputTable, file = paste0("./data/means/", CSVTable, ".csv"))
                   })

SumTbl (DVSum, expandedData$DV, "DV")
SumTbl (WVSum, expandedData$WV, "WV")
SumTbl (PVSum, expandedData$PV, "PV")
SumTbl (NPSum, expandedData$NP, "NP")
SumTbl (COQSum, expandedData$COQ, "COQ")
SumTbl (TCSum, expandedData$TC, "TC")
SumTbl (TCVSum, expandedData$TCV, "TCV")





# example
ddply(analytic,~ALCGRP,summarise,mean=mean(SLEPTIM2),sd=sd(SLEPTIM2))

# USING MACROS
SumTbl <- defmacro(OutputTable, GroupVar, CSVTable,
expr={
OutputTable <- ddply(analytic,~GroupVar,summarise,mean=mean(SLEPTIM2),sd=sd(SLEPTIM2));
write.csv(OutputTable, file = paste0("./data/means/", CSVTable, ".csv"))
})

SumTbl (AstGrpSum, analytic$ASTHMA4, "Ast")
SumTbl (AlcGrpSum, analytic$ALCGRP, "Alc")
SumTbl (AgeGrpSum, analytic$X_AGE_G, "Age")
SumTbl (SexSum, analytic$SEX, "Sex")
SumTbl (HispSum, analytic$X_HISPANC, "Hisp")
SumTbl (RaceSum, analytic$RACEGRP, "Race")
SumTbl (MaritalSum, analytic$MARGRP, "Mar")
SumTbl (EdSum, analytic$EDGROUP, "Ed")
SumTbl (IncSum, analytic$INCOME3, "Inc")
SumTbl (BMISum, analytic$BMICAT, "BMI")
SumTbl (SmokeSum, analytic$SMOKGRP, "Smok")
SumTbl (ExerSum, analytic$EXERANY3, "Exer")
SumTbl (HlthPlanSum, analytic$HLTHPLN2, "HlthPln")
SumTbl (GenHlthSum, analytic$GENHLTH2, "GenHlth")
