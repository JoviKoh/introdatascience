#install.packages('selectr')
#install.packages('xml2')
#install.packages('rvest')
#install.packages('stringr')
#install.packages('jsonlite')
#library(xml2)
#library(rvest)
#library(stringr)
#library(selectr)
#library(jsonlite)

scrappedurl <- 'https://www.amazon.in/OnePlus-Mirror-Black-64GB-Memory/dp/B077PWBC6V?tag=googinkenshoo-21&ascsubtag=aee9a916-6acd-4409-92ca-3bdbeb549f80&th=1'
webpage <- read_html(scrappedurl)
title_html <- html_nodes(webpage, 'h1#title')
title <- html_text(title_html)
title <- str_replace_all(title, "[\r\n]" , "")  #to remove spaces and new lines
head(title)

#Price of Product
price_html <- html_nodes(webpage, 'span#priceblock_ourprice')
price <- html_text(price_html)
price <- str_replace_all(price, "[\r\n]", "")
head(price)

# product description
desc_html <- html_nodes(webpage, 'div#productDescription')
desc <- html_text(desc_html)
desc <- str_replace_all(desc, "[\r\n\t]", "")
desc <- str_trim(desc)
head(desc)

# Rating of the product
rate_html <- html_nodes(webpage, 'span#acrPopover')
rate <- html_text(rate_html)
rate <- str_replace_all(rate, "[\r\n]", "")
rate <- str_trim(rate)
head(rate[1])

# Size of Product
size_html <- html_nodes(webpage, 'div#variation_size_name')
size_html <- html_nodes(size_html, 'span.selection')
size <- html_text(size_html)
size <- str_replace_all(size, "[\r\n]","")
size <- str_trim(size)
head(size)

# color of product
color_html <- html_nodes(webpage, 'div#variation_color_name')
color_html <- html_nodes(color_html,'span.selection')
color <- html_text(color_html)
color <- str_replace_all(color, "[\r\n]", "")
color <- str_trim(color)
head(color)

# combining all data
product_data <- data.frame(Title = title, Price = price,Description = desc, Rating = rate, Size = size, Color = color)
str(product_data)

# convert dataframe to JSON format
json_data <- toJSON(product_data)
cat(json_data)
