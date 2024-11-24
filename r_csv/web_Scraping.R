library(rvest)
library(jsonlite)


url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Fetch the HTML content of the page
html_content <- read_html(url)

# Extract all <pre> tags
pre_tags <- html_nodes(html_content, "pre")

# Extract the 11th <pre> tag (10th index in zero-based indexing)
csv_example <- html_text(pre_tags[11])

# Remove unnecessary HTML tags and whitespace
cleaned_data <- gsub("</?pre>", "", csv_example)

# Split data into lines
lines <- unlist(strsplit(cleaned_data, "\n"))

# Create a data frame from the CSV lines
data <- read.csv(text = paste(lines, collapse = "\n"), header = TRUE, stringsAsFactors = FALSE)

# Convert the data frame to JSON and save it to a file
output_file <- "table_data.json"
write_json(data, output_file, pretty = TRUE)

