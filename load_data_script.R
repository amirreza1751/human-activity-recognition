train_path <- "dataset/UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"
test_path <- "dataset/UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"
train_labels_path <- "dataset/UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"
test_labels_path <- "dataset/UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"

X_train <- read.table(train_path)
X_test <- read.table(test_path)

X <- rbind(X_train, X_test)

y_train <- read.table(train_labels_path)
y_test <- read.table(test_labels_path)

y <- rbind(y_train, y_test)
