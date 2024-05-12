%dw 2.0
import * from dw::core::Strings
var query  = p('salesforce.searchQuery')
var idQuery = if(!isBlank(payload.id)) " Id = '" ++ trim(payload.id default "") ++ "' AND "else ""
var nameQuery = if(!isBlank(payload.firstName) or !isBlank(payload.lastName))
                    " Name LIKE '%"  ++ ((trim(payload.firstName default "")) ++ " " ++ (trim(payload.lastName default ""))) ++ "%' AND "
                else ""
var companyQuery = if (!isBlank(payload.companyName))
                        " Name LIKE '%" ++ trim(payload.companyName default "") ++ "%' AND "
                else ""
var emailQuery = if (!isBlank(payload.email))
                        " Email__c = '" ++ trim(payload.email default "") ++ "' AND "
                else ""
output application/json
---
substringBeforeLast(query ++ idQuery ++ nameQuery ++ companyQuery ++ emailQuery, "AND") ++ " LIMIT " ++ p('salesforce.recordLimit')