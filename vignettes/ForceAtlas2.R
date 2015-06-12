## ---- eval=FALSE---------------------------------------------------------
#  # install.packages("devtools")
#  devtools::install_github("adolfoalvarez/ForceAtlas2")

## ------------------------------------------------------------------------
library(ForceAtlas2)

## ---- echo=TRUE, eval=FALSE, fig.width = 7.2, fig.height = 6-------------
#  library(igraph)
#  g <- nexus.get("miserables")
#  layout <- layout.forceatlas2(g, iterations=2000, plotstep=100)
#  plot(g, layout=layout)

## ---- echo=FALSE, fig.width = 7.2, fig.height = 6------------------------
library(igraph) 
g <- nexus.get("miserables")
layout <- layout.forceatlas2(g, iterations=2000, plotstep=2000)

## ---- fig.width = 7.2, fig.height = 6------------------------------------
plot(g, layout=layout)

## ------------------------------------------------------------------------
data <- get.data.frame(g)
dim(data) #The dimension of the data
head(data,10) #We show just the first 10 rows

## ---- eval=FALSE, fig.width = 7.2, fig.height = 6------------------------
#  layout.forceatlas2(data, directed=FALSE, iterations = 2000, plotstep = 100)

## ---- echo=FALSE, fig.width = 7.2, fig.height = 6------------------------
layout <- layout.forceatlas2(data, directed=FALSE, iterations = 2000, plotstep = 2000)

## ------------------------------------------------------------------------
head(layout, 10) #Show just the 10 first rows

