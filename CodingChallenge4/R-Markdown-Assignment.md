Markdown – 25 pts

PLEASE READ THIS BEFORE CONTINUING

This assignment will help you practice integrating markdown into your R
scripts for literate programming. It will also involve some more
practice with GitHub. You may collaborate with a partner to enhance your
learning experience. Please ensure the following:

• Collaboration: If you work with a partner, include both names on the
final submission by editing the YAML header. • Submission: Only one
person should submit the assignment to Canvas in a Word document or .pdf
file generated through R markdown. Additionally, you should provide a
link to your GitHub, where the assignment should be viewable by
rendering it as a GitHub-flavored markdown file. • Setup: It is also
assumed you already have a GitHub repository for this class.

1.  4 pts. Explain the following

<!-- -->

1.  YAML header: YAML header is situated at the top of the R markdown
    script which includes information such as title of the document,
    author of the document, date and output format. Using different
    options in output, we can render our document as html, word
    document, pdf document etc. This documents are not recognized by
    github so, for github we can use option md document to obtain
    markdown formatted document which is an intermediate markdown format
    with extension .md and is recognized by github.

2.  Literate programming: Literate programming is an approach to make
    codes easily readable and understandable by humans thus it uses
    methods of writing codes along with detailed explanations of the
    codes. For example: R Markdown allows us to write chunks of codes
    with detailed explanations within a single document.

<!-- -->

2.  6 pts. Take the code you wrote for coding challenge 3, question 5,
    and incorporate it into your R markdown file. Some of you have
    already been doing this, which is great! Your final R markdown file
    should have the following elements.

<!-- -->

1.  At the top of the document, make a clickable link to the manuscript
    where these data are published. The link is here:  
2.  Noel, Z.A., Roze, L.V., Breunig, M., Trail, F. 2022. Endophytic
    fungi as promising biocontrol agent to protect wheat from Fusarium
    graminearum head blight. Plant Disease.
    <https://doi.org/10.1094/PDIS-06-21-1253-RE>
3.  Read the data using a relative file path with na.strings option set
    to “na”. This means you need to put the Mycotoxin.csv file we have
    used for the past two weeks into your directory, which git tracks.
4.  Make a separate code chunk for the figures plotting the DON data,
    15ADON, and Seedmass, and one for the three combined using
    ggarrange.

[MANUSCRIPT
LINK](https://apsjournals.apsnet.org/doi/10.1094/PDIS-06-21-1253-RE)

# Data

``` r
datum <- read.csv ("MycotoxinData.csv" , na.strings = "na") #loading data in R
str(datum)  #viewing the structure of the data
```

    ## 'data.frame':    375 obs. of  6 variables:
    ##  $ Treatment     : chr  "Fg" "Fg" "Fg" "Fg" ...
    ##  $ Cultivar      : chr  "Wheaton" "Wheaton" "Wheaton" "Wheaton" ...
    ##  $ BioRep        : int  2 2 2 2 2 2 2 2 2 3 ...
    ##  $ MassperSeed_mg: num  10.29 12.8 2.85 6.5 10.18 ...
    ##  $ DON           : num  107.3 32.6 416 211.9 124 ...
    ##  $ X15ADON       : num  3 0.85 3.5 3.1 4.8 3.3 6.9 2.9 2.1 0.71 ...

``` r
library(ggplot2) #loading library ggplot2
library(ggpubr) #loading library ggpubr
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") #loading color blind palette
```

# DON data boxplot

``` r
boxplot_DON <- ggplot(data = datum, aes(x = Treatment, y = DON, fill=Cultivar)) + #defining aesthetics x as Treatment and y as DON and fill by cultivar
  geom_boxplot(position = position_dodge(), outlier.shape = NA) +  #creating box plot without overlap and removing outlier
  geom_point(position = position_jitterdodge(dodge.width = 0.8), aes(fill=Cultivar),alpha = 0.6, shape=21) + #filling the box plot with data points without overlap and setting transparency of the data points as 0.6 and shape to 21
  scale_fill_manual(values = c(cbbPalette[[4]], cbbPalette[[7]])) + #setting fills of boxplot and data points manually
  xlab("") + #labelling x axis
  ylab("DON (ppm)") + #labelling y axis
  theme_classic() + #setting theme classic to make plain white background
  facet_wrap(~Cultivar) #separating the plots according to cultivars
boxplot_DON
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](R-Markdown-Assignment_files/figure-gfm/DON%20data-1.png)<!-- -->

``` r
boxplot_DON_pwc <- boxplot_DON + 
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format") #pair-wise comparisons between treatments
boxplot_DON_pwc
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](R-Markdown-Assignment_files/figure-gfm/DON%20data-2.png)<!-- -->

