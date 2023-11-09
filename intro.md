:memo: [EUDI Wallet Reference Implementation](#eudi-wallet-reference-implementation) :computer: [Repositories](#repositories) :wrench:[How to Use](#how-to-use) :heavy_exclamation_mark: [Disclaimer](#disclaimer) :information_source:[About the project](#about-the-project)

# EUDI Wallet Reference Implementation 

## Overview

The EUDI Wallet Reference Implementation is built based on the [Architecture Reference Framework](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework) and aims at showcasing a robust and interoperable platform for digital identification, authentication and electronic signatures based on common standards across the European Union.

The EUDI Wallet Reference Implementation is based on a modular architecture composed of a set of business agnostic, re-usable components which will be evolved in incremental steps and can be re-used across multiple projects.
Specifically, as part of the EUDI Wallet Reference Implementation, the following set of components are being delivered:

-   [Libraries and other software components needed to the framework](https://github.com/niscy-eudiw/docroot/blob/main/intro.md#libraries)
-   [Demo EUDI Wallet mobile native applications for proximity and remote flows](https://github.com/niscy-eudiw/docroot/blob/main/intro.md#wallet-ui-and-demo-apps)
-   [Verifier mobile native applications and web-services for proximity and remote flows](https://github.com/niscy-eudiw/docroot/blob/main/intro.md#verifier-and-eco-system-apps)

Please refer to our documentation and repositories listed in the following sections for more detailed information on how to get started, contribute, and engage with the EU Wallet Reference Implementation.

## Functional Scope

The current scope of the EUDI Wallet Reference Implementation includes first iterations of key functionalities: Sharing and Presenting Personal Identification Data (PID) and Mobile Driving License (mDL) in Remote and Proximity scenarios. Based on these functionalities, a broad set of Use Cases are supported as a minimum, such as:
- Mobile Driving License
- Accessing online public and private services 
- Opening a bank account
- SIM registration
- Payment authorisation
- Authenticating a third-party service to sign documents
- Etc.

<Details open>
 <summary><i>Functional Scope Remarks </i></summary> <br>

As of November 2023, the following remarks shall be considered in relation to the provided functionalities.

**Remote Presentation** <br>
- Light (mock) PID Issuance process (provides test PID issuing service in mDoc and soon in SD-JWT-VC format)
- Same-device and cross-device flows for online authentication and authorization (OpenID4VP transfering mDoc for remote authentication and authorisation)
- Applicable platforms: Android, iOS

**Proximity Sharing**
- mDL preloaded item
- Using QR/BLE proximity protocols
- NFC tag for device engagement support (static hand-over)
- Applicable platforms: Android, iOS
</Details>


# Repositories
This section provides an overview of the key repositories of the EUDI Reference Implementation. The table below acts as navigation aid to find the information you are looking for.

## Libraries

### Wallet Core (Android) and Wallet Kit (iOS) Coordinator Libraries

| Repository          | Description                                                                   | 
|---------------|-------------------------------------------------------------------------------|
| [Wallet Core (Android)](https://github.com/eu-digital-identity-wallet/eudi-lib-android-wallet-core) | Implementation of the EUDI Wallet Core library for Android that serves as a coordinator layer between the UI app and the Wallet libraries. Currently, coordinates proximity and remote presentation libraries.       
| [Wallet Kit (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-android-wallet-kit) | Implementation of the EUDI Wallet Kit library for iOS that serves as a coordinator layer between the UI app and the Wallet libraries. Currently coordinates proximity and remote presentation libraries.      | 

### Proximity Sharing iOS Libraries

| Repository          | Description                                                                   | 
|---------------|-------------------------------------------------------------------------------|
| [Security (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-security)      | Implementation of mDoc security mechanisms according to ISO/IEC 18013-5.       |
| [Data Transfer (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-data-transfer) | Implementation of the mDoc data-transfer library according to ISO/IEC 18013-5. | 
| [Data Model (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-security)    | Implementation of the mDoc data-model according to ISO/IEC 18013-5.           | 


### Proximity Sharing Android Libraries

| Repository          | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| [Data Transfer (Android)](https://github.com/eu-digital-identity-wallet/eudi-lib-android-iso18013-data-transfer) | This library provides a set of classes to manage the transfer of documents in an EUDI ISO 18013-5 Android Wallet. |
| [Data Model (Android)](https://github.com/eu-digital-identity-wallet/eudi-lib-android-wallet-document-manager)    | This library provides a set of classes to manage documents in an EUDI ISO 18013-5 Android Wallet.       | 


### Online Presentation Android Libraries

| Repository          | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| [Presentation Exchange (Android)](https://github.com/eu-digital-identity-wallet/eudi-lib-jvm-presentation-exchange-kt)        | Implementation of DIF Presentation Exchange v2 specification in Kotlin.     |
| [SIOPv2 & OpenID4VP protocols (Android)](https://github.com/eu-digital-identity-wallet/eudi-lib-jvm-siop-openid4vp-kt) | Implementation of SIOPv2 and OpenID4VP protocols (wallet's role) in Kotlin. | 
| [SD-JWT (Android)](https://github.com/eu-digital-identity-wallet/eudi-lib-jvm-sdjwt-kt)                        | SD-JWT library for creating and verifying SD-JWT in JVM Kotlin.             | 

### Online Presentation iOS Libraries

| Repository          | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| [Presentation Exchange (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-presentation-exchange-swift)        | Implementation of DIF Presentation Exchange v2 specification in Swift.     | 
| [SIOPv2 & OpenID4VP protocols (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-siop-openid4vp-swift) | Implementation of SIOPv2 and OpenID4VP protocols (wallet's role) in Swift. |
| [SD-JWT (iOS)](https://github.com/eu-digital-identity-wallet/eudi-lib-sdjwt-swift)                       | SD-JWT library for creating and verifying SD-JWT in JVM Swift.             | 
## Wallet UI and Demo Apps

### Wallet UI App and demo App for Android and iOS

| Repository          | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| [UI / Demo App (Android)](https://github.com/eu-digital-identity-wallet/eudi-app-android-wallet-ui) | Implementation of wallet UI app for Android. Currently, it also includes Demo App, demonstrating the following capabilities, Proximity presentation, Same Device Online Authentication, and light issuing of PID.	 |
| [UI / Demo App (iOS)](https://github.com/eu-digital-identity-wallet/eudi-app-ios-wallet-ui) | Implementation of wallet UI app for iOS. Currently, it also includes Demo App, demonstrating the following capabilities, Proximity presentation, and Same Device Online Presentation.| 


## Verifier and Eco-System Apps

| Repository          | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| [Web Verifier](https://github.com/eu-digital-identity-wallet/eudi-web-verifier)               | Demo Web Verifier UI application (Frontend) that acts as a Verifier/RP trusted end-point (encoded responses only).  |  
| [Restful API (web-services)](https://github.com/eu-digital-identity-wallet/eudi-srv-web-verifier-endpoint-23220-4-kt)             | Demo Web Verifier application (Backend Restful service) that acts as a Verifier/RP trusted end-point (encoded responses only).| 


## Light Issuing Library and App

| Repository          | Description                                                                   |
|---------------|-------------------------------------------------------------------------------|
| [Light PID Issuance](https://github.com/eu-digital-identity-wallet/eudi-lib-android-iso18013-holder) | Implementation of a light issuing approach for the PID and mDL in Python. It includes a PID and mDL mDoc formatter service, samples of possible interconnection to eIDAS demo  node and / or iDPs.	 | 



# How to use

Instructions for installing and using the applicable applications/libraries can be found in the corresponding 'ReadMe' files, i.e.:
- [Build your Demo App (Android)](https://github.com/eu-digital-identity-wallet/eudi-app-android-wallet-ui)
- [Build your Demo App (iOS)](https://github.com/eu-digital-identity-wallet/eudi-app-ios-wallet-ui)
- [Verifier for Remote Presentation](https://github.com/eu-digital-identity-wallet/eudi-srv-web-verifier-endpoint-23220-4-kt/blob/main/README.md)
- [App Verifier for Proximity (Android) Note: external link to APK download](https://install.appcenter.ms/orgs/eu-digital-identity-wallet/apps/mdoc-verifier-testing/distribution_groups/mdoc%20verifier%20(testing)%20public)


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
