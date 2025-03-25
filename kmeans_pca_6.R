library(ggplot2)

kmeans_result <- kmeans(X_pca, centers = n_classes, nstart = 100)

cluster_labels <- kmeans_result$cluster

pca_df <- data.frame(X_pca = X_pca[, 1], Y_pca = X_pca[, 2], cluster = factor(cluster_labels))

ggplot(pca_df, aes(x = X_pca, y = Y_pca, color = cluster)) +
  geom_point(size = 2) +  
  scale_color_viridis_d() + 
  theme_minimal() ->plot  
ggsave("kmeans6.jpg", plot = plot)
cat("Plot saved as", "kmeans6.jpg", "\n")