# 15ADON data boxplot

``` r
boxplot_15ADON <- ggplot(data = datum, aes(x = Treatment, y = X15ADON, fill = Cultivar)) + #defining aesthetics x as Treatment and y as DON
  geom_boxplot(position = position_dodge(), outlier.shape = NA) + #creating box plot without overlap and removing outliers
  geom_point(position = position_jitterdodge(dodge.width = 0.8), aes(fill=Cultivar),alpha = 0.6, shape=21) + #filling the box plot with data points without overlap and setting transparency of the data points as 0.6 and shape to 21
  scale_fill_manual(values = c(cbbPalette[[4]], cbbPalette[[7]])) + #setting fills of boxplot and data points manually
  xlab("") + #labelling x axis
  ylab("15ADON") + #labelling y axis
  theme_classic() + #setting theme classic to make plain white background
  facet_wrap(~Cultivar) #separating the plots according to cultivars
boxplot_15ADON
```

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](R-Markdown-Assignment_files/figure-gfm/15ADON%20data-1.png)<!-- -->

``` r
boxplot_15ADON_pwc <- boxplot_15ADON +
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format")  #pair-wise comparisons between treatments
 boxplot_15ADON_pwc
```

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](R-Markdown-Assignment_files/figure-gfm/15ADON%20data-2.png)<!-- -->

# Seedmass boxplot

``` r
boxplot_massperseed <- ggplot(data = datum, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) + #defining aesthetics x as Treatment and y as DON
  geom_boxplot(position = position_dodge(), outlier.shape = NA) + #creating box plot without overlap and removing outliers
  geom_point(position = position_jitterdodge(dodge.width = 0.8), aes(fill=Cultivar),alpha = 0.6, shape=21) + #filling the box plot with data points without overlap and setting transparency of the data points as 0.6 and shape to 21
  scale_fill_manual(values = c(cbbPalette[[4]], cbbPalette[[7]])) + #setting fills of boxplot and data points manually
  xlab("") + #labelling x axis
  ylab("Seed Mass (mg)") + #labelling y axis
  theme_classic() + #setting theme classic to make plain white background
  facet_wrap(~Cultivar) #separating the plots according to cultivars
boxplot_massperseed
```

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](R-Markdown-Assignment_files/figure-gfm/Seedmass%20data-1.png)<!-- -->

``` r
 boxplot_massperseed_pwc <- boxplot_massperseed +
  geom_pwc(aes(group = Treatment), method = "t.test", label = "p.adj.format") #pair-wise comparisons between treatments
 boxplot_massperseed_pwc
```

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](R-Markdown-Assignment_files/figure-gfm/Seedmass%20data-2.png)<!-- -->

# Combined figure

``` r
 figure_pwc <- ggarrange( 
  boxplot_DON_pwc, #plotting boxplot1_pwc
  boxplot_15ADON_pwc, #plotting boxplot_15ADON_pwc
  boxplot_massperseed_pwc, #plotting boxplot_massperseed_pwc
  labels = "AUTO", #setting labels as A, B and C
  nrow = 1, #combining figures with single row
  ncol = 3, #combining figures with 3 columns
  common.legend = TRUE, #combining legends for all three figures as one
  legend = TRUE #displaying legend
)
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

``` r
figure_pwc
```

![](R-Markdown-Assignment_files/figure-gfm/combined%20figure-1.png)<!-- -->
