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


Design Desicions    		| Choices 			| Best suited to meet requirements
------------- 				| -------------
Connecting to Salesforce  	| REST API
			  				| Graph QL API

## Usage

Postman Collection for API


Collection performs -

Create Accounts 

Update Accounts 

Get Account - Single Account

Get Accounts - Multiple Accounts if send in query param as comma seperated value in accountId

Delete Account - Single Account

Delete Accounts - Multiple Accounts if send in query param as comma seperated value in accountId

Search Accounts 

## Extensions and customizations








 
 
 
 







