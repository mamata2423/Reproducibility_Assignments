# R Markdown used different packages

- knitter : to generate markdown formatted document
- pandoc
- R markdown

# Reasons to use R markdown

- can make full webpages with R markdown and can post in github.
- can prepare presentations
- can write manuscript

# YAML headers

- html is web format
- we can change output format as html_document, pdf_document,
  word_document etc.
- using toc : true, we can generate table of contents that corresponds
  to our headers.
- toc_float : true, we generate different style of table of contents
  (looks like webpage and we can click on the contents to directly go to
  that particular page).
- to display the document in github, we need to create a markdown file
  that github can recognize. The output should be md_document format
  with option variant : gfm that means github favoring markdown. File
  will have extension .md .
- this option will give us markdown formatted document. It is an
  intermediate step where R markdown generates a markdown format and R
  reads it and converts it into different other formats such as pdf,
  word etc.

# How to write R codes in R markdown

``` r
#R code example
# This is R code example

library(knitr)
library(ggplot2)
library(markdown)
```

\#It will not include code chunk but shows output

    ##    Length     Class      Mode 
    ##         1 character character

# Include figures

``` r
data("mtcars")
ggplot(mtcars,aes(x = wt, y = mpg)) +
geom_point()
```

![](R-Markdown-notes_files/figure-gfm/include%20figures-1.png)<!-- -->

``` r
data("mtcars")
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se = FALSE) +
  geom_point(aes(color = wt)) +
  xlab("Weight") + 
  ylab("Miles per gallon") +
  scale_colour_gradient(low = "forestgreen", high = "black")
```

    ## `geom_smooth()` using formula = 'y ~ x'

