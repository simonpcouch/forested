# forested 0.2.0

* The first version of the package just had data from Washington, called
  `forested`. The second release of the package also includes data from Georgia.
  The `forested` data is the same as it was, and now is aliased as `forested_wa`.
  The data from Georgia is called `forested_ga`. The Georgia data has the same
  structure, except is missing the `northness` variable due to issues with the
  source raster. `forested_ga` also includes a new variable `county` 
  (#18, h.t. `@graysonwhite`).

* `forested` and its alias `forested_wa` gained a new variable, `county` (#14).

# forested 0.1.0

* Initial CRAN submission.
