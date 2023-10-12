### Welcome to the R for biologists bootcamp 
# Today we will be working with the Palmer penguins dataset!
# For this task some of the commands have been included to help you as hints
# lets load the package we need
install.packages('tidyverse')
install.packages('palmerpenguins')
library(tidyverse)
library(palmerpenguins)

# to look up what a command does you can 
help()
# cheat sheet
# https://www.datacamp.com/cheat-sheet/tidyverse-cheat-sheet-for-beginners

# many commands in the tidyverse use %>% which is called the operator 
# the functions we use after this will be applied to the data frame to the left of the operator
penguins_raw %>% head()
### Step 1 - importing and exploring your data
# Import your data - there are 2 datasets here 
penguins_raw <- palmerpenguins::penguins_raw
penguins <- palmerpenguins::penguins

# what is the differences between the penguins and penguins raw datasets? 
penguins %>% head()
view()
glimpse()

### Step 2 - basic statistics data cleaning  
# give 5 pieces of information about the penguins from the raw dataset? 
# for example - total, mean, median etc
# if there are any na values they have to be ignored when calculating using na.rm
mean(penguins_raw$`Flipper Length (mm)`, na.rm = TRUE)
penguins_raw %>% count(Species)
summary(penguins_raw)

# remove the stage column and save the output 
select() # for selecting columns
# change one or two column names to be lower case
rename()
# change body mass values from g to kg 
mutate()
# change the column title for body mass values
rename()
# change measurements from mm to cm
mutate()
# subset the dataset (one penguin species,study name or island) and save the data.
filter() # for filtering rows
# switch the columns to rows
pivot_wider()

### Step 3 - data visualisation - lets create some graphs
# please use the penguins dataset 
# save each graph after you create it 
# to create any graph in ggplot2 there is a framework for the syntax 
# https://ggplot2.tidyverse.org/reference/
# https://r-graph-gallery.com/ggplot2-package.html

# try to do a scatter plot where each species is plotted as a different colour or shape
geom_point()
# plot a bar plot (eg how many penguins are on each island)

# plot a histogram

# plot a boxplot

# create a faceted plot (scatter plot, bar plot) facetting the data by the penguin species 


### Step 4 - perform a principal component analysis (dimensionality reduction technique) 
# r has some inbuilt functions for this prcomp() or princomp()
# there are a couple of different ways to do this 
# see - https://www.geeksforgeeks.org/how-to-make-pca-plot-with-r/
# calculate the importance of components 

# create a scree plot
install.packages("factoextra")
library(factoextra)

# visualize the pca plot - what does it tell us?

# visualize with a biplot - what does it tell us?

## Step 5 - perform a t-test to answer the question do male penguins have longer flippers?



## Step 6 - extension tasks 
# create an interactive plot
# https://r-graph-gallery.com/ggplot2-package.html


# generate a sampling map to see where we sampled the penguins from 
