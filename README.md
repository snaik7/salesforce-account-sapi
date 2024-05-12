# salesforce-account-sapi
Salesforce Account System API 

The API is design for assignment of Application Integration Engineer.

# Overview


The README file offers an insight into the application's objectives and functionalities, providing guidance on installation, utilization of current features, and potential for expansion. Furthermore, it includes design decisions, eliminating the need for an additional design document.

## Introduction 

The objective is to achieve a one-click setup that can be executed locally without any modifications to the code base. To accomplish this, environment variable - local and an encryption key for security properties are injected into the application using global properties.

## Getting Started

### Dependencies

* Anypoint Studio with Maven setup
* Postman 
* Git or any Git Client App

## Installation

* Ensure that Git is installed on your system. Afterward, clone the repository. Make sure you are on master branch.
```
git clone https://github.com/snaik7/salesforce-account-sapi
cd salesforce-account-sapi
git status
```
* Import the Mule application into Anypoint Studio. 
* Run the application within the Studio environment. 

Note that the application is not hosted in the cloud and is currently designed for local use. Nevertheless, it can be readily extended to higher environments with minor modifications.


## Help

If you have any issue with running project, please send an email to Author. 


## API Specification

The API specifications have been published to SwaggerHub at the following link: https://app.swaggerhub.com/apis/NAIKSANTOSH/salesforce-account-sapi/1.0.0

## Design Decisions

### Common Data Model 

The requirement entailed processing both Individual and Business Accounts. To address this, we establish a common data model object called "Accounts" (an array of accounts) capable of handling both Individual and Business Accounts. This enables us to process multiple Accounts while accommodating specialized validations tailored to each account type. The Accounts object is employed for creating, updating, and retrieving accounts.

Likewise, the Address common data model is utilized for both Shipping and Billing addresses, with a "type" attribute to differentiate between them. Since they share similar validation requirements, there is no need for separate objects for validation purposes.

### Defining Endpoints for API

We've supplied endpoints for both creating and updating accounts. However, we could have opted for a single endpoint to "upsert/patch" accounts, effectively handling both creation and updating of records. The rationale behind maintaining two endpoints is that "upserts" always verify the existence of a record before proceeding with the operation, incurring additional processing costs. By retaining two endpoints, the process is simplified: creating a record bypasses the need for existence checks, while updating utilizes the record's ID. 

We've provided endpoints for both retrieving and deleting individual accounts using the accountId. Furthermore, we've extended support for deleting or retrieving multiple accounts by allowing the accountId query parameter to accept a comma-separated list of accountIds. While we could have converted this functionality into a POST method, doing so may violate REST principles. Since Account Ids are not considered sensitive information, it's appropriate to offer the option for retrieving multiple accounts using a GET request.


We have opted not to include an endpoint for retrieving all accounts. This decision was made due to potential performance issues when dealing with thousands of accounts. Instead, we have provided search options for accounts based on name, accountId, and email. The search functionality operates on an AND logic, meaning that all provided search criteria are applied. However, only one of the search criteria is mandatory for the search to execute successfully.


### Connecting to Salesforce

The prerequisite for connecting to Salesforce was synchronous communication. The document - https://help.salesforce.com/s/articleView?id=sf.integrate_what_is_api.htm&type=5 - helps to decide the appropriate API for connecting to Salesforce:

- REST API using Mule HTTP Connector
- GraphQL API using Mule HTTP Connector
- SOAP API using Mule Webservice Connector
- MuleSoft Salesforce Connector 

The MuleSoft Salesforce Connector facilitates essential operations such as create, read, upsert, and delete across Salesforce objects. It also handles authentication and error management. However, it does not expose all potential Salesforce APIs. Nevertheless, it sufficiently supports current requirements and allows for future adjustments.


### Authentication for MuleSoft Salesforce Connector

The Salesforce connector offers support for both Basic Authentication and OAuth2.
- Basic Authentication
- OAuth2 with grant types - password or JWT

It seems trial version of salesforce account supports Basic Authentication. However, OAuth2 can added in future. 

### Validations

