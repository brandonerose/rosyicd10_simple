library(shiny)
library(magrittr)
library(shinydashboard)
library(DT)
drop_if <- function(x,drops) {
  x[which(!x%in%drops)]
}

make_table<-function(DF){
  DT::datatable(DF,
                selection = "multiple",
                editable = F,
                rownames = F,
                # extensions = 'Buttons',
                options = list(
                  columnDefs = list(list(className = 'dt-center',targets = "_all")),
                  paging = T,
                  pageLength = 50,
                  fixedColumns = TRUE,
                  ordering = TRUE,
                  scrollY = "500px",
                  scrollX = T,
                  # autoWidth = T,
                  searching = T,
                  # dom = 'Bfrtip',
                  # buttons = c('csv', 'excel',"pdf"),
                  scrollCollapse = F,
                  stateSave = F
                ),
                class = "cell-border",
                filter = 'top',
                escape =F
  )
}
ICD10<-read.csv("ICD10_dataframe.csv",stringsAsFactors = F)
ICD10c<-ICD10[which(ICD10$level=="chapter"),]
ICD10s<-ICD10[which(ICD10$level=="section"),]
ICD10l1<-ICD10[which(ICD10$level=="diag1"),]
ICD10l2<-ICD10[which(ICD10$level=="diag2"),]
ICD10l3<-ICD10[which(ICD10$level=="diag3"),]
ICD10l4<-ICD10[which(ICD10$level=="diag4"),]
ICD10l5<-ICD10[which(ICD10$level=="diag5"),]#add list in future?
ui <- dashboardPage(
  dashboardHeader(
    title=tags$head(tags$link(rel="icon", 
                                  href="logo.png", 
                                  type="png")
    )
      
  ),
  dashboardSidebar(
    sidebarMenu(
      div(
        style="text-align:center",
        tags$a(
          href="https://thecodingdocs.com",
          target="_blank",
          tags$img(src = "logo.png", width="80%")
        )
      ),
      fluidRow(
        column(
          12,
          shiny::actionButton(
            inputId='ab1',
            label="TheCodingDocs.com",
            icon = icon("stethoscope"),
            onclick ="window.open('https://thecodingdocs.com', '_blank')"),
          align="center")
      ),
      fluidRow(
        column(
          12,
          shiny::actionButton(
            inputId='ab2',
            label="GitHub Code",
            icon = icon("github"),
            onclick ="window.open('https://github.com/brandonerose/rosyicd10', '_blank')"
          ),
          align="center")
      ),
      fluidRow(
        column(
          12,
          shiny::actionButton(
            inputId='ab3',
            label="TheCodingDocs Twitter",
            icon = icon("twitter"),
            onclick ="window.open('https://twitter.com/TheCodingDocs', '_blank')"
          ),
          align="center"
        )
      ),
      fluidRow(
        column(
          12,
          shiny::actionButton(
            inputId='ab4',
            label="BRoseMDMPH Twitter",
            icon = icon("square-twitter"),
            onclick ="window.open('https://twitter.com/BRoseMDMPH', '_blank')"
          ),
          align="center")
      ),

      div(style="text-align:center",p(paste0('Version: 1.0.0'))),
      div(style="text-align:center",p(paste0('Last Updated: 1/23/23'))),
      menuItem("All ICD-10s", tabName = "all_tab"),
      menuItem("Chapters", tabName = "chapter_tab"),
      menuItem("Sections", tabName = "section_tab"),
      menuItem("Level 1s", tabName = "level1_tab"),
      menuItem("Level 2s", tabName = "level2_tab"),
      menuItem("Level 3s", tabName = "level3_tab"),
      menuItem("Level 4s", tabName = "level4_tab"),
      menuItem("Level 5s", tabName = "level5_tab"),
      shinydashboard::valueBoxOutput("vb1",width = 12),
      fluidRow(
        column(
          12,
          uiOutput("remove_all1"),
          align="center")
      ),
      textOutput("text_check")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "all_tab",
        fluidRow(checkboxGroupInput(
          "level",
          "Level(s): ",
          inline = T,
          choices = unique(ICD10$level),
          selected = unique(ICD10$level)
        )),
        fluidRow(
          DT::DTOutput("all_table")
        ),
        fluidRow(
          column(
            12,
            uiOutput("add"),
            align="center")
        ),
        fluidRow(
          column(
            12,
            uiOutput("downloadData_all"),
            align="center")
        ),

        h2("Selected Codes"),
        fluidRow(DT::DTOutput("selected_table")),
        fluidRow(
          column(
            12,
            uiOutput("remove"),
            align="center")
        ),
        fluidRow(
          column(
            12,
            uiOutput("remove_all2"),
            align="center")
        ),

        uiOutput("downloadData_selected")

      ),
      tabItem(
        tabName = "chapter_tab",
        fluidRow(DT::DTOutput("chapter_table"))
      ),
      tabItem(
        tabName = "section_tab",
        fluidRow(DT::DTOutput("section_table"))
      ),
      tabItem(
        tabName = "level1_tab",
        fluidRow(DT::DTOutput("level1_table"))
      ),
      tabItem(
        tabName = "level2_tab",
        fluidRow(DT::DTOutput("level2_table"))
      ),
      tabItem(
        tabName = "level3_tab",
        fluidRow(DT::DTOutput("level3_table"))
      ),
      tabItem(
        tabName = "level4_tab",
        fluidRow(DT::DTOutput("level4_table"))
      ),
      tabItem(
        tabName = "level5_tab",
        fluidRow(DT::DTOutput("level5_table"))
      )
    )
  ),
  skin = "green"
)


