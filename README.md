
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rosyicd10 <img src="man/figures/logo.png" align="right" height="200" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of rosyicd10 is to select ICD10 codes! We are still in
development.

## Installation

You can install the development version of rosyicd10 like so:

``` r
# install remotes package if you don't have it
# install.packages("remotes") 
remotes::install_github("brandonerose/rosyicd10")
```

If you have any issues above download the most recent version of R at
RStudtio and update all packages in RStudio. See
[thecodingdocs.com/r/getting-started](https://www.thecodingdocs.com/r/getting-started "R Getting Started").

## Run

This is how you launch the app locally!

``` r
library(rosyicd10)

run_app()
```

## Links

The LIVE website (to run the live app) is at
[brandonerose.shinyapps.io/rosyicd10/](https://brandonerose.shinyapps.io/rosyicd10/ "rosyicd10 app")
If the website gets too much traffic you may need to install the current
version yourself below.

The rosyicd10 package (to run the app locally) is at
[github.com/brandonerose/rosyicd10](https://github.com/brandonerose/rosyicd10 "rosyicd10 R package")
See instructions above. Install remotes, install rosyicd10, and
run_app()

Donate if I helped you out and want more development (anything helps)!
[account.venmo.com/u/brandonerose](https://account.venmo.com/u/brandonerose "Venmo Donation")

The simple example shiny app (for learning shiny) is at
[github.com/brandonerose/rosyicd10_simple](https://github.com/brandonerose/rosyicd10_simple "rosyicd10 R project")
Just download the entire folder, open it as an R project, and run the
app.R (make sure you have all library packages installed)

For more R coding visit
[thecodingdocs.com/](https://www.thecodingdocs.com/ "TheCodingDocs.com")

Follow us on Twitter
[twitter.com/TheCodingDocs](https://twitter.com/TheCodingDocs "TheCodingDocs Twitter")

Follow me on Twitter
[twitter.com/BRoseMDMPH](https://twitter.com/BRoseMDMPH "BRoseMDMPH Twitter")

## ICD10 data

I custom made this data.frame in R. If you’re interested let me know and
I can share the code. The raw XML can be found at
[cms.gov/medicare/icd-10/2023-icd-10-cm](https://www.cms.gov/medicare/icd-10/2023-icd-10-cm "ICD10 Raw")

``` r
library("rosyicd10")

kableExtra::kable(ICD10[1:10, ])# show first 10 rows
```

<table>
<thead>
<tr>
<th style="text-align:left;">
code
</th>
<th style="text-align:left;">
name
</th>
<th style="text-align:left;">
inclusionTerm
</th>
<th style="text-align:left;">
notes
</th>
<th style="text-align:left;">
includes
</th>
<th style="text-align:left;">
excludes1
</th>
<th style="text-align:left;">
excludes2
</th>
<th style="text-align:left;">
codeFirst
</th>
<th style="text-align:left;">
useAdditionalCode
</th>
<th style="text-align:left;">
codeAlso
</th>
<th style="text-align:left;">
sevenChr
</th>
<th style="text-align:left;">
level
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Certain infectious and parasitic diseases (A00-B99)
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
These categories are provided for use as supplementary or additional
codes to identify the infectious agent(s) in diseases classified
elsewhere.
</td>
<td style="text-align:left;">
infections due to Mycobacterium tuberculosis and Mycobacterium bovis
</td>
<td style="text-align:left;">
other protozoal intestinal diseases (A07.-)
</td>
<td style="text-align:left;">
mycosis fungoides (C84.0-)
</td>
<td style="text-align:left;">
condition resulting from (sequela) the infectious or parasitic disease
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
chapter
</td>
</tr>
<tr>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
Intestinal infectious diseases (A00-A09)
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
section
</td>
</tr>
<tr>
<td style="text-align:left;">
A00
</td>
<td style="text-align:left;">
Cholera
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag1
</td>
</tr>
<tr>
<td style="text-align:left;">
A00.0
</td>
<td style="text-align:left;">
Cholera due to Vibrio cholerae 01, biovar cholerae
</td>
<td style="text-align:left;">
Classical cholera
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag2
</td>
</tr>
<tr>
<td style="text-align:left;">
A00.1
</td>
<td style="text-align:left;">
Cholera due to Vibrio cholerae 01, biovar eltor
</td>
<td style="text-align:left;">
Cholera eltor
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag2
</td>
</tr>
<tr>
<td style="text-align:left;">
A00.9
</td>
<td style="text-align:left;">
Cholera, unspecified
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag2
</td>
</tr>
<tr>
<td style="text-align:left;">
A01
</td>
<td style="text-align:left;">
Typhoid and paratyphoid fevers
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag1
</td>
</tr>
<tr>
<td style="text-align:left;">
A01.0
</td>
<td style="text-align:left;">
Typhoid fever
</td>
<td style="text-align:left;">
Infection due to Salmonella typhi
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag2
</td>
</tr>
<tr>
<td style="text-align:left;">
A01.00
</td>
<td style="text-align:left;">
Typhoid fever, unspecified
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag3
</td>
</tr>
<tr>
<td style="text-align:left;">
A01.01
</td>
<td style="text-align:left;">
Typhoid meningitis
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
diag3
</td>
</tr>
</tbody>
</table>

You can find the raw CSV at
[github.com/brandonerose/rosyicd10_simple/blob/main/ICD10_dataframe.csv](https://github.com/brandonerose/rosyicd10_simple/blob/main/ICD10_dataframe.csv "ICD10 CSV")

You can also load the csv directly into R without installing the
rosyicd10 package …

``` r
ICD10<-read.csv("https://raw.githubusercontent.com/brandonerose/rosyicd10_simple/main/ICD10_dataframe.csv",stringsAsFactors = F)
```
