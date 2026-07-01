render_uniprot <- DT::JS("function(data, type, row, meta) {
                      return '<a href=\"https://www.uniprot.org/uniprotkb/' + data + '/entry\" target=\"_blank\">' + data + '</a>';
                    }")

render_doi <- DT::JS("function(data, type, row, meta) {
                      return '<a href=\"https://www.doi.org/' + data + '\" target=\"_blank\">' + data + '</a>';
                    }")

render_pmid <- DT::JS("function(data, type, row, meta) {
                      return '<a href=\"https://pubmed.ncbi.nlm.nih.gov/' + data + '\" target=\"_blank\">' + data + '</a>';
                    }")

np <- function(x) {
  res <- unique(x)
  ifelse(res == "", "Not available", res)
}
