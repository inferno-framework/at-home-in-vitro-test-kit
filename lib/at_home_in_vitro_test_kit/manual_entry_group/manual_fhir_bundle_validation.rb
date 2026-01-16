require_relative '../test_common/fhir_bundle_validation'

module AtHomeInVitroTestKit
    class ManualFhirBundleValidation < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'FHIR Bundle Validation'
      description %(
        This test validates that the manually entered FHIR Bundle conforms to the At-Home In-Vitro Test Report Implementation Guide specifications.
        
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
        
        # Input Requirements
        
        The test expects a JSON-formatted FHIR Bundle in the text input field. The Bundle should:
        * Be valid JSON syntax
        * Follow FHIR Bundle resource structure
        * Include all required elements as specified in the Implementation Guide
      
      )
      id :manual_fhir_bundle_validation
      input :fhir_bundle,
            type: 'textarea',
            description: 'At-Home In-Vitro Bundle'

      def fhir_resource
        resource = FHIR::Json.from_json(fhir_bundle);
        resource
      end

      run do
        validate_bundle(fhir_resource)
      end
    end
end
