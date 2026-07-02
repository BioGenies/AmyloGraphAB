render_link <- function(where)
  DT::JS(paste0("function(data, type, row, meta) {
                      return '<a href=\"", where, "/' + data + '.html\">' + data + '</a>';
                    }"))

render_uniprot <- DT::JS("function(data, type, row, meta) {
                      return '<a href=\"https://www.uniprot.org/uniprotkb/' + data + '/entry\" target=\"_blank\">' + data + '</a>';
                    }")


render_doi <- DT::JS("function(data, type, row, meta) {
                      return '<a href=\"https://www.doi.org/' + data + '\" target=\"_blank\">' + data + '</a>';
                    }")


markdown_link <- function(x, link, ext = "")
  paste0("[", x, "](", link, x, ext, ")")

markdown_doi <- function(x)
  markdown_link(x, "https://www.doi.org/")

markdown_pmid <- function(x)
  markdown_link(x, "https://pubmed.ncbi.nlm.nih.gov/")

markdown_uniprot <- function(x)
  markdown_link(x, "https://www.uniprot.org/uniprotkb/")


render_pmid <- DT::JS("function(data, type, row, meta) {
                      return '<a href=\"https://pubmed.ncbi.nlm.nih.gov/' + data + '\" target=\"_blank\">' + data + '</a>';
                    }")

np <- function(x) {
  res <- unique(x)
  ifelse(res == "", "Not available", res)
}

generate_interaction_assesments <- function(iaf) {
  interaction_sums <- rowSums(data.frame(no = grepl(x = iaf, pattern = "No effect") * 1, 
                                         complete = grepl(x = iaf, pattern = "complete") * 2,
                                         partial = grepl(x = iaf, pattern = "partial") * 4,
                                         faster = grepl(x = iaf, pattern = "Faster") * 8))
  
  # iaf[which(interaction_sums == 12)]
  # cut(interaction_sums, c(0, 1, 2, 3, 4, 5, 6, 8, 12, 13), right = TRUE)
  cut(interaction_sums, c(0, 1, 2, 3, 4, 5, 6, 8, 12, 13), right = TRUE,
      labels = c("No effect", "Complete inhibition", 
                 "Rather complete inhibition", "Partial inhibition", 
                 "Rather partial inhibition", "Complete or partial inhibition",
                 "Rather partial inhibition", "Faster aggregation", 
                 "Contradictory results"))
}


