require_relative '../test_common/fhir_bundle_validation'

module AtHomeTestKit
    class RequestFhirBundleValidation < Inferno::Test
        include AtHomeTestKit::FhirBundleValidator
      title 'FHIR Bundle Validation'
      description %(
        Validate that the FHIR Bundle conforms to the At-Home In-Vitro Test Report IG specifications.
      )
      id :request_fhir_bundle_validation

      uses_request :bundle

      def fhir_resource
        FHIR::Json.from_json(request.request_body);
      end

      run do
        validate_bundle(fhir_resource)
      end
    end
end