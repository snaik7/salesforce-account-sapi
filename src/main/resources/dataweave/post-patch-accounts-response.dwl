%dw 2.0
output application/json skipNullOn="everywhere"
---
vars.originalPayload map ((account, index) -> { 
    "id" : payload.items[index].id, 
    "success": payload.items[index].successful, 
    "exception": payload.items[index].exception.message
} ++ account)