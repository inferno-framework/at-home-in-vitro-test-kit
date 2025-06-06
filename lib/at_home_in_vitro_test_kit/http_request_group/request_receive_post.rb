require_relative '../test_common/fhir_bundle_validation'
require 'inferno'

module AtHomeInVitroTestKit
    class RequestReceivePost < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'Receive FHIR Bundle via POST request.'
      description %(
        This test verifies that an App Server or Data Hub can successfully submit a FHIR Bundle to the At-Home In-Vitro test kit via HTTP POST request.
        
        # Test Process
        
        1. The test generates a unique endpoint URL for receiving the FHIR Bundle
        2. The test waits for a POST request to this endpoint (timeout: 24 hours)
        3. When a request is received, it verifies:
           * The request includes the correct session identifier
           * The Content-Type header is 'application/json'
           * The request body contains valid JSON
        
        # Request Requirements
        
        The POST request must meet these requirements:
        * URL: The provided endpoint URL
        * Query Parameter: 'id' matching the session identifier
        * Headers:
          - Content-Type: application/json
        * Body: Raw JSON FHIR Bundle
        
        # Error Handling
        
        The test will fail if:
        * The session identifier is missing or incorrect
        * The Content-Type header is missing or incorrect
        * The request body is not valid JSON
        * No request is received within 24 hours
        
        If the test fails, you can rerun it to get a new endpoint URL and timeout period.
      )
      id :request_receive_post

      input :session_id,
            type: 'text',
            description: 'Value used to identify test session. Whatever value is entered here MUST be included in the POST request as a query parameter.'

      receives_request :bundle

      run do
        wait(
            identifier: session_id,
            message: %(
                Make a request to this endpoint within the next 24 hours.

                #{Inferno::Application['base_url']}/custom/at_home_test_kit/bundle?id=#{session_id}

                If the test times out or is cancelled for any reason, rerunning the test group will restart the timeout.

                Your request body MUST be your FHIR Bundle in raw json format. Testing will resume automatically after a valid POST is received.
            ),
            timeout: 86400
        )
      end
    end
end
