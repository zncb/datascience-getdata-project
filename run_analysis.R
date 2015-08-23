run_analysis <- function(dataset_dir = "UCI HAR Dataset",output_file="tidy_means.csv") {
  # Dataset file paths
  test_data_path = paste(dataset_dir,"test/X_test.txt",sep="/")
  test_labels_path = paste(dataset_dir,"test/y_test.txt",sep="/")
  test_subjects_path = paste(dataset_dir,"test/subject_test.txt",sep="/")
  
  train_data_path = paste(dataset_dir,"train/X_train.txt",sep="/")
  train_labels_path = paste(dataset_dir,"train/y_train.txt",sep="/")
  train_subjects_path = paste(dataset_dir,"train/subject_train.txt",sep="/")
  
  feature_names_path = paste(dataset_dir,"features.txt",sep="/")
  activity_labels_path = paste(dataset_dir,"activity_labels.txt",sep="/")
  
  # Load datasets
  feature_names <- read.table(feature_names_path)$V2
  activity_names <- read.table(activity_labels_path)$V2
  
  test_data_df <- read.table(test_data_path, col.names = feature_names)
  test_labels <- read.table(test_labels_path)$V1
  test_subjects <- read.table(test_subjects_path)$V1
  test_data_df$Activity <- factor(sapply(test_labels,function(x) { activity_names[x] }))
  test_data_df$Subject <- factor(test_subjects)
  
  train_data_df <- read.table(train_data_path, col.names = feature_names)
  train_labels <- read.table(train_labels_path)$V1
  train_subjects <- read.table(train_subjects_path)$V1
  train_data_df$Activity <- factor(sapply(train_labels,function(x) { activity_names[x] }))
  train_data_df$Subject <- factor(train_subjects)
  
  # Merge test and training datasets
  combined_data_df <- rbind(test_data_df,train_data_df)
  
  # Select mean/std features
  sel_feats <- append(grep(".*mean.*",feature_names),grep(".*std.*",feature_names))
  sel_feat_names <- as.vector(sapply(sel_feats, function(x) { feature_names[x] }))
  feat_range <- 1:length(sel_feats)
  
  # Include Activity and Subject factors
  sel_feats <- append(sel_feats,c(1,2)+length(feature_names))
  
  # Reduce dataset to selection
  sel_data_df <- combined_data_df[sel_feats]
  
  # Calculate mean by Activity/Subject for each selected feature
  mean_tapply <- function(x,y) { 
    l <- tapply(sel_data_df[[y]],list(sel_data_df$Activity,sel_data_df$Subject),mean) 
    if (is.null(x)) {
      x <- data.frame(Subject = rep(colnames(l),each=dim(l)[1]), Activity = rep(rownames(l),times=dim(l)[2]),check.names = F)
    }
    dim(l) <- NULL
    z <- cbind(x,l)
    names(z)[dim(z)[2]] <- paste('mean(',sel_feat_names[y],')',sep="")
    return(z)
  }
  means <- Reduce(mean_tapply,feat_range,init=NULL)
  
  # Write out tidy data set
  # load with read.csv(file,row.names=1)
  write.csv(means,output_file)
  
  return(means)
}