Validations are conducted within DataWeave, as it allows for multiple validations to be performed within a single DataWeave transformation. We refrain from utilizing the MuleSoft validations framework as it primarily validates single inputs. Additionally, OAS-supported validations are employed for email, enum for address type, and string fields wherever applicable.

### Error Handling

Salesforce-specific errors like Salesforce Unavailable and Response Timeout are managed with retry mechanisms.
Any unrecoverable errors are returned to users.
When the Salesforce Connector encounters errors during bulk insert or update operations, we provide an error message for each record along with either a success or error message. However, the HTTP status code always indicates success, such as 201 for create operations or 200 for update operations.
Additionally, the standard APIKit error handler is utilized to handle standard HTTP error codes like 400 and 500.

### Audit and Logging

All requests are audited within Mule, utilizing the x-correlation-id.
Additionally, users can include x-client-correlation-id and x-client-name headers for end-to-end tracking across systems.
The application does not employ payload data logging; therefore, masking features are not utilized.

### Performance

The API's performance was evaluated during the time of writing. The Salesforce connector resource pooling is configured to default settings.

All performance properties, such as responseTimeout, loginTimeout, or connectionTimeout, are set in the properties file.

We limit the search results to 10 records per account search request and enable users to retrieve the next set of records. This approach reduces the number of records handled at the client end, enhancing performance.

As of now, the number of records retrieved from queries can be limited; however, this feature has not been implemented yet.

### Reliability 


In the application, we incorporate retry logic for all recoverable errors like Salesforce Unavailable and Response Timeout. Consequently, Mule will automatically attempt to retry requests at a specified interval until a successful response is obtained. The retry limit is configurable, ensuring that retries do not persist indefinitely. Please note that there is no implementation of exponential backoff for retries. 


### Availability & Scalability

During the evaluation conducted at the time of writing, the API's performance was thoroughly assessed. To ensure improved availability based on performance testing metrics, the API will be deployed on a minimum of 2 vCores/workers. The exact sizing of workers will be determined subsequent to performance testing.

### Transactions

The Salesforce connector offers transactions for each record when executing bulk updates or inserts. It's worth noting that not all records fail if one transaction fails when creating or updating multiple accounts in Salesforce.

### Security

Secure properties are utilized to store sensitive credentials such as usernames and password security tokens.

HTTPS is not implemented for the API. However it can added in future for higher environments.

Since the application is designed to run locally, the TLS feature is not implemented.

### Alert and Notification

After encountering RETRY_EXHAUSTED in the Salesforce Connector, the error handler for RETRY_EXHAUSTED can include specialized error logging to Splunk or Sumo. This logging mechanism can trigger alerts in Splunk or integrate with Slack notifications via hooks. Notifications are not currently implemented in the code.


### No TLS for Salesforce Communication

The Salesforce connector offers support for TLS communication between client and Salesforce API.
- The application designed to run locally hence TLS feature is not implemented. However it can added in future for higher environments.


### No Autodiscovery

- The application designed to run locally hence Autodiscovery feature is not implemented. 


## Usage

Postman Collection for API  

You can download Postman collection for API and environment from root of repository for API. 

- Collection File Name - salesforce-customer-sapi.postman_collection.json
- Environment File Name - salesforce-customer-sapi-env.postman_environment.json


Before executing any requests, please ensure that the application is running smoothly in Anypoint Studio without any errors. Afterward, you can import the Postman collection and environment into Postman for seamless testing. Additionally, make sure that the environment is correctly configured in Postman.


The collection performs the following actions:

- Create Accounts: Creates multiple accounts with different account types.

- Update Accounts: Updates multiple accounts with different account types.

- Get Account: Retrieves a single account.

- Get Accounts: Retrieves multiple accounts when specified in the query parameter as a comma-separated list of accountIds.

- Delete Account: Deletes a single account.

- Delete Accounts: Deletes multiple accounts when specified in the query parameter as a comma-separated list of accountIds.

- Search Accounts: Searches for accounts based on name (first and last name or company name), email, and account Id. Pagination functionality enables users to access the next set of 10 records by passing the next offset parameter. 


## Extensions and customizations

The following features can be added:

- HTTPS Support for HTTP listener

- OAuth2 Support

- TLS Support

- Auto-discovery


