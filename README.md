# salesforce-account-sapi
Salesforce Account System API

# Overview

The README file provides an overview of the application's purpose and functionality, along with instructions for installation, utilization of existing features, and expansion possibilities.

## Introduction 

The goal is to have  one-click setup that can be run locally without touching the code base. Hence envoronment variable and encrption key for security property is injected in app using global property. 

## Installation

Make sure git is installed. Then, clone the repository and import mule app in Anypoint Studio.
App is not hosted in cloud and it's for curretly for local use and can be extended to higher environemnt with minor changes. 

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

Postman Collection for API  https://api.postman.com/collections/772995-587bae43-3263-46c6-9e85-871b59d71a78?access_key=PMAT-01HXNPFV9B22EEYXCXW14HS17X


Collection performs -

Create Accounts 

Update Accounts 

Get Account - Single Account

Get Accounts - Multiple Accounts if send in query param as comma seperated value in accountId

Delete Account - Single Account

Delete Accounts - Multiple Accounts if send in query param as comma seperated value in accountId

Search Accounts 

## Extensions and customizations








 
 
 
 







