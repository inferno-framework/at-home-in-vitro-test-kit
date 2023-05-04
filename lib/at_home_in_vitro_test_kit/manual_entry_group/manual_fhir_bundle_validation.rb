require_relative '../test_common/fhir_bundle_validation'

module AtHomeInVitroTestKit
    class ManualFhirBundleValidation < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'FHIR Bundle Validation'
      description %(
        Validate that the FHIR Bundle conforms to the At-Home In-Vitro Test Report IG specification.
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