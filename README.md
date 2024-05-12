# salesforce-account-sapi
Salesforce Account System API

# Overview

The README file provides an overview of the application's purpose and functionality, along with instructions for installation, utilization of existing features, and expansion possibilities.

## Introduction 

The objective is to achieve a one-click setup that can be executed locally without any modifications to the code base. To accomplish this, environment variable - local and an encryption key for security properties are injected into the application using global properties.

## Installation

Ensure that Git is installed on your system. Afterward, clone the repository and import the Mule application into Anypoint Studio. Run the application within the Studio environment. Note that the application is not hosted in the cloud and is currently designed for local use. Nevertheless, it can be readily extended to higher environments with minor modifications.

## Design Decisions

1. Connecting to Salesforce

The prerequisite for connecting to Salesforce was synchronous communication. The document - https://help.salesforce.com/s/articleView?id=sf.integrate_what_is_api.htm&type=5 - helps to decide the appropriate API for connecting to Salesforce:

- REST API using Mule HTTP Connector
- GraphQL API using Mule HTTP Connector
- SOAP API using Mule Webservice Connector
- MuleSoft Salesforce Connector 

The MuleSoft Salesforce Connector facilitates essential operations such as create, read, upsert, and delete across Salesforce objects. It also handles authentication and error management. However, it does not expose all potential Salesforce APIs. Nevertheless, it sufficiently supports current requirements and allows for future adjustments.


2. No TLS for Salesforce Communication

The Salesforce connector offers support for TLS communication between client and Salesforce API.
- The application designed to run locally hence TLS feature is not implemented. However it can added in future for higher environments.

3. Authentication for MuleSoft Ssalsforce Connector

The Salesforce connector offers support for both Basic Authentication and OAuth2.
- Basic Authentication
- OAuth2 with grant types - password or JWT

It seems trial version of salesforce account supports Basic Authentication. However, OAuth2 can added in future. 

4. No Autodiscovery

- The application designed to run locally hence Autodiscovery feature is not implemented. 


## API Specification

https://app.swaggerhub.com/apis/NAIKSANTOSH/salesforce-account-sapi/1.0.0

## Usage

Postman Collection for API  

You can download Postman collection for API and environment from root of repository for API. 

- Collection File Name - salesforce-customer-sapi.postman_collection.json
- Environment File Name - salesforce-customer-sapi-env.postman_environment.json


Collection performs -

Create Accounts 

Update Accounts 

Get Account - Single Account

Get Accounts - Multiple Accounts if send in query param as comma seperated value in accountId

Delete Account - Single Account

Delete Accounts - Multiple Accounts if send in query param as comma seperated value in accountId

Search Accounts 

## Extensions and customizations








 
 
 
 







