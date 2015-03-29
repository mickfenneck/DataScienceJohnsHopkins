
Dataset is compressed with zip format [ZIP compressed archive](http://en.wikipedia.org/wiki/Zip_(file_format)) and is downloadable from [here](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip).
```{r, eval=FALSE}
# specify the source and destination of the download
destination_file <- "Coursera-SwiftKey.zip"
source_file <- "http://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

# execute the download
download.file(source_file, destination_file)

# extract the files from the zip file
unzip(destination_file)
```

Inspect the unzipped files
```{r, eval=FALSE}
# find out which files where unzipped
unzip(destination_file, list = TRUE )

# inspect the data
list.files("final")
list.files("final/en_US")
```

The corpora are contained in three separate plain-text files,
out of which one is binary, for more information on this see [@newtest].
We import these files as follows.
```{r, eval=FALSE}
# import the blogs and twitter datasets in text mode
blogs <- readLines("final/en_US/en_US.blogs.txt", encoding="UTF-8")
twitter <- readLines("final/en_US/en_US.twitter.txt", encoding="UTF-8")

# import the news dataset in binary mode
con <- file("final/en_US/en_US.news.txt", open="rb")
news <- readLines(con, encoding="UTF-8")
close(con)
rm(con)
```

