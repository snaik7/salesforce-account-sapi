%dw 2.0
var errorFields = []
output application/json
---
if (sizeOf(payload default []) == 0)   
    [p('errorMessage.emptyPayload')]
else if ( ((!isBlank(payload.companyName)) and (!isBlank(payload.firstName))) or ((!isBlank(payload.companyName)) and (!isBlank(payload.lastName))))  
	[p('errorMessage.individualBusinessInvalidSearch')]
else errorFields
