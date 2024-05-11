%dw 2.0
import * from dw::core::Strings
output application/json
---
{

	success: false,
    apiName: Mule::p('api.name'),
    version: Mule::p('api.version'),
    correlationId: correlationId,
    timestamp: now(),
    error: {
      errors: [{
      	domain: Mule::p('api.domain'),
      	message: substring(write(error.errorMessage default error.description, "application/json"), 0, 200) remove "\"" remove "\n",
      	reason: substring(write(error.description default "", "application/json"), 0, 200) remove "\"" remove "\n"
      }],
      code: 500,
      message: "Internal Server Error"
      
    }
}