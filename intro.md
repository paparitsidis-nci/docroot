# EUDIW

Web application (Backend Restful service) that would allow somebody to trigger the presentation use case (cross device, remote presentation scenario).

[link to section of the second page](./second.md#section-of-second-page)

## Entity Diagram

In the EUDIW ecosystem there are 3 main entities:
- Wallet,
- Issuer,
- Verifier

```mermaid
%%{init: { 'theme':'dark', 'background': 'transparent' } }%%
graph TB;
  Wallet --> Issuer;
  Issuer --> Wallet;
  Wallet -- <i>a</i> --> Verifier;
  Verifier -- <i>b</i> --> Wallet;
```

This document is focusing on the interactions _a_ and _b_ between Wallet and Verifier.
The Verifier implemented in this repo is part of the Verifier entity, in particular it is the Verifier Backend.

## Sequence diagram for EUDI Wallet entity interaction  

This sequence diagram is a merge of the following specifications:

- [OpenId4VP draft 18, section 10.5, Figure 3](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)
- ISO 23220-4, Appendix B
- [OAuth 2.0](https://www.rfc-editor.org/rfc/rfc9101.html)

Sequence numbering following format:
- "([0-9])" is from OpenId4VP specifications document,
- "[0-9]" is from ISO 23220-4 specifications document

Useful references are:
- [Presentation exchange](https://identity.foundation/presentation-exchange/spec/v2.0.0/)

```mermaid
%%{init: { 'theme':'dark', 'background': 'transparent', 'sequence': {'useMaxWidth':false} } }%%
sequenceDiagram
box Wallet entity
    participant WU as Wallet User<br/>User (ISO 23220-4)
    participant WB as Wallet Web Browser<br/>Internet Browser mobile App (ISO 23220-4),<br/>User (OpenId4VP)
    participant WA as Wallet application<br/>mDocApp (ISO 23220-4),<br/>Wallet (OpenId4VP)
end

box Verifier entity
    participant VU as Verifier User<br/>User (OpenId4VP)
    participant VE as Verifier application<br/>mdoc verification application<br/>Internet frontend (ISO 23220-4),<br/>Verifier (OpenId4VP)
    participant VB as Verifier backend<br/>Verifier Response Endpoint (OpenId4VP),<br/>Internet Web Service (ISO 23220-4),<br/>Verifier Backend, Verifier App
end

rect rgb(0,0,0,.1)
note right of WU: Engagement phase

    VU ->> VE: (_) interacts
    VE ->> VE: (1) create nonce

    VE ->> VE: 1 prepare request_uri

    VE ->> VB: (2) initiate transaction
    VB ->> VE: (3) return transaction-id & request-id
    
    alt depending on spec (OpenId4VP / ISO 23220-4) 
        VE ->> WA: (4) Authorisation Request (response_uri, nonce, state)
    else
        VE ->> WB: 2 [TLS] open web page including request_uri [section B.3.1]
    end    
    
    WU ->> WB: 3 User interaction

    alt 
        activate WB
        activate WA
            WB ->> WA: 4 readerEngagement incl. request_uri
        deactivate WB
        deactivate WA
    else
        activate WB
        activate WA
            WB ->> WA: 5 deep linking with scheme mdoc-openId4vp:// incl. request_uri as payload
        deactivate WB
        deactivate WA
    end
end

rect rgb(0,0,0,.1)
note right of WU: device retrieval phase

    activate WA
        activate VB
            WA ->> VB: 6 HTTPs GET to request_uri
            VB ->> WA: 7 JWS Authorisation request object [section B.3.2.1]
        deactivate VB
        
        WA ->> WA: 8 validate signed authorisation request
        WU ->> WA: 9 User authentication and consent
        
        WA ->> WA: 10 prepare vp_token containing deviceResponse
        WA ->> WA: 11 Prepare Authorisation response [section B.3.2.2]
    activate VB
        WA ->> VB: 12 HTTPs POST to response_uri [section B.3.2.2]<br/>(5) Authorisation Response (VP Token, state)
        VB ->> VB: 13 Identify Authorisation Request bound to this POST response
        VB ->> WA: 14 OK: HTTP 200 with redirect_uri<br/>(6) Response (redirect_uri with response_code)
    activate WB
        WA ->> WB: 15 Call browser to open redirect_uri
    deactivate WA

    VB ->> VB: 16 decrypt JARM, parse vp_token, extract and verify deviceResponse

    activate VE

    alt depending on spec (OpenId4VP / ISO 23220-4)
        WA ->> VE: (7) Redirect to the redirect URI (response_code)
    else
        WB ->> VE: 17 HTTPs GET to redirect_uri
    end
    VE ->> VE: (10) check nonce
   
    VE ->> VB: 18 get the data from Authorisation Response session<br/>(8) fetch response data (transaction-id, response_code)
    VB ->> VB: 19 confirm session and check for fixation attack
    VB ->> VE: 20 return status and conditionally return data<br/>(9) response data (VP Token, Presentation Submission)
    VE ->> WB: 21 OK HTTP 200 refresh web page
    
    deactivate VB
    deactivate VE
    deactivate WB
end
```

(1) The Verifier selects a nonce value as fresh, cryptographically random number with sufficient entropy and associates it with the session.

(2) The Verifier initiates a new transaction at its Response Endpoint.

(3) The Response Endpoint will set up the transaction and respond with two fresh, cryptographically random numbers with sufficient entropy designated as transaction-id and request-id. Those values are used in the process to identify the authorization response (request-id) and to ensure only the Verifier can obtain the Authorization Response data (transaction-id).

(4) The Verifier then sends the Authorization Request with the request-id as state and the nonce value created in step (1) to the Wallet.

(5) After authenticating the End-User and getting her consent to share the request Credentials, the Wallet sends the Authorization Response with the parameters vp_token, presentation_submission and state to the response_uri of the Verifier.

(6) The Verifier's Response Endpoint checks whether the state value is a valid request-id. If so, it stores the Authorization Response data linked to the respective transaction-id. It then creates a response_code as fresh, cryptographically random number with sufficient entropy that it also links with the respective Authorization Response data. It then returns the redirect_uri, which includes the response_code to the Wallet.

Note: If the Verifier's Response Endpoint does not return a redirect_uri, processing at the Wallet stops at that step. The Verifier is supposed to fetch the Authorization Response without waiting for a redirect (see step 8).

(7) The Wallet sends the user agent to the Verifier (redirect_uri). The Verifier receives the Request and extracts the response_code parameter.

(8) The Verifier sends the response_code and the transaction-id from its session to the Response Endpoint.

The Response Endpoint uses the transaction-id to look the matching Authorization Response data up, which implicitly validates the transaction-id associated with the Verifier's session.
If an Authorization Response is found, the Response Endpoint checks whether the response_code was associated with this Authorization Response in step (6).
Note: If the Verifier's Response Endpoint did not return a redirect_uri in step (6), the Verifier will periodically query the Response Endpoint with the transaction-id to obtain the Authorization Response once it becomes available.

(9) The Response Endpoint returns the VP Token and Presentation Submission for further processing to the Verifier.

(10) The Verifier checks whether the nonce received in the Credential(s) in the VP Token in step (9) corresponds to the nonce value from the session. The Verifier then consumes the VP Token and invalidates the transaction-id, request-id and nonce in the session.
