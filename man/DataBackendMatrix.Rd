% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DataBackendMatrix.R
\name{DataBackendMatrix}
\alias{DataBackendMatrix}
\title{DataBackend for Matrix}
\description{
\link{DataBackend} for \CRANpkg{Matrix}.
Data is split into a (numerical) sparse part and an optional dense part.
These parts are automatically merged to a sparse format during \verb{$data()}.
Note that merging both parts potentially comes with a data loss, as all
dense columns are converted to numeric columns.
}
\examples{
requireNamespace("Matrix")
data = Matrix::Matrix(sample(0:1, 20, replace = TRUE), ncol = 2)
colnames(data) = c("x1", "x2")
dense = data.frame(
  ..row_id = 1:10,
  num = runif(10),
  fact = factor(sample(c("a", "b"), 10, replace = TRUE), levels = c("a", "b"))
)

b = as_data_backend(data, dense = dense, primary_key = "..row_id")
b$head()
b$data(1:3, b$colnames, data_format = "Matrix")
b$data(1:3, b$colnames, data_format = "data.table")
}
\seealso{
\itemize{
\item Chapter in the \href{https://mlr3book.mlr-org.com/}{mlr3book}:
\url{https://mlr3book.mlr-org.com/technical.html#backends}
\item Package \CRANpkg{mlr3db} to interface out-of-memory data,
e.g. SQL servers or \CRANpkg{duckdb}.
}

Other DataBackend: 
\code{\link{DataBackendDataTable}},
\code{\link{DataBackend}},
\code{\link{as_data_backend.Matrix}()}
}
\concept{DataBackend}
\section{Super class}{
\code{\link[mlr3:DataBackend]{mlr3::DataBackend}} -> \code{DataBackendMatrix}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{rownames}}{(\code{integer()})\cr
Returns vector of all distinct row identifiers, i.e. the contents of the primary key column.}

\item{\code{colnames}}{(\code{character()})\cr
Returns vector of all column names, including the primary key column.}

\item{\code{nrow}}{(\code{integer(1)})\cr
Number of rows (observations).}

\item{\code{ncol}}{(\code{integer(1)})\cr
Number of columns (variables), including the primary key column.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-DataBackendMatrix-new}{\code{DataBackendMatrix$new()}}
\item \href{#method-DataBackendMatrix-data}{\code{DataBackendMatrix$data()}}
\item \href{#method-DataBackendMatrix-head}{\code{DataBackendMatrix$head()}}
\item \href{#method-DataBackendMatrix-distinct}{\code{DataBackendMatrix$distinct()}}
\item \href{#method-DataBackendMatrix-missings}{\code{DataBackendMatrix$missings()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="DataBackend" data-id="format"><a href='../../mlr3/html/DataBackend.html#method-DataBackend-format'><code>mlr3::DataBackend$format()</code></a></span></li>
<li><span class="pkg-link" data-pkg="mlr3" data-topic="DataBackend" data-id="print"><a href='../../mlr3/html/DataBackend.html#method-DataBackend-print'><code>mlr3::DataBackend$print()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-DataBackendMatrix-new"></a>}}
\if{latex}{\out{\hypertarget{method-DataBackendMatrix-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DataBackendMatrix$new(data, dense, primary_key = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{data}}{\code{\link[Matrix:Matrix]{Matrix::Matrix()}}\cr
The input \code{\link[Matrix:Matrix]{Matrix::Matrix()}}.}

\item{\code{dense}}{\code{\link[=data.frame]{data.frame()}}.
Dense data, converted to \code{\link[data.table:data.table]{data.table::data.table()}}.}

\item{\code{primary_key}}{(\code{character(1)} | \code{integer()})\cr
Name of the primary key column, or integer vector of row ids.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-DataBackendMatrix-data"></a>}}
\if{latex}{\out{\hypertarget{method-DataBackendMatrix-data}{}}}
\subsection{Method \code{data()}}{
Returns a slice of the data in the specified format.
Currently, the only supported formats are \code{"data.table"} and \code{"Matrix"}.
The rows must be addressed as vector of primary key values, columns must be referred to via column names.
Queries for rows with no matching row id and queries for columns with no matching column name are silently ignored.
Rows are guaranteed to be returned in the same order as \code{rows}, columns may be returned in an arbitrary order.
Duplicated row ids result in duplicated rows, duplicated column names lead to an exception.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DataBackendMatrix$data(rows, cols, data_format = "data.table")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{rows}}{\code{integer()}\cr
Row indices.}

\item{\code{cols}}{\code{character()}\cr
Column names.}

\item{\code{data_format}}{(\code{character(1)})\cr
Desired data format, e.g. \code{"data.table"} or \code{"Matrix"}.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-DataBackendMatrix-head"></a>}}
\if{latex}{\out{\hypertarget{method-DataBackendMatrix-head}{}}}
\subsection{Method \code{head()}}{
Retrieve the first \code{n} rows.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DataBackendMatrix$head(n = 6L)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{n}}{(\code{integer(1)})\cr
Number of rows.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
\code{\link[data.table:data.table]{data.table::data.table()}} of the first \code{n} rows.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-DataBackendMatrix-distinct"></a>}}
\if{latex}{\out{\hypertarget{method-DataBackendMatrix-distinct}{}}}
\subsection{Method \code{distinct()}}{
Returns a named list of vectors of distinct values for each column
specified. If \code{na_rm} is \code{TRUE}, missing values are removed from the
returned vectors of distinct values. Non-existing rows and columns are
silently ignored.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DataBackendMatrix$distinct(rows, cols, na_rm = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{rows}}{\code{integer()}\cr
Row indices.}

\item{\code{cols}}{\code{character()}\cr
Column names.}

\item{\code{na_rm}}{\code{logical(1)}\cr
Whether to remove NAs or not.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Named \code{list()} of distinct values.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-DataBackendMatrix-missings"></a>}}
\if{latex}{\out{\hypertarget{method-DataBackendMatrix-missings}{}}}
\subsection{Method \code{missings()}}{
Returns the number of missing values per column in the specified slice
of data. Non-existing rows and columns are silently ignored.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{DataBackendMatrix$missings(rows, cols)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{rows}}{\code{integer()}\cr
Row indices.}

\item{\code{cols}}{\code{character()}\cr
Column names.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Total of missing values per column (named \code{numeric()}).
}
}
}
