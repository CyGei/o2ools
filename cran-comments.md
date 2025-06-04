## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
* There is one NOTE about a possibly misspelled word "summarization" in DESCRIPTION. This is the standard American English spelling (changed from British "summarisation" to follow CRAN conventions).


## Resubmission

This is a resubmission. In this version I have:

* Added single quotes around software names (e.g. 'outbreaker2') in the DESCRIPTION.
* Removed the 'Remotes' field from DESCRIPTION.
* Removed the GitHub-only dependency 'linktree' from Suggests.
* Excluded the vignette `extended_analyses.Rmd` (which uses 'linktree') from the package build via `.Rbuildignore`.

Note: The Title field in DESCRIPTION uses 'outbreaker2' with a lowercase 'o' because this is the actual package name.
Thanks
