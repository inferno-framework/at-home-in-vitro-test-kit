require_relative '../test_common/fhir_bundle_validation'

module AtHomeInVitroTestKit
    class RequestFhirBundleEntryValidation < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'FHIR Bundle Entry Validation'
      description %(
        Validate that the FHIR Bundle entries conform to their relative At-Home In-Vitro Test Report IG specifications.
      )
      id :request_fhir_bundle_entry_validation

      uses_request :bundle

      def fhir_resource
        FHIR::Json.from_json(request.request_body)
      end

      run do
        validate_bundle_entries(fhir_resource)
      end
    end
end