# anpassat till denna, mammals_template_tamp_4_english-columns.xlsx , där lat och long är av typen 'numeric'

# sheet-1
load_data <- function(file_path, sheet = 1, na_strings ="") {
  if (endsWith(file_path, ".xls") | endsWith(file_path, ".xlsx")) {
    raw_data <- readxl::read_excel(path = file_path,
                                   col_names = TRUE,
                                   #col_types = c("text", "text","text", "text","date", "date","date", "date","text", "text","text", "text","numeric", "numeric","text","text"),
                                   #col_types = c("text", "text","text", "text","date", "date","date","text", "text","text", "numeric", "numeric","text"),
                                   na = na_strings,
                                   trim_ws = TRUE,
                                   sheet = sheet)
  } else if (endsWith(file_path, ".ods")) { # ie.not-tested
    raw_data <- readODS::read_ods(path = file_path,  
                                  col_names = TRUE,
                                  na = na_strings,
                                  sheet = sheet)
  } 
  data.frame(raw_data)
}

# sheet-2
load_data_2  <- function(file_path, sheet = 2, na_strings ="") {
  if (endsWith(file_path, ".xls") | endsWith(file_path, ".xlsx")) {
    raw_data <- readxl::read_excel(path = file_path,
                                   col_names = TRUE,
                                   col_types = c("text", "text","text", "text","text", "text","text"),
                                   na = "",
                                   trim_ws = TRUE,
                                   sheet = sheet)
  } 
  data.frame(raw_data)
}

check_rows <- function(df,rows=2){
 # verify(raw_data, nrow(raw_data) == 2)
  message("in excel2-file ",df()$accession.latitude)
}
## Download data
create_output <- function(res) {
  dt <- res
}