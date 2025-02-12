% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_data.R
\name{fmt_time}
\alias{fmt_time}
\title{Format values as times}
\usage{
fmt_time(
  data,
  columns = everything(),
  rows = everything(),
  time_style = "iso",
  pattern = "{x}",
  locale = NULL
)
}
\arguments{
\item{data}{A table object that is created using the \code{\link[=gt]{gt()}} function.}

\item{columns}{The columns to format. Can either be a series of column names
provided in \code{\link[=c]{c()}}, a vector of column indices, or a helper function
focused on selections. The select helper functions are: \code{\link[=starts_with]{starts_with()}},
\code{\link[=ends_with]{ends_with()}}, \code{\link[=contains]{contains()}}, \code{\link[=matches]{matches()}}, \code{\link[=one_of]{one_of()}}, \code{\link[=num_range]{num_range()}}, and
\code{\link[=everything]{everything()}}.}

\item{rows}{Optional rows to format. Providing \code{\link[=everything]{everything()}} (the
default) results in all rows in \code{columns} being formatted. Alternatively,
we can supply a vector of row captions within \code{\link[=c]{c()}}, a vector of row
indices, or a helper function focused on selections. The select helper
functions are: \code{\link[=starts_with]{starts_with()}}, \code{\link[=ends_with]{ends_with()}}, \code{\link[=contains]{contains()}}, \code{\link[=matches]{matches()}},
\code{\link[=one_of]{one_of()}}, \code{\link[=num_range]{num_range()}}, and \code{\link[=everything]{everything()}}. We can also use expressions
to filter down to the rows we need (e.g.,
\verb{[colname_1] > 100 & [colname_2] < 50}).}

\item{time_style}{The time style to use. By default this is \code{"iso"} which
corresponds to how times are formatted within ISO 8601 datetime values. The
other time styles can be viewed using \code{\link[=info_time_style]{info_time_style()}}.}

\item{pattern}{A formatting pattern that allows for decoration of the
formatted value. The value itself is represented by \code{{x}} and all other
characters are taken to be string literals.}

\item{locale}{An optional locale identifier that can be used for formatting
the value according the locale's rules. Examples include \code{"en"} for English
(United States) and \code{"fr"} for French (France). The use of a locale ID will
override any locale-specific values provided. We can use the
\code{\link[=info_locales]{info_locales()}} function as a useful reference for all of the locales that
are supported.}
}
\value{
An object of class \code{gt_tbl}.
}
\description{
Format input values to time values using one of 25 preset time styles. Input
can be in the form of \code{POSIXt} (i.e., datetimes), \code{character} (must be in the
ISO 8601 forms of \code{HH:MM:SS} or \verb{YYYY-MM-DD HH:MM:SS}), or \code{Date} (which
always results in the formatting of \code{00:00:00}).
}
\section{Compatibility of formatting function with data values}{


The \code{fmt_time()} formatting function is compatible with body cells that are
of the \code{"Date"}, \code{"POSIXt"} or \code{"character"} types. Any other types of body
cells are ignored during formatting. This is to say that cells of
incompatible data types may be targeted, but there will be no attempt to
format them.
}

\section{Targeting cells with \code{columns} and \code{rows}}{


Targeting of values is done through \code{columns} and additionally by \code{rows} (if
nothing is provided for \code{rows} then entire columns are selected). The
\code{columns} argument allows us to target a subset of cells contained in the
resolved columns. We say resolved because aside from declaring column names
in \code{c()} (with bare column names or names in quotes) we can use
\strong{tidyselect}-style expressions. This can be as basic as supplying a select
helper like \code{starts_with()}, or, providing a more complex incantation like

\code{where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)}

which targets numeric columns that have a maximum value greater than
1,000,000 (excluding any \code{NA}s from consideration).

By default all columns and rows are selected (with the \code{everything()}
defaults). Cell values that are incompatible with a given formatting function
will be skipped over, like \code{character} values and numeric \verb{fmt_*()}
functions. So it's safe to select all columns with a particular formatting
function (only those values that can be formatted will be formatted), but,
you may not want that. One strategy is to format the bulk of cell values with
one formatting function and then constrain the columns for later passes with
other types of formatting (the last formatting done to a cell is what you get
in the final output).

