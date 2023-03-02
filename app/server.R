# Define server logic to read selected file ----
# 2022-04-24  - TODO , läs in lookup-tabeller här - kontroll nedan ...

server <- function(input, output,session) {
  # variable
  
  # Create temp file location
  log_path <- file.path(getwd(), "log")
  
  set_logfile(file.path(log_path, "loggit.log"), confirm = FALSE) 
  loggit("INFO", "app has started", app = "start")
  
  #con<- db_connection()
  df <- reactive({
    req(input$uploaded_file)
    load_data(input$uploaded_file$datapath)
  })
  
  # 2022-05-23
  df_sheet2 <- reactive({
    req(input$uploaded_file)
    load_data_2(input$uploaded_file$datapath)
  })
 
  message("2022-05-23 ", "hi") # loggit

  
  # testing, when event - then write to log
  # observeEvent(
  #     req(input$uploaded_file_rows), {
  #     log_mess <- paste("Said ",input$uploaded_file_rows, " was ", nrow(df()), " - any?")
  #     message("2022-05-05 ", log_mess)
  # })
  
  # https://www.satellitkarta.se/latitud-longitud.html , egenhändigt gjorde gränser - @Todo
  
  # Gränsvärden 
  LIMIT_LONG_WEST = 10.5; 
  LIMIT_LONG_EAST= 23.9;
  LIMIT_LATI_NORTH= 69.1;
  LIMIT_LATI_SOUTH= 55.1
 
   output$rendered_file <- DT::renderDataTable({
    latitude_formatter <- formatter("span", 
                                  style = x ~ style(color = ifelse(x > LIMIT_LATI_NORTH, "red", 
                                                                   ifelse(x < LIMIT_LATI_SOUTH, "red", "green"))))
    longitude_formatter <- formatter("span", 
                                    style = x ~ style(color = ifelse(x > LIMIT_LONG_EAST, "red", 
                                                                     ifelse(x < LIMIT_LONG_WEST, "red", "green"))))
    df_new <- formattable(df(), 
                          list(accession.latitude = latitude_formatter, 
                               accession.longitude = longitude_formatter)
                          )
    as.datatable(df_new)
  })
  
  
  dfTransformed2 <-  reactive({
    df4 <- data.frame(
     catalog_id = unlist(lapply(X=df()$catalog.name,catalog_lookup)),
     id = unlist(lapply(X=df()$accession_number,accession_transformation)), # Transforms accnr to integer
     oldnumber = unlist(df()$accession.oldnumber),
     species_id = unlist(lapply(X=df()$species.swedish_name,species_lookup)),
     arrival_date = unlist(df()$accession.arrival_date),
     discovery_date_start = unlist(as.Date(df()$accession.discovery_date_start)),
     discovery_date_end = unlist(as.Date(df()$accession.discovery_date_end)),
     discovery_id = unlist(lapply(X=df()$discovery.swe_name,discovery_lookup)),
     description = unlist(df()$accession.description), # Beskrivning av fyndomständigheterna
     findplace_note = unlist(df()$accession.findplace_note),  # Fyndplats, beskrivning
     latitude = unlist(df()$accession.latitude),
     longitude = unlist(df()$accession.longitude),
     project_id = unlist(lapply(X=df()$project.name,project_lookup))
    )
  })
  
  # testing
  check1 <- reactive({
    check_rows(dfTransformed2())
  })
  

  
  # For the UI - values that will be inserted to db
  output$df_transformed <- DT::renderDataTable({
    dfTransformed2()
  })
  
  # Start:test2
  dfTransformed_sheet2 <-  reactive({
    df4 <- data.frame(
      id = unlist(lapply(X=df_sheet2()$accession_number,accession_transformation)),
      material_type.swe_name = unlist(df_sheet2()$material_type.swe_name),
      material.amount_original = unlist(df_sheet2()$material.amount_original),
      material.amount_left = unlist(df_sheet2()$material.amount_left),
      material_storage.name = unlist(df_sheet2()$material_storage.name),
      material.storage_id = unlist(df_sheet2()$material.storage_id),
      material.storage_note = unlist(df_sheet2()$material.storage_note)
      #id = unlist(lapply(X=dfsheet2()$accession_number,accession_transformation)), # Transforms accnr to integer
      # description = unlist(df()$accession.description), # Beskrivning av fyndomständigheterna
      # findplace_note = unlist(df()$accession.findplace_note),  # Fyndplats, beskrivning
      # latitude = unlist(df()$accession.latitude)
    )
  })
  output$df_sheet2 <- DT::renderDataTable({
    dfTransformed_sheet2()
  })
  
  # End:test2
  
  # preparing Map. rem: using 'mutate' and convering to number 'cause not using 'col_types' in uploading-the-excel
  df_coord<-  reactive({
    df() %>% select('accession.latitude','accession.longitude','species.swedish_name') %>% 
      mutate(accession.latitude = parse_number(accession.latitude)) %>% 
      mutate(accession.longitude = parse_number(accession.longitude)) 
  })
  
  # For the UI - map
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(urlTemplate = "//{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png", 
               options = tileOptions(maxZoom = 18), 
               group = "Gray", layerId = "test") %>%  
      addCircleMarkers(lng=df_coord()$accession.longitude , lat=df_coord()$accession.latitude, radius=8 , color="black", 
                       fillColor="red", stroke = TRUE, fillOpacity = 0.8, popup = df_coord()$species.swedish_name)
  })
  
  # Generate downloadable csv-file
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("GPS_data_", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      yx <- create_output(res = dfTransformed2())  
      if(input$disp == "head") {
        write.table(head(yx), file, row.names = FALSE, fileEncoding = "utf8", sep = ",")
      } else {
        write.table(yx, file, row.names = FALSE, fileEncoding = "utf8", sep = ",")
      }
    }) # end-download_csv
  
  # Sheet-1, write to database [ value = dfTransformed2() ] 
  observeEvent(input$databaseUpdate, {
    session$sendCustomMessage(type = 'testmessage',
                              message = 'Thank you for clicking')
   # log_print("Fire away")
    dbWriteTable(conn =  db_connection(),
                 name = 'accession',
                 value = dfTransformed2()
                 ,field.types = NULL,
                 row.names = FALSE,
                 overwrite = FALSE,
                 append = TRUE)
  })
}