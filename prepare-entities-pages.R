library(dplyr)

amyloids <- read.csv("data/Amyloids.csv")

file.copy("headers/peptide-header.qmd", "peptides")

colnames(amyloids)

"Modifications.to.UniProt.sequence..If.not.UniProt..Sequential.info..Structural.if.available..separate.by.commas."

unique(dat[c("AGAMYID", "UniProt.ID", "AGAMYID_display_name", "Species.if.not.human",
             "AGAMYID_basis", "AGAMYID_uniprot_name")])


dir.create("docs/amyloids/")

for(ith_amyloid_id in unique(amyloids[["AGAMYID"]])) {

  param_list <- list(AGAMYID = ith_amyloid_id)
  
  output_file <- paste0(ith_amyloid_id, ".html")
  
  quarto::quarto_render(input = "headers/amyloid-header.qmd",
                        execute_params = param_list,
                        output_file = paste0(ith_amyloid_id, ".html"),
                        execute_dir = getwd(), 
                        metadata_file = "_quarto.yml",
                        quiet = FALSE)
  
  system(paste0("sed -i '' 's|amyloid-header_files/libs/|../site_libs/|g' headers/",  output_file))
  system(paste0("sed -i '' 's|styles.css|../styles.css|g' headers/",  output_file))
  
  file.rename(paste0("headers/", output_file), paste0("docs/amyloids/", output_file))
}


antibodies <- read.csv("data/Antibodies.csv")

dir.create("docs/antibodies/")

for(ith_antibody_id in unique(antibodies[["ABID_base"]])) {
  
  param_list <- list(ABIDbase = ith_antibody_id)
  
  output_file <- paste0(ith_antibody_id, ".html")
  
  quarto::quarto_render(input = "headers/antibody-header.qmd",
                        execute_params = param_list,
                        output_file = paste0(ith_antibody_id, ".html"),
                        execute_dir = getwd(), 
                        metadata_file = "_quarto.yml",
                        quiet = FALSE)
  
  system(paste0("sed -i '' 's|antibody-header_files/libs/|../site_libs/|g' headers/",  output_file))
  system(paste0("sed -i '' 's|styles.css|../styles.css|g' headers/",  output_file))
  
  file.rename(paste0("headers/", output_file), paste0("docs/antibodies/", output_file))
}


interactions <- read.csv("data/Interactions.csv")

dir.create("docs/interactions/")

for(ith_interaction_id in unique(interactions[["AMGABID"]])) {
  
  param_list <- list(AMGABID = ith_interaction_id)
  
  output_file <- paste0(ith_interaction_id, ".html")
  
  quarto::quarto_render(input = "headers/interaction-header.qmd",
                        execute_params = param_list,
                        output_file = paste0(ith_interaction_id, ".html"),
                        execute_dir = getwd(), 
                        metadata_file = "_quarto.yml",
                        quiet = FALSE)
  
  system(paste0("sed -i '' 's|interaction-header_files/libs/|../site_libs/|g' headers/",  output_file))
  system(paste0("sed -i '' 's|styles.css|../styles.css|g' headers/",  output_file))
  
  file.rename(paste0("headers/", output_file), paste0("docs/interactions/", output_file))
}

