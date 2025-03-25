library(ggplot2)

n_classes <- length(unique(y$V1))
X_scaled <- scale(X)
pca <- prcomp(X_scaled, retx = TRUE, center = TRUE, scale. = TRUE)

explained_variance <- cumsum(pca$sdev^2) / sum(pca$sdev^2)

n_components <- which(explained_variance >= 0.9)[1]

X_pca <- pca$x[, 1:n_components]
dim(X_pca)


pca_df <- data.frame(X_pca = X_pca[, 1], Y_pca = X_pca[, 2], label = factor(y$V1))

ggplot(pca_df, aes(x = X_pca, y = Y_pca, color = label)) +
  geom_point(size = 2) +  
  scale_color_viridis_d() + 
  theme_minimal() ->plot

ggsave("pca_2d.jpg", plot = plot)
cat("Plot saved as", "pca_2d.jpg", "\n")