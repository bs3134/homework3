---
  title: "Untitled"
output: html_document
---
  
```{r}

library(tidyverse)
library(p8105.datasets)


brfss_smart2010
#load the file from git,then limit the response into Excellent to Poor#
file=brfss_smart2010 %>%
  select(-Class,-Topic,-Question,-Sample_Size,-Confidence_limit_Low:-GeoLocation)%>%
  filter(Response%in%c("Excellent","Very good","Good","Fair","Poor"))%>%
  spread(key=Response,value=Data_value)
gitfile=na.omit(file)
gitfile
x=filter(gitfile,Locationabbr=="NY")
x



gitfile2002=filter(gitfile,Year==2002)
count(gitfile2002,Locationabbr)

gitfile %>%
  group_by(Year, Locationabbr) %>%
  summarize(n_obs = n())%>%
  ggplot(aes(x = Year, y = n_obs, color = Locationabbr)) + 
  geom_point() + geom_line() + 
  theme(legend.position = "bottom")


gitfile %>%
  group_by(Year, Locationdesc) %>%
  filter(Locationabbr=="NY",Year%in%c(2002,2006,2010))%>%
  summarize(mean_ex = mean(Excellent,na.rm=TRUE)) %>% 
  
  knitr::kable(digits = 1)



```
*After listing the freq of Locationabbr, the state CT,FL and NC have 7 locations.