server <- function(input, output, session) {
  # table<-reactive(ICD10[which(ICD10$level%in%input$level),])
  values<-reactiveValues()
  values$codes<-NULL
  # tables------
  output$all_table<-DT::renderDT({
    ICD10[which(ICD10$level%in%input$level),] %>% make_table()
  })
  output$chapter_table<-DT::renderDT({
    ICD10c %>% make_table()
  })
  output$section_table<-DT::renderDT({
    ICD10s %>% make_table()
  })
  output$level1_table<-DT::renderDT({
    ICD10l1 %>% make_table()
  })
  output$level2_table<-DT::renderDT({
    ICD10l2 %>% make_table()
  })
  output$level3_table<-DT::renderDT({
    ICD10l3 %>% make_table()
  })
  output$level4_table<-DT::renderDT({
    ICD10l4 %>% make_table()
  })
  output$level5_table<-DT::renderDT({
    ICD10l5 %>% make_table()
  })
  output$selected_table<-DT::renderDT({
    ICD10[which(ICD10$code%in%values$codes),] %>% make_table()
  })
  #text-----
  output$text_check<-renderText({
    # values$codes
  })
  # ui --------
  output$add<-renderUI({
    actionButton("add_",paste0("Add Above Rows (", formatC(length(input$all_table_rows_all), format="d", big.mark=","),")"))
  })
  output$remove<-renderUI({
    actionButton("remove_",paste0("Remove Highlighted Rows (", formatC(length(input$selected_table_rows_selected), format="d", big.mark=","),")"))
  })
  output$remove_all1<-renderUI({
    actionButton("remove_all1_",paste0("Remove All Codes (", formatC(length(values$codes), format="d", big.mark=","),")"))
  })
  output$remove_all2<-renderUI({
    actionButton("remove_all2_",paste0("Remove All Codes (", formatC(length(values$codes), format="d", big.mark=","),")"))
  })
  output$downloadData_all<-renderUI({
    downloadButton('downloadData_all_', paste0('Download Above Report (',formatC(length(input$all_table_rows_all), format="d", big.mark=","),")"), style="display: block; margin: 0 auto; width: 230px;color: black;")
  })
  output$downloadData_selected<-renderUI({
    downloadButton('downloadData_selected_', paste0('Download Above Report (',formatC(length(values$codes), format="d", big.mark=","),")"), style="display: block; margin: 0 auto; width: 230px;color: black;")
  })
  #observes------

  output$downloadData_all_ <- downloadHandler(
    filename = function() {
      gsub(" ","_",paste("rosyicd10_filter_", Sys.time(), ".csv", sep=""))
    },
    content = function(file) {
      write.csv(ICD10[which(ICD10$level%in%input$level),][input$all_table_rows_all,], file,row.names = F)
    })
  output$downloadData_selected_ <- downloadHandler(
    filename = function() {
      gsub(" ","_",paste("rosyicd10_selected_", Sys.time(), ".csv", sep=""))
    },
    content = function(file) {
      write.csv(ICD10[which(ICD10$code%in%values$codes),], file,row.names = F)
    })

  observe({
    input$remove_all1_
    input$remove_all2_
    values$codes<-NULL
  })
  observeEvent(input$all_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10$code[which(ICD10$level%in%input$level)][input$all_table_rows_selected])  %>% drop_if(c("",NULL,NA,"NA",as.character(1:30)))%>% unique()
  })
  observeEvent(input$chapter_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10c$code[input$chapter_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$section_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10s$code[input$section_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$level1_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10l1$code[input$level1_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$level2_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10l2$code[input$level2_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$level3_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10l3$code[input$level3_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$level4_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10l4$code[input$level4_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$level5_table_rows_selected,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10l5$code[input$level5_table_rows_selected]) %>% drop_if(c("",NULL,NA,"NA",as.character(1:30))) %>% unique()
  })
  observeEvent(input$add_,ignoreInit = T,{
    values$codes<-values$codes %>% append(ICD10[which(ICD10$level%in%input$level),]$code[input$all_table_rows_all])  %>% drop_if(c("",NULL,NA,"NA",as.character(1:30)))%>% unique()
  })
  observeEvent(input$remove_,ignoreInit = T,{
    values$codes<-values$codes[which(!values$codes%in%ICD10$code[which(ICD10$code%in%values$codes)][input$selected_table_rows_selected])]
  })

  #valuebox -------
  output$vb1<-shinydashboard::renderValueBox({
    shinydashboard::valueBox(
      value = values$codes %>% length(),
      subtitle = "Selected Codes", width = 12
    )
  })
}

shinyApp(ui, server)
