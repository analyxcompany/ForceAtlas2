#ForceAtlas2

This is the R implementation of the Force Atlas 2 graph layout designed for Gephi. The algorithm is detailed in:

[Jacomy M, Venturini T, Heymann S, Bastian M (2014) ForceAtlas2, a Continuous Graph Layout Algorithm for Handy Network Visualization Designed for the Gephi Software. PLoS ONE 9(6): e98679](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0098679)


## Installation

This package is not yet available in CRAN, so install it directly from Github with:

```R
# install.packages("devtools")
devtools::install_github("analyxcompany/ForceAtlas2")
```

## Usage

After installation the package is loaded as usual with:

```R
library(ForceAtlas2)
```

This implementation accepts as inputs an `igraph` object or a data frame. A full parameter description of the algorithm can be found in [Jacomy et al](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0098679), but a summary is accesible via `help("layout.forceatlas2")`.

Among those parameters you would probably like to set the number of iterations (`iterations`) and how often a plot of the positions should be generated (`plotstep`). This is particularly useful to evaluate the convergence of the algorithm. Set `plotstep=0` to suppress intermediate plots.

**igraph input**

For this example I will use the coappeareance network from Les Miserables, by Victor Hugo. Get more details about this data set with `igraph::nexus.info("miserables")`

```R
library(igraph) 
g <- nexus.get("miserables")
layout <- layout.forceatlas2(g, iterations=2000, plotstep=100)
```

This can be also plotted as an igraph object:

```R
plot(g, layout=layout)
```

**data frame input**

For those not familiar with the `igraph` package, is possible to calculate the algorithm directly from a data frame. This data frame should consist in three columns: `from`, `to`, and `weights`, indicating the corresponding nodes connections and the weights. 

```R
data <- get.data.frame(g)
```

After you have your data in that format, the application of the function is equivalent to the previous one, with one exception, the parameter `directed` indicating if the network is directed or not (`directed = TRUE` by default). In this example, `the miserables` is an undirected graph so we change it accordingly.

```R
layout.forceatlas2(data, directed=FALSE, iterations = 2000, plotstep = 100)
```

When the input is a data frame, the output is also a data frame including the name of the nodes and positions.

# Authors

- Bazyli Klockiewicz (bazyli.klockiewicz@analyx.com)
- Adolfo Álvarez (adolfo.alvarez@analyx.com)

