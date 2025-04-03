library(tidyverse)
library(readxl)

read_xlsx("controlsR.xlsx")

selectra_controls <- read_xlsx("controlsR.xlsx")

selectra_controls$control <- as_factor(selectra_controls$control)
names(selectra_controls)
glimpse(selectra_controls)

selectra_controls %>% group_by(control) %>% summarise_if(is.double, mean, na.rm = T)

ggplot(selectra_controls, aes(datum, ApoB_Diasys, color=control)) +
  geom_point() +
  scale_color_manual(values=c("red", "purple"))+
  ylim(50,120) +
  geom_hline(yintercept = c(61.2, 91.8), color = "red") +
  geom_hline(yintercept = c(70, 90), color = "purple") +
  theme_minimal()
  
  
ggplot(selectra_controls ,aes(control, ApoB_Diasys)) +
  geom_boxplot()
  
ggplot(selectra_controls, aes(control, ApoB_Diasys, color=control)) +
    geom_boxplot()