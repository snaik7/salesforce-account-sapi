%dw 2.0
var errorFields = []
var bulklimit = (p('bulklimit') default 10) as Number
output application/json
---
if (sizeOf(payload default []) == 0)   
    [p('errorMessage.emptyPayload')]
else if (sizeOf(payload default []) > bulklimit)   
    [p('errorMessage.largePayload')]
else errorFields
