:memo: [EUDI Wallet Reference Implementation](#eudi-wallet-reference-implementation) :computer: [Repositories](#repositories) :wrench:[How to Use](#how-to-use) :heavy_exclamation_mark: [Disclaimer](#disclaimer) :information_source:[About the project](#about-the-project)

# EUDI Wallet Reference Implementation 

## Overview

The EUDI Wallet Reference Implementation is built based on the [Architecture Reference Framework](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework) and aims at showcasing a robust and interoperable platform for digital identification, authentication and electronic signatures based on common standards across the European Union.

The EUDI Wallet Reference Implementation is based on a modular architecture composed of a set of business agnostic, re-usable components which will be evolved in incremental steps and can be re-used across multiple projects.
Specifically, as part of the EUDI Wallet Reference Implementation, the following set of components are being delivered:

-   Demo EUDI Wallet mobile native applications for proximity and remote flows
-   Verifier mobile native applications and web-services for proximity and remote flows
-   Libraries and other software components needed to the framework

Please refer to our documentation and repositories listed in the following sections for more detailed information on how to get started, contribute, and engage with the EU Wallet Reference Implementation.

## Functional Scope

The current scope of the EUDI Wallet Reference Implementation includes first iterations of key functionalities, which are Sharing and Presenting PID and mDL in Remote and Proximity. Based on these functionalities, a broad set of Use Cases are supported as a minimum, such as:
- Mobile Driving License
- Accessing online public and private services 
- Opening a bank account
- SIM registration
- Initiating a payment
- Signing document

<Details open>
 <summary><i>Functional Scope Remarks </i></summary> <br>

As of November 2023, the following remarks shall be considered in relation to the provided functionalities.

**Remote identification and authorisation** <br>
- Light (mock) PID Issuance process (provides test PID and mDL issuing service in mDoc and soon in SD-JWT-VC format)
- Same-device and cross-device flows for online authentication and authorization (OpenID4VP transfering mDoc for remote authentication and authorisation)
- Applicable platforms: Android, iOS

**Proximity Data Transfer**
- mDL preloaded item
- Using QR/BLE proximity protocols
- NFC tag for device engagement support (static hand-over)
- Applicable platforms: Android, iOS
</Details>


# Repositories
This section provides an overview over the EUDI Reference Implementation project and aims to provide an overview of the key repositories of the project. The table below acts as navigation aid to find the information you are looking for.

## Libraries

### Proximity Sharing iOS Libraries

| Area          | Description                                                                   | Repository                                                                                                               |
|---------------|-------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Security      | Implementation of mDoc security mechanisms according to ISO/IEC 18013-5       | [eudi-lib-ios-iso18013-security](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-security)           |
| Data Transfer | Implementation of the mDoc data-transfer library according to ISO/IEC 18013-5 | [eudi-lib-ios-iso18013-data-transfer](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-data-transfer) |
| Data Model    | Implementation of the mDoc data-model according to ISO/IEC 18013-5.           | [eudi-lib-ios-iso18013-data-model](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-security)         |


### Proximity Sharing Android libraries

| Area                  | Description                                                                                                                                                                                                                                                                                  | Repository                                                                                                         |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| Library and Demo Apps | Implementation of ISO/IEC 18013-5 for Android (full library with mdoc model management, security, transfer, document management). It also includes Demo App, demonstrating the following capabilities, Proximity presentation,  Same Device Online Authentication, and light issuing of PID. | [eudi-lib-android-iso18013-holder](https://github.com/eu-digital-identity-wallet/eudi-lib-android-iso18013-holder) |


### Online Presentation Android Libraries

| Area                         | Description                                                                 | Repository                                                                                                                   |
|------------------------------|-----------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Presentation Exchange        | Implementation of DIF Presentation Exchange v2 specification in Kotlin.     | [eudi-lib-jvm-presentation-exchange-kt](https://github.com/eu-digital-identity-wallet/eudi-lib-jvm-presentation-exchange-kt) |
| SIOPv2 & OpenID4VP protocols | Implementation of SIOPv2 and OpenID4VP protocols (wallet's role) in Kotlin. | [eudi-lib-jvm-siop-openid4vp-kt](https://github.com/eu-digital-identity-wallet/eudi-lib-jvm-siop-openid4vp-kt)               |
| SD-JWT                       | SD-JWT library for creating and verifying SD-JWT in JVM Kotlin.             | [eudi-lib-jvm-sdjwt-kt](https://github.com/eu-digital-identity-wallet/eudi-lib-jvm-sdjwt-kt)                                 |

### Online Presentation iOS Libraries

| Area                         | Description                                                                | Repository                                                                                                                         |
|------------------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Presentation Exchange        | Implementation of DIF Presentation Exchange v2 specification in Swift.     | [eudi-lib-ios-presentation-exchange-swift](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-presentation-exchange-swift) |
| SIOPv2 & OpenID4VP protocols | Implementation of SIOPv2 and OpenID4VP protocols (wallet's role) in Swift. | [eudi-lib-ios-siop-openid4vp-swift](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-siop-openid4vp-swift)               |
| SD-JWT                       | SD-JWT library for creating and verifying SD-JWT in JVM Swift.             | [eudi-lib-sdjwt-swift](https://github.com/eu-digital-identity-wallet/eudi-lib-sdjwt-swift)                                         |

## Verifier and Demo Apps

### Verifier Apps

| Area                       | Description                                                                                                                    | Repository                                                                                                                           |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Web Verifier               | Demo Web Verifier UI application (Frontend) that acts as a Verifier/RP trusted end-point (encoded responses only).             | [eudi-web-verifier](https://github.com/eu-digital-identity-wallet/eudi-web-verifier)                                                 |
| Restful API (web-services) | Demo Web Verifier application (Backend Restful service) that acts as a Verifier/RP trusted end-point (encoded responses only). | [eudi-srv-web-verifier-endpoint-23220-4-kt](https://github.com/eu-digital-identity-wallet/eudi-srv-web-verifier-endpoint-23220-4-kt) |

### Demo App for iOS

| Area     | Description                                                                                               | Repository                                                                                                           |
|----------|-----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| Demo App | Implementation of ISO/IEC 18013-5 for iOS. Includes Demo App that demonstrates the Proximity capability.	 | [eudi-app-ios-iso18013-holder-demo](https://github.com/eu-digital-identity-wallet/eudi-app-ios-iso18013-holder-demo) |

## Other

| Area               | Description                                                        | Repository                                                                                                      |
|--------------------|--------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| Light PID Issuance | Implementation of a light issuing approach for the PID in Python.	 | [eudi-lib-web-issuing-eudiw-py](https://github.com/eu-digital-identity-wallet/eudi-lib-android-iso18013-holder) |



# How to use

Instructions for installing and using the applicable applications/libraries can be found in the corresponding 'ReadMe' files, i.e.:
- [Demo App - Proximity Use Case](https://github.com/eu-digital-identity-wallet/eudi-lib-android-iso18013-holder/blob/main/README.md)
- [Verifier for Proximity](https://github.com/eu-digital-identity-wallet/android-18013-verifier/blob/main/README.md)
- [Verifier for Remote](https://github.com/eu-digital-identity-wallet/eudi-srv-web-verifier-endpoint-23220-4-kt/blob/main/README.md).


# Disclaimer
The released software is a pre-release version: 
-  The pre-release is an early endeavor reflecting the efforts of a short timeboxed period, and by no means can be considered as the final product.  
-  The pre-release may be changed substantially over time, might introduce new features but also may change or remove existing ones, potentially breaking compatibility with your existing code.
-  The pre-release is limited in functional scope.
-  The pre-release may contain errors or design flaws and other problems that could cause system or other failures and data loss.
-  The pre-release has reduced security, privacy, availability, and reliability standards relative to future releases. This could make the software slower, less reliable, or more vulnerable to attacks than mature software.
-  The pre-release is not yet comprehensively documented. 
-  Users of the software must perform sufficient engineering and additional testing in order to properly evaluate their application and determine whether any of the open-sourced components is suitable for use in that application.
-  We strongly recommend not putting this version of the software into production use.
-  Only the latest version of the software will be supported

# About the project
Links for additional information:  
-  [Electronic Identification](https://digital-strategy.ec.europa.eu/en/policies/electronic-identification)  
-  [Q&A Digital Identity Regulation Proposal](https://digital-strategy.ec.europa.eu/en/faqs/qa-digital-identity-regulation-proposal)  
-  [European Digital Identity Wallet Toolbox Process](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-toolbox)  
-  [European Digital Identity Wallet Pilot implementation (Prototype and Large Scale Pilots)](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-implementation)  
