% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/text_transform.R
\name{text_replace}
\alias{text_replace}
\title{Perform highly targeted text replacement with a regex pattern}
\usage{
text_replace(data, pattern, replacement, locations = cells_body())
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{pattern}{A regex pattern used to target text fragments in the cells
resolved in locations.}

\item{replacement}{The replacement text for any matched text fragments.}

\item{locations}{The cell or set of cells to be associated with the text
transformation. Only the \code{\link[=cells_body]{cells_body()}}, \code{\link[=cells_stub]{cells_stub()}},
\code{\link[=cells_column_labels]{cells_column_labels()}}, and \code{\link[=cells_row_groups]{cells_row_groups()}} helper functions can be
used here. We can enclose several of these calls within a \code{list()} if we
wish to make the transformation happen at different locations.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
The \code{text_replace()} function provides a specialized interface for replacing
text fragments in table cells with literal text. You need to ensure that
you're targeting the appropriate cells with the \code{locations} argument. Once
that is done, the remaining two values to supply are for the regex pattern
(\code{pattern}) and the replacement for all matched text (\code{replacement}).
}
\section{Examples}{


Use \code{\link{metro}} to create a \strong{gt} table. Merge the \code{name} and \code{caption}
columns together but only if \code{caption} doesn't have an \code{NA} value (the
special \code{pattern} syntax of \code{"{1}<< ({2})>>"} takes care of this). This
merged content is now part of the \code{name} column. We'd like to modify this
further wherever there is text in parentheses: (1) make that text italicized,
and (2) introduce a line break before the text in parentheses. We can do this
with the \code{text_replace()} function.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{metro |>
  dplyr::select(name, caption, lines) |>
  dplyr::slice(110:120) |>
  gt() |>
  cols_merge(
    columns = c(name, caption),
    pattern = "\{1\}<< (\{2\})>>"
  ) |>
  text_replace(
    locations = cells_body(columns = name),
    pattern = "\\\\((.*?)\\\\)",
    replacement = "<br>(<em>\\\\1</em>)"
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_replace_1.png" alt="This image of a table was generated from the first code example in the `text_replace()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

4-1
}

\section{Function Introduced}{

\code{v0.9.0} (Mar 31, 2023)
}

\seealso{
Other text transforming functions: 
\code{\link{text_case_match}()},
\code{\link{text_case_when}()},
\code{\link{text_transform}()}
}
\concept{text transforming functions}
