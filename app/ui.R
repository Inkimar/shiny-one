# Define UI for data upload app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Uploading Files"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ---- 
      fileInput("uploaded_file", "Choose the Excel-template",
                multiple = FALSE,
                accept = c( ".xls",".xlsx")
                ),
      numericInput("uploaded_file_rows", "Nr.rows", value = 1,min = 1),
      helpText(tags$em("Note: The number of rows in your excel-file")),
      textOutput("output_number_of_rows"), # test
      textInput("name", "Number of flagged fields in Excel", "Test :: <latitude on row 10 ; longitut on row 14>"),
      textOutput("boolean_visible"), # test
      textOutput("fails_in_exel"), # test
      # Horizontal line ----
      tags$hr(),
      
      # Horizontal line ----
      tags$hr()
      
      # Input: Select number of rows to display ----
      
      # radioButtons("disp", "Display",
      #              choices = c(Head = "head",
      #                          All = "all"),
      #              selected = "head")
      
    ),
    mainPanel(
     
       # if (visibility) {
        tabsetPanel(id = "dataset",
                    tabPanel("Input data", DT::dataTableOutput("rendered_file")),
                    tabPanel("Transformed data", DT::dataTableOutput("df_transformed"),
                             downloadButton("downloadData","Download as .csv"),
                            # downloadButton("downloadData2","Download as .xlsx"),
                             actionButton("databaseUpdate", "Save to Database")
                            ),
                    # testing 2022-05-22, panel for sheet-2
                    tabPanel("Sheet-2", DT::dataTableOutput("df_sheet2")), 
                    tabPanel("Sheet-2 : Transformed data ", DT::dataTableOutput("df_sheet2_transformed")), 
                    tabPanel("Map", leafletOutput("map")))
      
       # }
    )
    
    
  )
)