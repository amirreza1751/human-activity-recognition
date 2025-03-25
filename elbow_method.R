library(ggplot2)

inertia <- c()

for (k in 1:n_classes) {
  kmeans_result <- kmeans(X_pca, centers = k, nstart = 100)
  
  inertia <- c(inertia, sqrt(kmeans_result$tot.withinss))
}

inertia_df <- data.frame(k = 1:n_classes, inertia = inertia)

ggplot(inertia_df, aes(x = k, y = inertia)) +
  geom_line() +
  geom_point(shape = 15, size = 3) +  
  theme_minimal() +  
  labs(x = "Number of Clusters (k)", y = "Inertia (sqrt)", 
       title = "KMeans Inertia for Different k") ->plot  

ggsave("elbow_method.jpg", plot = plot)
cat("Plot saved as", "elbow_method.jpg", "\n")