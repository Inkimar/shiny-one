# https://github.com/Naturhistoriska/MFO-Esbase/wiki/%5BYordan-Belivanov,-MF%C3%96%5D-Mapping-of--Accession-id-(OBS-accession.id-%C3%A4r-accessionnummer) 
accession_transformation <- function(accession_number){
  first_character <- substr(accession_number,1,1) #första försök, kanske finns det flera ..
  
  if (first_character == 'A') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("1",accession_number, sep = "")
  }
  
  if (first_character == 'B') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("2",accession_number, sep = "")
  }
  
  if (first_character == 'C') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("3",accession_number, sep = "")
  }
  
  if (first_character == 'D') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("4",accession_number, sep = "")
  }
  
  if (first_character == 'G') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("7",accession_number, sep = "")
  }
  
  if (first_character == 'H') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("8",accession_number, sep = "")
  }
  
  if (first_character == 'L') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("5",accession_number, sep = "")
  }
  
  if (first_character == 'P') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("9",accession_number, sep = "")
  }
  
  if (first_character == 'X') {
    accession_number <- gsub("\\/", "", accession_number) # removes the backlash
    accession_number <- substring(accession_number,3) # remove the first 2 characters
    accession_number <- paste("6",accession_number, sep = "") 
  }
  
  
  return(accession_number)
}

# testing the function with 'testthat'
library(testthat)

# assert that the function is correct
accession_number <- "A2009/05452"
expected_value <- "100905452"
expect_match(expected_value,accession_transformation(accession_number = accession_number))


accession_number <- "C2011/06768"
expected_value <- "301106768"
expect_match(expected_value,accession_transformation(accession_number = accession_number))

accession_number <- "P1994/02535"
expected_value <- "999402535"
accession_transformation(accession_number = accession_number)
