% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_vec.R
\name{vec_fmt_markdown}
\alias{vec_fmt_markdown}
\title{Format a vector containing Markdown text}
\usage{
vec_fmt_markdown(
  x,
  md_engine = c("markdown", "commonmark"),
  output = c("auto", "plain", "html", "latex", "rtf", "word")
)
}
\arguments{
\item{x}{A numeric vector.}

\item{md_engine}{The engine preference for Markdown rendering. By default,
this is set to \code{"markdown"} where \strong{gt} will use the \strong{markdown} package
for Markdown conversion to HTML and LaTeX. The other option is
\code{"commonmark"} and with that the \strong{commonmark} package will be used.}

\item{output}{The output style of the resulting character vector. This can
either be \code{"auto"} (the default), \code{"plain"}, \code{"html"}, \code{"latex"}, \code{"rtf"},
or \code{"word"}. In \strong{knitr} rendering (i.e., Quarto or R Markdown), the
\code{"auto"} option will choose the correct \code{output} value}
}
\value{
A character vector.
}
\description{
Any Markdown-formatted text in the input vector will be transformed to the
appropriate output type.
}
\section{Examples}{


Create a vector of Markdown-based text snippets.

\if{html}{\out{<div class="sourceCode r">}}\preformatted{text_vec <-
  c(
    "This **is** *Markdown*.",
    "Info on Markdown syntax can be found
[here](https://daringfireball.net/projects/markdown/).",
    "The **gt** package has these datasets:
- `countrypops`
- `sza`
- `gtcars`
- `sp500`
- `pizzaplace`
- `exibble`"
  )
}\if{html}{\out{</div>}}

With \code{vec_fmt_markdown()} we can easily convert these to different output types,
like HTML

\if{html}{\out{<div class="sourceCode r">}}\preformatted{vec_fmt_markdown(text_vec, output = "html")
#> [1] "<p>This <strong>is</strong> <em>Markdown</em>.</p>"                                                                                                                                                                                                               
#> [2] "<p>Info on Markdown syntax can be found\\n<a href=\\"https://daringfireball.net/projects/markdown/\\">here</a>.</p>"                                                                                                                                                 
#> [3] "<p>The <strong>gt</strong> package has these datasets:</p>\\n<ul>\\n<li><code>countrypops</code></li>\\n<li><code>sza</code></li>\\n<li><code>gtcars</code></li>\\n<li><code>sp500</code></li>\\n<li><code>pizzaplace</code></li>\\n<li><code>exibble</code></li>\\n</ul>"
}\if{html}{\out{</div>}}

or LaTeX

\if{html}{\out{<div class="sourceCode r">}}\preformatted{vec_fmt_markdown(text_vec, output = "latex")
#> [1] "This \\\\textbf\{is\} \\\\emph\{Markdown\}."                                                                                                                                                                                                                     
#> [2] "Info on Markdown syntax can be found\\n\\\\href\{https://daringfireball.net/projects/markdown/\}\{here\}."                                                                                                                                                      
#> [3] "The \\\\textbf\{gt\} package has these datasets:\\n\\n\\\\begin\{itemize\}\\n\\\\item \\\\texttt\{countrypops\}\\n\\n\\\\item \\\\texttt\{sza\}\\n\\n\\\\item \\\\texttt\{gtcars\}\\n\\n\\\\item \\\\texttt\{sp500\}\\n\\n\\\\item \\\\texttt\{pizzaplace\}\\n\\n\\\\item \\\\texttt\{exibble\}\\n\\n\\\\end\{itemize\}"
}\if{html}{\out{</div>}}
}

\section{Function ID}{

15-17
}

\section{Function Introduced}{

\code{v0.7.0} (Aug 25, 2022)
}

\seealso{
The variant function intended for formatting \strong{gt} table data:
\code{\link[=fmt_markdown]{fmt_markdown()}}.

Other vector formatting functions: 
\code{\link{vec_fmt_bytes}()},
\code{\link{vec_fmt_currency}()},
\code{\link{vec_fmt_datetime}()},
\code{\link{vec_fmt_date}()},
\code{\link{vec_fmt_duration}()},
\code{\link{vec_fmt_engineering}()},
\code{\link{vec_fmt_fraction}()},
\code{\link{vec_fmt_index}()},
\code{\link{vec_fmt_integer}()},
\code{\link{vec_fmt_number}()},
\code{\link{vec_fmt_partsper}()},
\code{\link{vec_fmt_percent}()},
\code{\link{vec_fmt_roman}()},
\code{\link{vec_fmt_scientific}()},
\code{\link{vec_fmt_spelled_num}()},
\code{\link{vec_fmt_time}()}
}
\concept{vector formatting functions}
