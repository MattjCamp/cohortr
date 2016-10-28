# Cohort R Package

## Read Me

`cohortr` applies the grammer of data manipulation to educational cohorts so that we can built analysis that is insightful, transparent and reproducible.

`cohortr` uses a SQL based grammer that works with databases to provide reusable 
procedures to create statistical tables. The verbs in this grammer are functions that 
encapsulate the filters, joins and transformations required to quickly and reliably retrieve 
information about educational cohorts.

## Cohort Supporting Packages

`cohortr` relies on a family of packages designed to make R more efficient for
data analysts. Most of the ideas come from Hadley's [Tidyverse](https://github.com/tidyverse/tidyverse). Specificially, `dplyr`, the associated pipe operator and the notion of verbs is borrowed from the tidyverse.

In addition, I have created additional packages to support `cohortr` including:
[`datapointsr`](https://github.com/MattjCamp/datapointsr), [`coderr`](https://github.com/MattjCamp/coderr) and [`dbr`](https://github.com/MattjCamp/dbr).

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
install_github('mattjcamp/dbr','mattjcamp')
install_github('mattjcamp/datapointsr','mattjcamp')

```

## Quick Start Example

Here is an example of how you might use the built-in
example database to get counts and means of the students in 
the cohorts that you are interested in:

```{r}
"students" %>%
code_sql_sample("year in (2010, 2011)") %>%
pull_data() %>% 
group_by(year) %>% 
summarize(n = length(person),
          mean = mean(score))
```

**students** is a table on a SQLite database that comes with the installation of `cohortr`. This is used as a stand in to a database server that would typically house this kind of data. The code above would produce this output:

```
# A tibble: 2 × 3
   year     n  mean
  <int> <int> <dbl>
1  2010     4 83.25
2  2011     5 82.60
```

Any verbs that go before `pull_data()` must be SQL statements from
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

I then plug in these verbs as needed to `cohortr` to build up analysis and visualizations.

### Required!

One thing you will have to do is to override the implementation of `pull_data` if you want to use your own data source. This function points to the database that comes with this package and is used in the example. What you could do is copy this function and then replace the object `db` with a reference to your database. The only requirement is that your `db` object must be a database object from the `dbr` package.

For instance, I have an Amazon Redshift `db` object and in my private pull_data function all my credentials are entered in when `pull_data` is called for the first time. You could do the same with MS SQL Server, Amazon Redshift or a local SQLite database.

>**NOTE** It's not actually 100% required that you override `pull_data`. You should instead swap out your own query method as long as is able to process SQL statments. So, if you were using data frames you could use something like `sqldf` to execute SQL against your data frame.

## To-Do

Here is some stuff that needs to happen next.

### Need to Code these Verbs

- code_sql_select_most_recent
- calculate_participation_rates
