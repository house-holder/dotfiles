#!/bin/bash
# wraps pilot-bar output; shrinks the font when the text gets long so the
# center clock group isn't pushed off-center.

FIT=55
MIN_PCT=80

pilot-bar-daemon && pilot-bar | jq -c --argjson fit "$FIT" --argjson min "$MIN_PCT" '
  (.text | length) as $n
  | (.text | gsub("&";"&amp;") | gsub("<";"&lt;") | gsub(">";"&gt;")) as $t
  | if $n > $fit then
      ([100 * $fit / $n | floor, $min] | max) as $pct
      | .text = "<span size=\"\($pct)%\">\($t)</span>"
    else .text = $t end'
