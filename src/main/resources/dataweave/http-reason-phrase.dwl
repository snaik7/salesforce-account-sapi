%dw 2.0
import * from dw::core::Strings
output text/plain
---
substring(write(error.description default "", "application/json"), 0, 200) remove "\"" remove "\n"