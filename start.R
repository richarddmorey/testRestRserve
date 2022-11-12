# If package cli is installed - the code below fails.
# If package cli is not installed, it works. 
install.packages('cli')
# remove.packages('cli')
library(promises)
rmd = TRUE


library(RestRserve)

app = Application$new()

tf = tempfile(fileext = '.qmd')
cat('**hi**\n', file = tf)

app$add_get(
  path = "/a", 
  FUN = function(.req, .res) {
    if(rmd)
      rmarkdown::render(
        input = tf,
        output_format = 'html_fragment',
        quiet = TRUE
    )
    .res$set_content_type("application/json")
    .res$set_body(list())
  })

backend = BackendRserve$new()
backend$start(app, http_port = 8080)

