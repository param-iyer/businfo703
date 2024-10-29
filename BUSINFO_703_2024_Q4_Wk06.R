# Introduction
## BUSINFO 703 (Q4-2024) Wk06

# Tradition
## It is customary to start any programming with this step :)
print('Hello World!')

# R Programming
## Primary constructs: Sequential, Conditional and Iterative

## Sequential: Do A, then B, then C
a <- 5
print(paste('a is', a))
b <- 4
print(paste('b is', b))
c <- a * b
print(paste('a*b is', c))

## Conditional: If Condition is True, then do A, else do B
a <- 4 # change the value of a & run this block again (try 4, 5, 6)
b <- 5
if (a > b) {
  print(paste('a, which is', a, 'is more than b, which is', b))
} else if (a < b) {
  print(paste('a, which is', a, 'is less than b, which is', b))
} else {
  print(paste('a, which is', a, 'is equal to b, which is', b))
}

## Iterative: Repeat A based on some criterion
### Using FOR loop
for (i in 1:4) { # Note that i ranges from 1 to 4 (both inclusive)
  print(paste('i is', i, 'so square of i is', i^2))
}
### Using WHILE loop
i <- 1
while (i < 5) { # Note that i stays below 5
  print(paste('i is', i, 'so square of i is', i^2))
  i <- i + 1 # Don't forget to increment i, else it will be an infinite loop!!!
}

# Dataframes in R

## Creating a dataframe
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Score = c(85, 90, 88),
  Friend = c(TRUE, FALSE, TRUE)
)

## Displaying the dataframe
print(df) # Show contents
summary(df) # Summary of the dataframe
str(df) # Structure of the dataframe
nrow(df) # Number of rows
ncol(df) # Number of columns
dim(df) # Rows & Columns

## Accessing the dataframe
print(df$Name) # Accessing a column by name
print(df[,2]) # Accessing a specific column by number
print(df[2,]) # Accessing a specific row by number
print(df[2, "Age"]) # Accessing a specific element
print(df[1:2, c("Name", "Score")]) # Accessing multiple rows and columns

## Data manipulation
df$Gender <- c("F", "M", "M") # Adding a new column
print(df)
df$Gender <- NULL # Removing a column
print(df)
df[nrow(df) + 1, ] <- c("David", 28, 92, FALSE) # Adding a new row
print(df)
df <- df[-3, ] # Deleting the third row (Charlie)
print(df)

# Loading Data in R

## Standard dataset (iris)
df_iris <- iris
head(df_iris) # Show top 6 records

## Load CSV File (from the current folder)
df_iris_csv <- read.csv("iris.csv")
head(df_iris_csv) # Show top 6 records

## Load table from SQL Server
install.packages("RODBC") # need to install package once! Ignore the warning :)
library(RODBC) # Load the package in the session
### Replace with your SQL Server details (UoA NW Svr OR Azure)
con <- odbcDriverConnect('driver={SQL Server};
                         server=bemssqlprd01.uoa.auckland.ac.nz;
                         database=AdventureWorksDW2022;
                         uid=businfo703;
                         pwd=businfo703')
### Write your SQL query
query <- "SELECT * FROM DimCurrency"
df_dimcur_sql <- sqlQuery(con, query) # Load Query result into a dataframe
close(con) # Close connection after you are done with the server (good practice)
head(df_dimcur_sql) # Show top 6 records

# END