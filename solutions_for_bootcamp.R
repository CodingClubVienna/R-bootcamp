# answers for R bootcamp
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

### Step 1 - importing and exploring your data
# Import your data - there are 2 datasets here 
penguins_raw <- palmerpenguins::penguins_raw
penguins <- palmerpenguins::penguins

# what is the differences between the penguins and penguins raw datasets? 
head()
view()
glimpse()

### Step 2 - basic statistics data cleaning  
# give 5 pieces of information about the penguins from the raw dataset? 
# for example - total, mean, median etc
# if there are any na values they have to be ignored when calculating using na.rm
mean(penguins_raw$`Flipper Length (mm)`, na.rm = TRUE)
penguins_raw %>% count(Species)
summary(penguins_raw)

# change one or two column names to be lower case - Species to species
penguins_wo <- penguins_raw %>% rename("species" = "Species")
# change body mass values from g to kg 
penguins_raw %>% select('Body Mass (g)') %>% mutate(`Body Mass (g)`= `Body Mass (g)`*0.001)

# add the body mass values in kg as a column
body_mass_kg <- penguins_raw %>% rename("body_mass_kg" = "Body Mass (g)")
body_p <- bind_cols(penguins_raw, body_mass_kg)

# change a measurement from mm to cm (can be culmen or flipper length)
penguins_raw %>% select('Culmen Length (mm)') %>% mutate(`Culmen Length (mm)`= `Culmen Length (mm)`*0.1)

# select 5 columns and save the output
select() # for selecting columns can do by name or number
small.table <- select(penguins_raw, Species, Region, Island, 'Culmen Length (mm)', 'Body Mass (g)')
write.csv(x = small.table, file = '~/pathwaytoyourfile')
# subset the dataset (one penguin species,study name or island) and save the data.
filter() # for filtering rows
Gentoo_table <- filter(penguins_raw, Species == "Gentoo penguin (Pygoscelis papua)")
Gentoo_table <- penguins_raw %>% filter(Species == "Gentoo penguin (Pygoscelis papua)")
# switch the columns to rows
penguins_raw %>% pivot_wider(names_from = Island, values_from = `Culmen Length (mm)`)

### Step 3 - data visualisation - lets create some graphs
# please use the penguins dataset as it has already been cleaned up
# save each graph after you create it 
# to create any graph in ggplot2 there is a framework for the syntax 
ggplot(data = ___ , # dataset you want to use
# anything in side of aes() should be a variable
mapping = aes(x = ___  , y = ___  , color = ___  , fill = ___   ) +
# use geom to specify what shape your data will take eg. geom_point()
geom_ ___()

# for further info https://r-graph-gallery.com/ggplot2-package.html
       
# try to do a scatter plot where each species is plotted as a different colour or shape
p <- ggplot(data=penguins, aes(x = body_mass_g, y = flipper_length_mm))
p + geom_point(aes(color = species, shape = sex)) +
  labs(title = "Palmer penguin measurements", x = "Body mass (g)", 
       y = "Flipper length (mm)") +
  geom_smooth(aes(group = species, colour = species), method = lm, se = T) 

# plot a bar plot (eg how many penguins are on each island)
ggplot(penguins, aes(x=species)) + geom_bar(aes(color=island)) 
# plot a histogram
r <- ggplot(data = penguins, aes(x = flipper_length_mm, color = sex)),
r + geom_histogram(fill = "white"),
# plot a boxplot
s <- ggplot(data=penguins, aes(x = species, y = flipper_length_mm))
s + geom_boxplot(alpha = 0, aes(color = species)) 
       
# create a faceted plot (scatter plot, bar plot) facetting the data by the penguin species 
s + geom_boxplot(alpha = 0, aes(color = species)) + facet_grid(sex ~ .)       
       
### Step 4 - perform a principal component analysis (dimensionality reduction technique) 
# there are a couple of different ways to do this 
# see - https://www.geeksforgeeks.org/how-to-make-pca-plot-with-r/
# r has some inbuilt functions for this prcomp or princomp
install.packages("ggfortify")
library(ggfortify)
penguins_table <- drop_na(penguins)
penguins_pca <- prcomp(penguins_table[,c(3:6)], scale = TRUE)
summary(penguins_pca)
# create a scree plot
install.packages("factoextra")
library(factoextra)
fviz_eig(penguins_pca, addlabels = TRUE)
# visualise the pca plot
penguins_pca_plot <- autoplot(penguins_pca, data = penguins_table, colour = 'species', shape = 'sex')
# visualise on a biplot
biplot_penguins_pca <- biplot(penguins_pca)

## Step 5 - perform a t-test to answer the question do male penguins have longer flippers?
to compare means between the two groups 
female <- penguins %>% filter(sex=="female")
male <- penguins %>% filter(sex=="male")
t.test(female$flipper_length_mm, male$flipper_length_mm)

## Step 6 - extension tasks 
# create an interactive plot

# generate a sampling map to see where we sampled the penguins from    