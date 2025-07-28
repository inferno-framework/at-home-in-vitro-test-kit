require_relative '../test_common/fhir_bundle_validation'

module AtHomeInVitroTestKit
    class RequestFhirBundleValidation < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'FHIR Bundle Validation'
      description %(
        This test validates that the submitted FHIR Bundle conforms to the At-Home In-Vitro Test Report Implementation Guide specifications.
        
        # Validation Process
        
        The test performs the following validations:
        1. Verifies the Bundle structure follows the [At-Home In-Vitro Bundle Profile](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Bundle-at-home-in-vitro-test)
        2. Checks for required elements:
           * identifier (UUID format recommended)
           * type (must be 'message')
           * timestamp (ISO 8601 format)
           * entry:messageHeader
        3. Validates data types and formats
        4. Ensures all references are valid
        
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