Once the columns are targeted, we may also target the \code{rows} within those
columns. This can be done in a variety of ways. If a stub is present, then we
potentially have row identifiers. Those can be used much like column names in
the \code{columns}-targeting scenario. We can use simpler \strong{tidyselect}-style
expressions (the select helpers should work well here) and we can use quoted
row identifiers in \code{c()}. It's also possible to use row indices (e.g.,
\code{c(3, 5, 6)}) though these index values must correspond to the row numbers of
the input data (the indices won't necessarily match those of rearranged rows
if row groups are present). One more type of expression is possible, an
expression that takes column values (can involve any of the available columns
in the table) and returns a logical vector. This is nice if you want to base
formatting on values in the column or another column, or, you'd like to use a
more complex predicate expression.
}

\section{Formatting with the \code{time_style} argument}{


We need to supply a preset time style to the \code{time_style} argument. There are
many time styles and all of them can handle localization to any supported
locale. Many of the time styles are termed flexible time formats and this
means that their output will adapt to any \code{locale} provided. That feature
makes the flexible time formats a better option for locales other than \code{"en"}
(the default locale).

The following table provides a listing of all time styles and their output
values (corresponding to an input time of \code{14:35:00}). It is noted which of
these represent 12- or 24-hour time.\tabular{llll}{
    \tab Time Style \tab Output \tab Notes \cr
   1 \tab \code{"iso"} \tab \code{"14:35:00"} \tab ISO 8601, 24h \cr
   2 \tab \code{"iso-short"} \tab \code{"14:35"} \tab ISO 8601, 24h \cr
   3 \tab \code{"h_m_s_p"} \tab \code{"2:35:00 PM"} \tab 12h \cr
   4 \tab \code{"h_m_p"} \tab \code{"2:35 PM"} \tab 12h \cr
   5 \tab \code{"h_p"} \tab \code{"2 PM"} \tab 12h \cr
   6 \tab \code{"Hms"} \tab \code{"14:35:00"} \tab flexible, 24h \cr
   7 \tab \code{"Hm"} \tab \code{"14:35"} \tab flexible, 24h \cr
   8 \tab \code{"H"} \tab \code{"14"} \tab flexible, 24h \cr
   9 \tab \code{"EHm"} \tab \code{"Thu 14:35"} \tab flexible, 24h \cr
   10 \tab \code{"EHms"} \tab \code{"Thu 14:35:00"} \tab flexible, 24h \cr
   11 \tab \code{"Hmsv"} \tab \code{"14:35:00 GMT+00:00"} \tab flexible, 24h \cr
   12 \tab \code{"Hmv"} \tab \code{"14:35 GMT+00:00"} \tab flexible, 24h \cr
   13 \tab \code{"hms"} \tab \code{"2:35:00 PM"} \tab flexible, 12h \cr
   14 \tab \code{"hm"} \tab \code{"2:35 PM"} \tab flexible, 12h \cr
   15 \tab \code{"h"} \tab \code{"2 PM"} \tab flexible, 12h \cr
   16 \tab \code{"Ehm"} \tab \code{"Thu 2:35 PM"} \tab flexible, 12h \cr
   17 \tab \code{"Ehms"} \tab \code{"Thu 2:35:00 PM"} \tab flexible, 12h \cr
   18 \tab \code{"EBhms"} \tab \code{"Thu 2:35:00 in the afternoon"} \tab flexible, 12h \cr
   19 \tab \code{"Bhms"} \tab \code{"2:35:00 in the afternoon"} \tab flexible, 12h \cr
   20 \tab \code{"EBhm"} \tab \code{"Thu 2:35 in the afternoon"} \tab flexible, 12h \cr
   21 \tab \code{"Bhm"} \tab \code{"2:35 in the afternoon"} \tab flexible, 12h \cr
   22 \tab \code{"Bh"} \tab \code{"2 in the afternoon"} \tab flexible, 12h \cr
   23 \tab \code{"hmsv"} \tab \code{"2:35:00 PM GMT+00:00"} \tab flexible, 12h \cr
   24 \tab \code{"hmv"} \tab \code{"2:35 PM GMT+00:00"} \tab flexible, 12h \cr
   25 \tab \code{"ms"} \tab \code{"35:00"} \tab flexible \cr
}


We can use the \code{\link[=info_time_style]{info_time_style()}} function within the console to view a
similar table of time styles with example output.
}

