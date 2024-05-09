#' Country Population Over Time Graph
#'
#' This function takes a country in the United Nations and spits out a graph
#' of that countries population over time.
#'
#'
#' @param countryName The name of a country in the UN
#' @examples
#' CountryPopulation('Brazil')
#' CountryPopulation('France')
#' @export

CountryPopulation <- function(countryName){
  country.data <- WorldPopulation[WorldPopulation$Country == countryName, ]
  if (nrow(country.data) == 0) {
    stop(paste("Error: ", countryName, "not found in the dataset."))
  }
  ggplot(country.data,
         aes(Year, Population))+
    geom_line()+
    theme_bw()+
    ggtitle(paste("Population of", countryName, "over time"))
}
