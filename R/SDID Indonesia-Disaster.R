library(readr)
library(synthdid)
library(dplyr)
Indonesia_GDP <- read_csv("Data/Indonesia GDP.csv")

Indonesia_GDP<-as.data.frame(Indonesia_GDP)
Indonesia_GDP$Province<-factor(Indonesia_GDP$Province)

Indonesia_GDP$treat<-ifelse(Indonesia_GDP$Year>=2004 & Indonesia_GDP$Province=="Nanggroe Aceh Darussalam",1,0)

pan<-panel.matrices(panel = Indonesia_GDP,unit = 1,time = 2,outcome = 3,treatment = 4)
sdid_ACEH<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_ACEH)

#######################SUMUT 2005##############################
Indonesia_GDP$treat<-ifelse(Indonesia_GDP$Year>=2005 & Indonesia_GDP$Province=="Sumatera Utara",1,0)

pan<-panel.matrices(panel = Indonesia_GDP,unit = 1,time = 2,outcome = 3,treatment = 4)
sdid_SUMUT<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_SUMUT)

#######################DIY 2006##############################
Indonesia_GDP$treat<-ifelse(Indonesia_GDP$Year>=2006 & Indonesia_GDP$Province=="DI Yogyakarta",1,0)

pan<-panel.matrices(panel = Indonesia_GDP,unit = 1,time = 2,outcome = 3,treatment = 4)
sdid_DIY<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_DIY)

#######################JABAR 2006##############################
Indonesia_GDP$treat<-ifelse(Indonesia_GDP$Year>=2006 & Indonesia_GDP$Province=="Jawa Barat",1,0)

pan<-panel.matrices(panel = Indonesia_GDP,unit = 1,time = 2,outcome = 3,treatment = 4)
sdid_JABAR<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_JABAR)

#######################SUMBAR 2009##############################
Indonesia_GDP$treat<-ifelse(Indonesia_GDP$Year>=2009 & Indonesia_GDP$Province=="Sumatera Barat",1,0)

pan<-panel.matrices(panel = Indonesia_GDP,unit = 1,time = 2,outcome = 3,treatment = 4)
sdid_SUMBAR<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_SUMBAR)

#################################################################
Service_Manufacture <- read_excel("Data/Service & Manufacture.xlsx")
Service_Manufacture<-as.data.frame(Service_Manufacture)

Service_Manufacture$Province<-factor(Service_Manufacture$Province)
####
run_SDID<-select(Service_Manufacture,Province,YEAR,Service)
run_SDID$treat<-ifelse(run_SDID$YEAR>=2004&run_SDID$Province=="Nanggroe Aceh Darussalam",1,0)

run_SDID$Province<-factor(run_SDID$Province)
run_SDID$YEAR<-as.numeric(run_SDID$YEAR)

pan<-panel.matrices(panel = run_SDID,unit = 1,time = 2,outcome = 3,treatment = 4)

sdid_ACEH<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_ACEH)

###############################################################$
run_SDID<-select(Service_Manufacture,Province,YEAR,Manufacture)
run_SDID$treat<-ifelse(run_SDID$YEAR>=2004&run_SDID$Province=="Nanggroe Aceh Darussalam",1,0)

run_SDID$Province<-factor(run_SDID$Province)
run_SDID$YEAR<-as.integer(run_SDID$YEAR)

pan<-panel.matrices(panel = run_SDID,unit = 1,time = 2,outcome = 3,treatment = 4)

sdid_ACEH<-synthdid_estimate(pan$Y,pan$N0,pan$T0)
plot(sdid_ACEH)

