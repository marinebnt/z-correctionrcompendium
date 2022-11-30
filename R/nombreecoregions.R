
returndata<-function(){
  ecor_list<-readr::read_csv(here::here("data", "wildfinder", "wildfinder-ecoregions_list.csv"))
  ecor_sp<-readr::read_csv(here::here("data", "wildfinder", "wildfinder-ecoregions_species.csv"))
  mammals<-readr::read_csv(here::here("data", "wildfinder", "wildfinder-mammals_list.csv"))
  
  mammals<-mammals[mammals$family=="Ursidae",] #Family,]
  
  datajoined<- merge(
    ecor_list,
    mammals)
  datajoined<-merge(
    datajoined,
    ecor_sp
  )
  return(datajoined)  
}

nombreecoregions<-function(returndata){
  colspecies=datajoined$species
  sp<-unique(colspecies)
  dataspeciesecor<-matrix(nrow=length(sp),ncol=2)
  for(i in (1:length(sp))){
    sphere=sp[i]
    datasp<-datajoined[colspecies==sphere,]
    dataspeciesecor[i,2]<-as.numeric(length(unique(datasp$ecoregion)))
    dataspeciesecor[i,1]<-sphere
  }
  return(as.data.frame(dataspeciesecor))
}

plotspecoreg<-function(nombreecoregions){
  plot(as.numeric(dataecoregion$V2)~as.factor(dataecoregion$V1))->plotspecoreg
  return(plotspecoreg)
}
