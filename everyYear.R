everyYear =
function(dates, threshold = 380)
{
   all(diff(sort(dates)) < threshold)
}

consecutiveYears = 
function(dates, threshold = 380)
{
  diff(sort(dates)) < threshold
}

if(FALSE) {
  x = c(rep(T, 4), rep(F, 3), rep(TRUE, 10), F, F, F, rep(TRUE, 7), F)
  r = rle(x)
  idx = r$values == TRUE & r$lengths > 6
  starts = cumsum(r$lengths)[which(idx)-1] + 1
  mapply(function(s, len)
             x[s:(s + len)],  starts, r$lengths[idx] - 1)
}

if(FALSE) {
  grps = split(gwl.sub$MEASUREMENT_DT, gwl.sub$SITE_CODE)
  ans = sapply(grps, everyYear)
# or 
  ans = tapply(gwl.sub$MEASUREMENT_DT, gwl.sub$SITE_CODE, everyYear)
}