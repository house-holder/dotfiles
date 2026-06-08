#!/bin/bash
zulu=$(date -u '+%H%M')
hnd=$(TZ='Asia/Tokyo' date '+%H:%M')
lax=$(TZ='America/Los_Angeles' date '+%H:%M')
jfk=$(TZ='America/New_York' date '+%H:%M')
hnl=$(TZ='Pacific/Honolulu' date '+%H:%M')

tooltip="${hnd} (HND)\\n"
tooltip+="${lax} (LAX)\\n"
tooltip+="${jfk} (JFK)\\n"
tooltip+="${hnl} (HNL)"

# remember: json
echo "{\"text\":\" ${zulu}z\", \"tooltip\":\"${tooltip}\"}"
