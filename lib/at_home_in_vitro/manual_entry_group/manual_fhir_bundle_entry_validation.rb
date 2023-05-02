require_relative '../test_common/fhir_bundle_validation'

module AtHomeTestKit
    class ManualFhirBundleEntryValidation < Inferno::Test
        include AtHomeTestKit::FhirBundleValidator
      title 'FHIR Bundle Entry Validation'
      description %(
        Validate that the FHIR Bundle entries conform to their relative At-Home In-Vitro Test Report IG specifications.
      )
      id :manual_fhir_bundle_entry_validation
      input :fhir_bundle

      def fhir_resource
        resource = FHIR::Json.from_json(fhir_bundle);
        resource
      end

      run do
        validate_bundle_entries(fhir_resource)
      end
    end
end