![](R-Markdown-notes_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

# How to format results

- We can make different levels of headers and table of contents of
  recognize these headers. Subheaders can be added within these headers.

# First level header

#### sub header

## Second level header

### Third level header

*this text is italics*

**this text is bold**

\#For making lists

- first item
- second item
  - first subitem

\#OR

1.  first item
2.  second item

# To add links

[Link to my github](https://github.com/mamata2423/ReproducibilityClass)

# Images

! [shrek ggplot](Xylella.jpg)

# Formatted tables

``` r
kable(mtcars, digits = 3, format = "markdown")
```

|                     |  mpg | cyl |  disp |  hp | drat |    wt |  qsec |  vs |  am | gear | carb |
|:--------------------|-----:|----:|------:|----:|-----:|------:|------:|----:|----:|-----:|-----:|
| Mazda RX4           | 21.0 |   6 | 160.0 | 110 | 3.90 | 2.620 | 16.46 |   0 |   1 |    4 |    4 |
| Mazda RX4 Wag       | 21.0 |   6 | 160.0 | 110 | 3.90 | 2.875 | 17.02 |   0 |   1 |    4 |    4 |
| Datsun 710          | 22.8 |   4 | 108.0 |  93 | 3.85 | 2.320 | 18.61 |   1 |   1 |    4 |    1 |
| Hornet 4 Drive      | 21.4 |   6 | 258.0 | 110 | 3.08 | 3.215 | 19.44 |   1 |   0 |    3 |    1 |
| Hornet Sportabout   | 18.7 |   8 | 360.0 | 175 | 3.15 | 3.440 | 17.02 |   0 |   0 |    3 |    2 |
| Valiant             | 18.1 |   6 | 225.0 | 105 | 2.76 | 3.460 | 20.22 |   1 |   0 |    3 |    1 |
| Duster 360          | 14.3 |   8 | 360.0 | 245 | 3.21 | 3.570 | 15.84 |   0 |   0 |    3 |    4 |
| Merc 240D           | 24.4 |   4 | 146.7 |  62 | 3.69 | 3.190 | 20.00 |   1 |   0 |    4 |    2 |
| Merc 230            | 22.8 |   4 | 140.8 |  95 | 3.92 | 3.150 | 22.90 |   1 |   0 |    4 |    2 |
| Merc 280            | 19.2 |   6 | 167.6 | 123 | 3.92 | 3.440 | 18.30 |   1 |   0 |    4 |    4 |
| Merc 280C           | 17.8 |   6 | 167.6 | 123 | 3.92 | 3.440 | 18.90 |   1 |   0 |    4 |    4 |
| Merc 450SE          | 16.4 |   8 | 275.8 | 180 | 3.07 | 4.070 | 17.40 |   0 |   0 |    3 |    3 |
| Merc 450SL          | 17.3 |   8 | 275.8 | 180 | 3.07 | 3.730 | 17.60 |   0 |   0 |    3 |    3 |
| Merc 450SLC         | 15.2 |   8 | 275.8 | 180 | 3.07 | 3.780 | 18.00 |   0 |   0 |    3 |    3 |
| Cadillac Fleetwood  | 10.4 |   8 | 472.0 | 205 | 2.93 | 5.250 | 17.98 |   0 |   0 |    3 |    4 |
| Lincoln Continental | 10.4 |   8 | 460.0 | 215 | 3.00 | 5.424 | 17.82 |   0 |   0 |    3 |    4 |
| Chrysler Imperial   | 14.7 |   8 | 440.0 | 230 | 3.23 | 5.345 | 17.42 |   0 |   0 |    3 |    4 |
| Fiat 128            | 32.4 |   4 |  78.7 |  66 | 4.08 | 2.200 | 19.47 |   1 |   1 |    4 |    1 |
| Honda Civic         | 30.4 |   4 |  75.7 |  52 | 4.93 | 1.615 | 18.52 |   1 |   1 |    4 |    2 |
| Toyota Corolla      | 33.9 |   4 |  71.1 |  65 | 4.22 | 1.835 | 19.90 |   1 |   1 |    4 |    1 |
| Toyota Corona       | 21.5 |   4 | 120.1 |  97 | 3.70 | 2.465 | 20.01 |   1 |   0 |    3 |    1 |
| Dodge Challenger    | 15.5 |   8 | 318.0 | 150 | 2.76 | 3.520 | 16.87 |   0 |   0 |    3 |    2 |
| AMC Javelin         | 15.2 |   8 | 304.0 | 150 | 3.15 | 3.435 | 17.30 |   0 |   0 |    3 |    2 |
| Camaro Z28          | 13.3 |   8 | 350.0 | 245 | 3.73 | 3.840 | 15.41 |   0 |   0 |    3 |    4 |
| Pontiac Firebird    | 19.2 |   8 | 400.0 | 175 | 3.08 | 3.845 | 17.05 |   0 |   0 |    3 |    2 |
| Fiat X1-9           | 27.3 |   4 |  79.0 |  66 | 4.08 | 1.935 | 18.90 |   1 |   1 |    4 |    1 |
| Porsche 914-2       | 26.0 |   4 | 120.3 |  91 | 4.43 | 2.140 | 16.70 |   0 |   1 |    5 |    2 |
| Lotus Europa        | 30.4 |   4 |  95.1 | 113 | 3.77 | 1.513 | 16.90 |   1 |   1 |    5 |    2 |
| Ford Pantera L      | 15.8 |   8 | 351.0 | 264 | 4.22 | 3.170 | 14.50 |   0 |   1 |    5 |    4 |
| Ferrari Dino        | 19.7 |   6 | 145.0 | 175 | 3.62 | 2.770 | 15.50 |   0 |   1 |    5 |    6 |
| Maserati Bora       | 15.0 |   8 | 301.0 | 335 | 3.54 | 3.570 | 14.60 |   0 |   1 |    5 |    8 |
| Volvo 142E          | 21.4 |   4 | 121.0 | 109 | 4.11 | 2.780 | 18.60 |   1 |   1 |    4 |    2 |

# Links to analysis

- [Data visualization 1](relative%20path%20to%20markdown%20file)
- [Data visualization 2](relative%20path%20to%20markdown%20file)

In our readme, we want to create a link so that anyone can go to the
markdown file in github. We can push all the files to github.

\# File tree

``` r
fs::dir_tree()
```

    ## .
    ## ├── 533452a.pdf
    ## ├── Advanced Visualization
    ## │   ├── Advanced Visualization.Rmd
    ## │   ├── Advanced-Visualization.pdf
    ## │   ├── BacterialAlpha.csv
    ## │   ├── CodingChallenge1.R
    ## │   ├── Coding_Notes_DataVisualization2.Rmd
    ## │   ├── Coding_Notes_DataVisualization2.pdf
    ## │   ├── Data Visualization 1.Rproj
    ## │   ├── Data_visualization.R
    ## │   ├── MycotoxinData.csv
    ## │   ├── README.md
    ## │   └── diff_abund.csv
    ## ├── Avoiding research misconduct_Mamata KC.docx
    ## ├── Baker,2016 Summary_Mamata KC.docx
    ## ├── Coding Challenge 1
    ## │   ├── Bull_richness.csv
    ## │   ├── Coding Challenge 1.Rproj
    ## │   ├── CodingChallenge1.R
    ## │   ├── CodingChallenge1.Rmd
    ## │   ├── CodingChallenge1.docx
    ## │   ├── CodingChallenge1.pdf
    ## │   ├── CodingPractice1_Mamata.docx
    ## │   └── README.md
    ## ├── CodingChallenge4_Markdown.docx
    ## ├── Data Visualization 1
    ## │   ├── CodingChallenge1.R
    ## │   ├── CodingChallenge2_IntroDataVis.docx
    ## │   ├── Coding_Notes_Data_Visualization1.Rmd
    ## │   ├── Coding_Notes_Data_Visualization1.pdf
    ## │   ├── Data Visualization 1.Rproj
    ## │   ├── Data_Visualization1.Rmd
    ## │   ├── Data_Visualization1_Mamata_KC.pdf
    ## │   ├── Data_visualization.R
    ## │   ├── MycotoxinData.csv
    ## │   ├── README.md
    ## │   └── Untitled.R
    ## ├── Data Visualization 2
    ## │   ├── BacterialAlpha.csv
    ## │   ├── Coding_Notes_DataVisualization2.Rmd
    ## │   ├── Coding_Notes_DataVisualization2.pdf
    ## │   └── diff_abund.csv
    ## ├── Data management strategies.docx
    ## ├── GithubAccountLink.docx
    ## ├── ProjectProposal_Mamata.docx
    ## ├── R Markdown coding challenge.Rmd
    ## ├── R Markdown notes.Rmd
    ## ├── R-Markdown-coding-challenge.pdf
    ## ├── R-Markdown-coding-challenge_files
    ## │   ├── figure-latex
    ## │   │   ├── unnamed-chunk-1-1.pdf
    ## │   │   ├── unnamed-chunk-2-1.pdf
    ## │   │   └── unnamed-chunk-3-1.pdf
    ## │   └── figure-markdown_strict
    ## │       ├── unnamed-chunk-1-1.png
    ## │       ├── unnamed-chunk-2-1.png
    ## │       └── unnamed-chunk-3-1.png
    ## ├── R-Markdown-notes.Rmd
    ## ├── R-Markdown-notes.docx
    ## ├── R-Markdown-notes.html
    ## ├── R-Markdown-notes.log
    ## ├── R-Markdown-notes.pdf
    ## ├── R-Markdown-notes.tex
    ## ├── R-Markdown-notes_files
    ## │   └── figure-gfm
    ## │       ├── include figures-1.png
    ## │       └── unnamed-chunk-2-1.png
    ## ├── RStudioWithGitIntegrated_Mamata.png
    ## ├── Xylella.jpg
    ## ├── githubaccount_mamata.png
    ## ├── password.rtf
    ## ├── ~$dingChallenge2_IntroDataVis.docx
    ## ├── ~$dingChallenge4_Markdown.docx
    ## └── ~$ta management strategies.docx

\# Following I have included one of my folder related to class so it is
not organized

- After copying and pasting the tree, it should turn red.
- Provide explicit information of all the files in readme documents as
  some examples below.

<!-- -->

    ├── 533452a.pdf
    ├── Advanced Visualization
    │   ├── Advanced Visualization.Rmd
    │   ├── Advanced-Visualization.pdf
    │   ├── BacterialAlpha.csv
    │   ├── CodingChallenge1.R
    │   ├── Coding_Notes_DataVisualization2.Rmd
    │   ├── Coding_Notes_DataVisualization2.pdf
    │   ├── Data Visualization 1.Rproj
    │   ├── Data_visualization.R
    │   ├── MycotoxinData.csv
    │   ├── README.md
    │   └── diff_abund.csv
    ├── Avoiding research misconduct_Mamata KC.docx
    ├── Baker,2016 Summary_Mamata KC.docx
    ├── Coding Challenge 1
    │   ├── Bull_richness.csv
    │   ├── Coding Challenge 1.Rproj
    │   ├── CodingChallenge1.R
    │   ├── CodingChallenge1.Rmd
    │   ├── CodingChallenge1.docx
    │   ├── CodingChallenge1.pdf
    │   ├── CodingPractice1_Mamata.docx
    │   └── README.md              # this is my readme file
    ├── Data Visualization 1      #This includes all the files from data visualization 1 course
    │   ├── CodingChallenge1.R
    │   ├── CodingChallenge2_IntroDataVis.docx
    │   ├── Coding_Notes_Data_Visualization1.Rmd
    │   ├── Coding_Notes_Data_Visualization1.pdf  #This is coding notes for data visualization 1
    │   ├── Data Visualization 1.Rproj
    │   ├── Data_Visualization1.Rmd
    │   ├── Data_Visualization1_Mamata_KC.pdf  #this is coding challenge for data visualization 1
    │   ├── Data_visualization.R
    │   ├── MycotoxinData.csv     #This is the data used for coding challenge `
    │   ├── README.md
    │   └── Untitled.R
    ├── Data Visualization2      #This includes all the files from data visualization 2 course
    │   ├── BacterialAlpha.csv
    │   ├── Coding_Notes_DataVisualization2.Rmd
    │   ├── Coding_Notes_DataVisualization2.pdf
    │   └── diff_abund.csv
    ├── Data management strategies.docx
    ├── GithubAccountLink.docx
    ├── ProjectProposal_Mamata.docx        #This is my project proposal
    ├── R Markdown notes.Rmd
    ├── R-Markdown-notes.html
    ├── RStudioWithGitIntegrated_Mamata.png    
    ├── Xylella.jpg
    ├── githubaccount_mamata.png 
    ├── password.rtf
    └── ~$dingChallenge2_IntroDataVis.docx   # this is coding challenge 2 notes

This is helpful because it will always trail back.

# Account on Zenodo

- works better with github.
- github and zenodo account should be linked.
- we need to find our repository and flip the switch for repositories in
  zenodo account.
- we need to go to github \> repository \> Create a new release \>
  create a tag name (might be version name) \> release title (eg
  creating zenodo) \> write a description \> publish. It will create a
  zip source code.
- sync github repositories in zenodo.
- Now badge is received (might take some time). Click on that badge, it
  gives markdown link. Copy the link and paste in README giving header
  name as DOI and push it to github. It will provide badge in README
  file in github.
