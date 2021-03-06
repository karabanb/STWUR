library(knitr)
library(dplyr)


render_post <- function(post_name) {
  topic_name <- last(strsplit(strsplit(post_name, "-")[[1]], ".Rmd", fixed = TRUE))
  output_name <- paste0("./_posts/blog/", sub("Rmd", "md", last(strsplit(post_name, "/")[[1]])))

  opts_chunk$set(fig.path = paste0("./blog/", topic_name, "/figure/"))

  knit(input = post_name,
       output = output_name)

  readLines(output_name) %>%
    gsub(paste0("./blog/", topic_name, "/"), "./", x = ., fixed = TRUE) %>%
    cat(file = output_name, sep = "\n")

  print(paste0(output_name, " created."))
}

# render_post("./rmd_posts/2017-12-06-eRementarz3.Rmd")
 # render_post("./rmd_posts/2018-01-31-eRementarz4.Rmd")
render_post("./rmd_posts/2018-03-07-eRementarz5.Rmd")
