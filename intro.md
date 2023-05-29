:memo: [EUDI Wallet Reference Implementation](#eudi-wallet-reference-implementation) :computer: [Repositories](#repositories) :wrench:[How to Use](#how-to-use) :unlock: [Licensing](#licensing) :heavy_exclamation_mark: [Disclaimer](#disclaimer)

# EUDI Wallet Reference Implementation 
## Overview

The EUDI Wallet Reference Implementation is built based on the [Architecture Reference Framework](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework) and aims to provide an EUDI Wallet Prototype showcasing a robust and interoperable platform for managing verifiable credentials within the European Union.

Based on the approach followed, a set of business agnostic, re-usable components are being implemented which will be evolved in incremental steps and can be re-used across multiple use-cases (e.g. protocol libraries SIOPv2, OID4VP etc.). Indicatively,
-   Online identification user journey has common elements across several use-cases
-   Proximity electronic attribute attestation (e.g. mDL) sharing is common across several use-cases

In order to demonstrate the capabilities of the EUDI Wallet Prototype, a set of different applications are being implemented. These applications showcase the use cases supported by the EUDI Wallet Prototype, allowing users to understand and familiarize with the corresponding technical capabilities. Indicatively, as part of the EUDI Wallet Prototype, the following set of applications are being delivered:

-   Demo EUDI Wallet mobile native applications for remote and proximity flows
-   Verifier mobile native applications and web-services for remote and proximity flow

Please refer to our documentation and repositories for more detailed information on how to get started, contribute, and engage with the EU Wallet Prototype project.

## Release 'R0.1' - Functional Scope

The overall scope of the EUDI Wallet Reference Implementation is split into the pre-releases, ‘R0.1’(06/23), ‘R0.2’(09/23) and the ‘MVP R1.0’ (12/23) release.

The functional scope of the ‘R0.1’ release includes the first iteration of two main use cases of the EUDI Wallet Prototype, which are 'Identification and Authentication to access online services' and 'Proximity Data Sharing - Mobile Driving License'. Further details about the corresponding use cases are listed below:

-   **Remote same-device identification and authorisation**
	-   _Description_: A key use case of the European digital wallet (EUDI Wallet) is to provide secure identification and authentication of users against public and private services of the Relying Parties. This functionality is crucial for public and private Relying Parties that are required to ensure they are communicating with the right person
	-   _Remarks_:
		-   PID pre-loaded
		-   App-to-app flow for online authentication
	-   _Applicable Platform_: Android


-   **Proximity Data Transfer**
	-   _Description_: A key use case of the European digital wallet (EUDI Wallet) is to enable the user to obtain, store and present a mobile Driving Licence in order to prove his/her driving rights
	-   _Goal_: Enable the user to share data on proximity scenarios, focusing on the mobile Driving License (i.e. mDL) scenario
	-   _Remarks_:
		-   mDL pre-loaded
		-   Using QR/BLE proximity protocols
	-   _Applicable Platform_: Android


# Repositories
This section provides an overview over the EUDI Reference Implementation project and aims to provide an overview of the key repositories of the project. The table below acts as navigation aid to find the information you are looking for.

Note: Naming Conventions to be updated accordingly

| Name | Description    | Link |
| -------- | ------- |------- |
|eudi-app-android-holder-verifier-23220-4-kt| Demo applications for demostrating SIOP-OpenId4VP Kotlin SDK capabilities    | [Repository](https://github.com/niscy-eudiw/siop-openid4vp-demo-android)|
|eudi-lib-android-mdoc-holder-18013-5| mdoc Holder application (Implementation of ISO/IEC 18013-5 for Android) | [Repository](https://github.com/eu-digital-identity-wallet/android-18013)|
|eudi-srv-web-verifier-endpoint-23220-4-kt| Web application (backend Restful service) that would allow somebody to trigger the presentation use case | [Repository](https://github.com/eu-digital-identity-wallet/verifier)|
|eudi-lib-jvm-siop-openid4vp-kt| Implementation of SIOPv2 and OpenID4VP protocols (wallet's role) in Kotlin  | [Repository](https://github.com/eu-digital-identity-wallet/siop-openid4vp-kt)|
|eudi-lib-jvm-presentation-exchange-kt| Implementation of DIF Presentation Exchange v2 specification in Kotlin | [Repository](https://github.com/eu-digital-identity-wallet/presentation-exchange-kt)|

# How to use
Instructions for installing and using the applicable applications/libraries can be found in the corresponding 'ReadMe' files, i.e. for the [Demo Apps - Remote Use Case](https://github.com/niscy-eudiw/siop-openid4vp-demo-android/blob/documentation/README.md#installation), [Demo App - Proximity Use Case](https://github.com/niscy-eudiw/android-18013/blob/main/README.md), [Verifier for Proximity](https://github.com/niscy-eudiw/android-18013-verifier) and [Verifier for Remote](https://github.com/niscy-eudiw/verifier).

# Licensing
TBD

# Disclaimer
TBD
