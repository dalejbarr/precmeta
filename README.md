# Data and scripts from "Referential precedents in spoken language comprehension"
## Edmundo Kronmüller and Dale J. Barr

This repository contains the scripts and raw data corresponding to the following manuscript:

> Kronmüller, E., & Barr, D. J. (under review).  Referential precedents in spoken language comprehension: A review and meta-analysis.  Manuscript under review.  Draft version, December 31, 2014.  Retrieved from [https://github.com/dalejbarr/precmeta](../master/docs/precmeta_dist.pdf?raw=true).

The current version of the manuscript is [precmeta_dist.pdf](../master/docs/precmeta_dist.pdf?raw=true), and the LaTeX source files are in the [docs](../master/docs) subdirectory.

We reanalyzed data from the 10 experiments in the table below.  The raw data appear in the subdirectories organized by the names of the authors.  Data will be added as permissions are obtained.

|Source|Experiment| 
|--|:-:|
|Barr & Keysar (2002) | 2 |
|Metzing & Brennan (2003)|1 |
|Kronmüller & Barr (2007) | 1 |
|Kronmüller & Barr (2007) | 2 (No-Load Condition) |
|Kronmüller & Barr (2007) | 2 (Load Condition) |
|Barr (2008) | 3 |
|Brown-Schmidt (2009) | 1a |
|Brown-Schmidt (2009) | 1b |
|Brown-Schmidt (2009) | 2 |
|Horton & Slaten (2012) | 1 |

The analysis scripts are in [PrecMeta.org](../master/PrecMeta.org), which has R scripts embedded in an [emacs org-mode](http://orgmode.org) document.  The document itself is written in a light markup language and can be opened as plain text with any text editor.  It is best viewed either through github or in the [emacs](http://www.gnu.org/software/emacs) text editor, which provide syntax highlighting.  The R scripts make heavy use of the [dplyr](https://github.com/hadley/dplyr) and [magrittr](https://github.com/smbache/magrittr) add-on packages for R.
