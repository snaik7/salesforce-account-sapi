%dw 2.0
import * from dw::core::Strings
var fields= p('salesforce.getDisplayFields')
output application/json skipNullOn="everywhere"
---
(payload map $[?(fields contains $$ as String)]) map ($ mapObject ((value, key, index) ->  (camelize(key)): value )) 