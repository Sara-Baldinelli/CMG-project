library(ggplot2)

data <- read.table("meta_merged.txt", header = T, sep = "\t") #merged metadata and output dataframe from CheckM

data$Completeness <- as.numeric(gsub("Completeness: ", "", data$completeness))
data$Contamination <- as.numeric(gsub(" Contamination: ", "", data$contamination))
data$GC <- as.numeric(gsub(" GC: ", "", data$GC))

my_colors <- c("periimplantitis" = "#bf6c2e", "mucositis" = "#2d7ba4", "healthy" = "#31876d")


p <- ggplot(data, aes(x = Completeness, y = Contamination, color = study_group, shape = smoking_state)) +
  geom_point(size = 4) +
  labs(x = "Completeness", y = "Contamination", color = "Study Group", shape = "Smoking State") +
  scale_color_manual(values = my_colors) +  # Set colors manually
  theme_bw() +
  geom_hline(aes(yintercept = 5, linetype = "Low vs Medium to High"), color = "purple", size = 0.7) + 
  geom_vline(aes(xintercept = 50, linetype = "Low vs Medium"), color = "green", size = 0.7) +       
  geom_vline(aes(xintercept = 90, linetype = "Medium vs High"), color = "red", size = 0.7) +
  scale_linetype_manual(values = c("dashed", "dashed", "dashed")) + # Provide all three linetype values
  xlim(40, 100) +
  ylim(0, 5.8) +
  guides(color = guide_legend(title = "Study Group"), 
         shape = guide_legend(title = "Smoking State"),
         linetype = guide_legend(title = "Quality Comparison"))

print(p)

ggsave("quality.png", p, width = 8, height = 5, dpi = 420)


#contamination <5.0
#completeness: medium > 50, high > 90

         

