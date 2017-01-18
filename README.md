# Cohort R Package

## Read Me

`cohortr` applies the grammer of data manipulation to educational cohorts so that we can build data analysis that is insightful, transparent and reproducible.

`cohortr` uses a SQL based grammer that works with databases to provide reusable 
procedures to create statistical tables. The verbs in this grammer are functions that 
encapsulate the filters, joins and transformations required to quickly and reliably retrieve 
information about educational cohorts.

## Cohort Supporting Packages

`cohortr` relies on a family of packages designed to make R more efficient for
data analysts. Most of the ideas come from Hadley's [Tidyverse](https://github.com/tidyverse/tidyverse). Specificially, `dplyr`, the associated pipe operator and the notion of verbs is borrowed from the tidyverse.

In addition, I have created additional packages to support `cohortr` including:
[`datapointsr`](https://github.com/MattjCamp/datapointsr) and [`coderr`](https://github.com/MattjCamp/coderr).

`coderr` in particular is used throughout this package because it's designed
to automate SQL code writing.

### Installing Supporting Packages

Most of the packages can be installed in the normal way via
CRAN, but to get the packages that I built you will need to 
use `devtools` to install my packages from GitHub:

```{r}
# Install devtools if it's missing

install.packages("devtools")

library(devtools)

# Install remaining supporting packages

install_github('mattjcamp/coderr','mattjcamp')
install_github('mattjcamp/datapointsr','mattjcamp')

```

## Quick Start Example (WICHE)

Here is an example of how you might use `cohortr` to do
analysis. To follow this example, install the WICHE dataset
for R using `devtools`:

```{r}

# Install devtools if it's missing

install.packages("devtools")

library(devtools)

# Install WICHE projects

install_github('mattjcamp/wicher','mattjcamp')

```

This dataset shows school enrollments by state for a period of 30
years or so. The main dataset that you would look at is called
`wiche_2013`.

```{r}

library(wicher)
library(sqldf)
library(coderr)
library(tidyverse)

head(wiche_2013)

```

      location sector  race gender     grade year    n
    1       in public asian    all         8 2021 2306
    2       in public asian    all         9 2021 2407
    3       in public asian    all        10 2021 2314
    4       in public asian    all        11 2021 2801
    5       in public asian    all        12 2021 2578
    6       in public asian    all graduates 2021 2201

>**NOTE** `sqldf` is a library that you use to apply SQL code
to R dataframes.

>**NOTE** `tidyverse` is the set of packages used with the tidydata approach (Hadley).

Here is how you would get counts of enrolled students for the US by
sector for 2010 and 2011:

```{r}

"wiche_2013" %>%
  code_sql_sample("year in (2010, 2011) and location = 'us' 
                   and race = 'all' and gender = 'all' and grade = 'graduates'") %>%
  sqldf() %>% 
  group_by(sector, year) %>% 
  summarize(total = n(), total_proj = sum(n)) %>% 
  arrange(year, sector)

```

          sector  year total total_proj
           <chr> <int> <int>      <int>
    1        all  2010     1    3386358
    2 non-public  2010     1     312401
    3     public  2010     1    3073957
    4        all  2011     1    3407941
    5 non-public  2011     1     308284
    6     public  2011     1    3099657

Any verbs that go before `sqldf()` (or other SQL function for remote databases)
must be SQL statements from
`coderr` or `cohortr` while anything that comes after can be normal
`dplyr` verbs. The idea is that you can save the big data problems for
the server with SQL and then finish up fixing your data using R
functions.

>**NOTE** verbs that belong to the server usually start with `code_sql`. If you
write your own custom verbs try to follow that convention.

## Usage

Most likely, you have your own data sources and supporting materials
that you use to work with the cohort. The recommendation is to add this
package to your R installation and then write your own package (or just 
an RStudio project) that includes custom cohort verbs that you can intermingle
with the verbs included in `cohortr`.

For instance, we have lots of exams that are spread over lots of tables that can
be a real headache to use. So, in my private R installation I have written verbs
that encapsulate the process of gathering up SQL tables, joining, filtering and 
transformating SQL tables on our server.
