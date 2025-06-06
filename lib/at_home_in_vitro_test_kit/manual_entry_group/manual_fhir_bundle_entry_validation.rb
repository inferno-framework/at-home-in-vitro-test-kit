require_relative '../test_common/fhir_bundle_validation'

module AtHomeInVitroTestKit
    class ManualFhirBundleEntryValidation < Inferno::Test
        include AtHomeInVitroTestKit::FhirBundleValidator
      title 'FHIR Bundle Entry Validation'
      description %(
        This test validates each entry within the manually entered FHIR Bundle against their respective profiles defined in the At-Home In-Vitro Test Report Implementation Guide.
        
        # Validation Process
        
        For each entry in the bundle, the test:
        1. Identifies the resource type (Device, DiagnosticReport, Observation, Patient, Specimen, etc.)
        2. Validates the resource against its corresponding profile from the Implementation Guide
        3. Ensures all required elements are present and correctly formatted
        4. Verifies that value sets and codes are valid
        
        # Supported Resource Types
        
        The test validates the following resource types:
        * MessageHeader (required) - Must conform to MessageHeader-at-home-in-vitro-test-results profile
        * Device - Must conform to Device-at-home-in-vitro-test profile
        * DiagnosticReport - Must conform to DiagnosticReport-at-home-in-vitro-results profile
        * Observation (Test Result) - Must conform to Observation-at-home-in-vitro-test-result profile
        * Observation (Question Answer) - Must conform to Observation-patient-question-answer profile
        * Patient - Must conform to Patient-at-home-in-vitro-test profile
        * Specimen - Must conform to Specimen-at-home-in-vitro-test profile
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