\section{Adapting output to a specific \code{locale}}{


This formatting function can adapt outputs according to a provided \code{locale}
value. Examples include \code{"en"} for English (United States) and \code{"fr"} for
French (France). Note that a \code{locale} value provided here will override any
global locale setting performed in \code{\link[=gt]{gt()}}'s own \code{locale} argument (it is
settable there as a value received by all other functions that have a
\code{locale} argument). As a useful reference on which locales are supported, we
can use the \code{\link[=info_locales]{info_locales()}} function to view an info table.
}

\section{Examples}{


Use \code{\link{exibble}} to create a \strong{gt} table. Keep only the \code{date} and \code{time}
columns. Format the \code{time} column to have times formatted as \code{hms_p} (time
style \code{3}).

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble |>
  dplyr::select(date, time) |>
  gt() |>
  fmt_time(
    columns = time,
    time_style = "h_m_s_p"
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_time_1.png" alt="This image of a table was generated from the first code example in the `fmt_time()` help file." style="width:100\%;">
}}

Use \code{\link{exibble}} to create a \strong{gt} table. Keep only the \code{date} and \code{time}
columns. Format the \code{time} column to have mixed time formats (times after
16:00 will be different than the others because of the expressions used
in the \code{rows} argument).

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble |>
  dplyr::select(date, time) |>
  gt() |>
  fmt_time(
    columns = time,
    rows = time > "16:00",
    time_style = "h_m_s_p"
  ) |>
  fmt_time(
    columns = time,
    rows = time <= "16:00",
    time_style = "h_m_p"
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_time_2.png" alt="This image of a table was generated from the second code example in the `fmt_time()` help file." style="width:100\%;">
}}

Use \code{\link{exibble}} to create another \strong{gt} table, this time only with the
\code{time} column. Format the \code{time} column to use the \code{"EBhms"} time style
(which is one of the 'flexible' styles). Also, set the locale to \code{"sv"} to
get the dates in Swedish.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{exibble |>
  dplyr::select(time) |>
  gt() |>
  fmt_time(
    columns = time,
    time_style = "EBhms",
    locale = "sv"
  )
}\if{html}{\out{</div>}}

\if{html}{\out{
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_time_3.png" alt="This image of a table was generated from the third code example in the `fmt_time()` help file." style="width:100\%;">
}}
}

\section{Function ID}{

3-14
}

\section{Function Introduced}{

\code{v0.2.0.5} (March 31, 2020)
}

\seealso{
The vector-formatting version of this function: \code{\link[=vec_fmt_time]{vec_fmt_time()}}.

Other data formatting functions: 
\code{\link{data_color}()},
\code{\link{fmt_auto}()},
\code{\link{fmt_bins}()},
\code{\link{fmt_bytes}()},
\code{\link{fmt_currency}()},
\code{\link{fmt_datetime}()},
\code{\link{fmt_date}()},
\code{\link{fmt_duration}()},
\code{\link{fmt_engineering}()},
\code{\link{fmt_flag}()},
\code{\link{fmt_fraction}()},
\code{\link{fmt_image}()},
\code{\link{fmt_index}()},
\code{\link{fmt_integer}()},
\code{\link{fmt_markdown}()},
\code{\link{fmt_number}()},
\code{\link{fmt_partsper}()},
\code{\link{fmt_passthrough}()},
\code{\link{fmt_percent}()},
\code{\link{fmt_roman}()},
\code{\link{fmt_scientific}()},
\code{\link{fmt_spelled_num}()},
\code{\link{fmt_url}()},
\code{\link{fmt}()},
\code{\link{sub_large_vals}()},
\code{\link{sub_missing}()},
\code{\link{sub_small_vals}()},
\code{\link{sub_values}()},
\code{\link{sub_zero}()}
}
\concept{data formatting functions}
