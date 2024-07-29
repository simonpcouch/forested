## R CMD check results

0 errors | 0 warnings | 2 notes

* First note: this is a new release.
* Second note: "Possibly misspelled words in DESCRIPTION: FIA (16:7, 16:29)."
  The full text of this abbreviation is introduced in the preceding line and
  the spelling is intended.

This is a re-submission following the review:

> Please always write package names, software names and API (application programming interface) names in single quotes in title and description.
> e.g: --> 'forested'
> Please note that package names are case sensitive.
> 
> Just a small note: You pacakge right now only contains the data.frame() mentioned in your description. Do you intent on adding functions/models as well? (e.g.: the one you talk about in your DESCRIPTION: "...from which we can develop a model based on...").
> If so, please note that CRAN is meant as a repository for fully developed packages, and therefore submit your next version once the pacakge is complete.
> If not, only fix the single quote issue above and resubmit.

I've single-quoted the package name where it's mentioned in the Description--thank you!

Regarding the note on whether the package is complete: the package is indeed only a data package and will not include functions or models. The dataset supplied with the package is intended to be used in modeling applications, but the package itself will not include any additional tooling to do so. I've adjusted the language in the Description in hopes to clarify that point.

## Notes

References for sources of specific columns in the supplied data are provided 
in the data's documentation; the data frame itself, broadly, does not have a
specific reference.
