# Data and scripts from "Referential precedents in spoken language comprehension"
## Edmundo Kronmüller and Dale J. Barr

This repository contains the scripts and raw data corresponding to the following manuscript:

> Kronmüller, E., & Barr, D. J. (under review).  Referential precedents in spoken language comprehension: A review and meta-analysis.  Manuscript under review.  Draft version, December 31, 2014.  Retrieved from [https://github.com/dalejbarr/precmeta](../master/docs/precmeta_dist.pdf?raw=true).

The current version of the manuscript is [precmeta_dist.pdf](../master/docs/precmeta_dist.pdf?raw=true), and the LaTeX source files are in the [docs](../master/docs) subdirectory.

We reanalyzed data from ten visual-world eyetracking experiments reported in six published articles:

- Barr and Keysar (2002), Experiment 2
- Metzing and Brennan (2003), Experiment 1
- Kronmüller and Barr (2007), Experiment 1
- Kronmüller and Barr (2007), Experiment 2 (No-Load Condition)
- Kronmüller and Barr (2007), Experiment 2 (Load Condition)
- Barr (2008), Experiment 3 
- Brown-Schmidt (2009), Experiment 1a
- Brown-Schmidt (2009), Experiment 1b
- Brown-Schmidt (2009), Experiment 2
- Horton and Slaten (2012), Experiment 1

The raw data appear in the subdirectories organized by author names.  Data will be added to the public repository as permissions are obtained.

The analysis scripts were written in R, and are embedded in the file [PrecMeta.org](../master/PrecMeta.org), which is an [emacs org-mode](http://orgmode.org) light markup document.  This document can be opened as plain text with any text editor, but is best viewed either through github or in the [emacs](http://www.gnu.org/software/emacs) text editor, which provide syntax highlighting.  The R scripts make heavy use of the [dplyr](https://github.com/hadley/dplyr) and [magrittr](https://github.com/smbache/magrittr) add-on packages for R.

---
## References

Barr, D. J. (2008). [Pragmatic expectations and linguistic evidence: Listeners anticipate but do not integrate common ground](http://dx.doi.org/10.1016/j.cognition.2008.07.005). *Cognition, 109*, 10-40.

Barr, D. J., & Keysar, B. (2002). [Anchoring comprehension in linguistic precedents](http://dx.doi.org/10.1006/jmla.2001.2815).  *Journal of Memory and Language, 46*, 391-418.

Brown-Schmidt, S. (2009). [Partner-specific interpretation of maintained referential precedents during interactive dialog](http://dx.doi.org/10.1016/j.jml.2009.04.003). *Journal of Memory and Language, 61*, 171-190.

Horton, W. S., & Slaten, D. G. (2012). [Anticipating who will say what: The influence of speaker-specific memory associations on reference resolution](http://dx.doi.org/10.3758/s13421-011-0135-7). *Memory & Cognition, 40*, 113–126.

Kronmüller, E., & Barr, D. J. (2007). [Perspective-free pragmatics: Broken precedents and the recovery-from-preemption hypothesis](http://dx.doi.org/10.1016/j.jml.2006.05.002). *Journal of Memory and Language, 56*, 436-455.

Metzing, C., & Brennan, S. E. (2003). [When conceptual pacts are broken: Partner-specific effects on the comprehension of referring expressions][http://dx.doi.org/10.1016/S0749-596X(03)00028-7]. *Journal of Memory and Language, 49*, 201-213.
