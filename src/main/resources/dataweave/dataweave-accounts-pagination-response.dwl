%dw 2.0
var originalMarker = vars.offset
var limit = vars.limit
var total = sizeOf(payload) - 1
var validMarker = if ((originalMarker * limit) <= total) true else false
var marker = if (validMarker) originalMarker else 0
var startIndex = marker * limit
var endIndex = if ((startIndex + limit - 1) > total) total  else (startIndex + limit - 1)
var first = 0
var last = if (endIndex == total) "" else floor(total / limit)
var prev = if ((marker - 1) < 0) 0 else marker - 1
var next = if (endIndex == total) "" else marker + 1
output application/json skipNullOn="everywhere"
---
{
  "first": first,
  "last": last,
  "prev": prev ,
  "next": next,
  "total": sizeOf(payload),
  "accounts": payload[startIndex to endIndex] 
} 