%dw 2.0
fun getAccountType(account) = if (!isBlank(account.companyName)) "business" else if (!isBlank(account.firstName) or !isBlank(account.lastName))  "individual" else "unknown"
output application/json
---
(payload map ((account, accountIndex) -> {
	Id: account.id,
	Name: if (getAccountType(account) == "individual") ((account.firstName default "") ++ " " ++ (account.lastName  default "")) else if (getAccountType(account) == "business") account.companyName  else "unknown",
	Type: getAccountType(account),
	Email__c: account.email,
	BillingStreet: account.address[?($.addressType=="billing")].addressLine1[0],
    BillingCity: account.address[?($.addressType=="billing")].city[0],
	BillingState: account.address[?($.addressType=="billing")].state[0],
	BillingPostalCode: account.address[?($.addressType=="billing")].postalCode[0],
	BillingCountry: account.address[?($.addressType=="billing")].country[0],
	ShippingStreet: account.address[?($.addressType=="shipping")].addressLine1[0],
	ShippingCity: account.address[?($.addressType=="shipping")].city[0],
	ShippingState: account.address[?($.addressType=="shipping")].state[0],
	ShippingPostalCode: account.address[?($.addressType=="shipping")].postalCode[0],
	ShippingCountry: account.address[?($.addressType=="shipping")].country[0]
})) map $[?(!(isBlank($)))]