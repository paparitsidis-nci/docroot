:memo: [EUDI Wallet Reference Implementation](#eudi-wallet-reference-implementation) :computer: [Repositories](#repositories) :heavy_exclamation_mark: [Licensing](#licensing)

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

The overall scope of the EUDI Wallet Reference Implementation is split into the pre-releases, ‘R0.1’, ‘R0.2’ and the ‘MVP R1.0’ release.

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
TBD

# Licensing
TBD
