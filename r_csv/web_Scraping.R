library(rvest)
library(jsonlite)


url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Fetch the HTML content of the page
html_content <- read_html(url)

# Extract all <pre> tags
pre_tags <- html_nodes(html_content, "pre")

