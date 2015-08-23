	
CodeBook
--------

The 'tidy_means.txt' file contains the result of the analysis outlined in README.md .

It can be read back into R by running 'means_df <- read.table("tidy_means.txt")'.

The first two columns of the data frame are the factors for which the means were calculated, the subject ID and the activity performed, respectively.

The following columns are the means for the selected features. These columns are named 'mean(x)' where x is the name of the original feature from the raw dataset.

