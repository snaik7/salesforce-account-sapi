%dw 2.0
var fields = p('salesforce.deleteDisplayFields')
output application/json
---
payload.items.payload map $[?(fields contains $$ as String)]