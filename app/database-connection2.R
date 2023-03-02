db_connection <- function () {
  # (1) host = "127.0.0.1", This is for the test. (2) For production, check user or create new use , contact IT-staff (Goran-or-Läärka)
  dbConnect(RMariaDB::MariaDB(),dbname = "mgg2",
            host = "mysql", user = "root",
            password = "supersecret")
}

con <- db_connection()

db_disconnect <- function(con) {
  dbDisconnect(con)
}

## catalog lookup - en key/value-lista
catalog_lookup <- function(catalog_name){
  catalog <- tbl(con,"catalog") %>% collect()
  catalog$id[catalog$name == catalog_name]
}

## species lookup - en key/value-lista
species_lookup <- function(swe_name){
  species <- tbl(con,"species") %>% collect()
  species$id[species$swe_name == swe_name]
}


## project lookup
project_lookup <- function(project_name){
  projects <- tbl(con,"project") %>% collect()
  projects$id[projects$name == project_name]
}

## Fyndomständigheter lookup, we have 'NA' reason for id_omit
discovery_lookup <- function(swe_name){
  discovery <- tbl(con,"discovery") %>% collect()
  id <- discovery$id[discovery$swe_name == swe_name]
  id_omit <- na.omit(id)
  return (id_omit[1] )
}


## saves to the accession-table
# dbWriteTable(conn = db_connection,
#              name = 'accession',
#              value = df4
#              ,field.types = NULL,
#              row.names = FALSE,
#              overwrite = FALSE,
#              append = TRUE)

# 2022-01-03
formatting <- function(){
  df_new <- formattable(
    df(), 
    lapply(df(), function(x) {
      
      color_tile("lightgreen", "green")
    }
    )
  )
  as.datatable(df_new)
}

