%dw 2.0
var errorFields = []
output application/json
---
if (sizeOf(payload default []) == 0)   
    [p('errorMessage.emptyPayload')]
else errorFields
