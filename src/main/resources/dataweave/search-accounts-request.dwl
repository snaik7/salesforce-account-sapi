%dw 2.0
import * from dw::core::Strings
var query  = p('salesforce.searchQuery')
var idQuery = if(!isBlank(payload.id)) " Id = '" ++ payload.id ++ "' AND "else ""
var nameQuery = if(!isBlank(payload.firstName) or !isBlank(payload.lastName))
                    " Name LIKE '%"  ++ ((payload.firstName default "") ++ " " ++ (payload.lastName default                     "")) ++ "%' AND "
                else ""
var companyQuery = if (!isBlank(payload.companyName))
                        " Name LIKE '%" ++ payload.companyName ++ "%' AND "
                else ""
var emailQuery = if (!isBlank(payload.email))
                        " Email__c = '" ++ payload.email ++ "' AND "
                else ""
output application/json
---
substringBeforeLast(query ++ idQuery ++ nameQuery ++ companyQuery ++ emailQuery, "AND")