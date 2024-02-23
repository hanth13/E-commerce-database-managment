library(RSQLite)

print('Loading the data')
data_files <- list.files('Data_upload',pattern="MOCK_DATA.csv", full.names=TRUE)
data_to_write <- data.frame()

#Fir each csv file
for (file in data_files){
  print(paste("Reading file:", file))
  this_file_row <- read.csv(file, stringAsFactor=FALSE)
  data_to_write <- rbind(data_to_write,this_file_rows)
}
print("Write them to the database")
connection <-  RSQLite::dbConnect(RSQLite::SQLite(),"ecommerce.db")
SQLite::dbWriteTable(connection,"products", data_to_write, overwrite = TRUE)
RSQLite::dbDisconnect(connection)
print("Done!")

