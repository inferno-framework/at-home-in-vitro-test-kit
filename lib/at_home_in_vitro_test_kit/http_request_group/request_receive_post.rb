require_relative '../test_common/fhir_bundle_validation'
require 'inferno'

module AtHomeInVitroTestKit
    class RequestReceivePost < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'Receive FHIR Bundle via POST request.'
      description %(
        Confirm that App Server or Data Hub correctly passes a FHIR bundle to the At-Home In-Vitro test kit.
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