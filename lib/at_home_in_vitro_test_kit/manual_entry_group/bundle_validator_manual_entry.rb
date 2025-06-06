require_relative 'manual_fhir_bundle_validation'
require_relative 'manual_fhir_bundle_entry_validation'

module AtHomeInVitroTestKit
  class BundleValidatorManualEntry < Inferno::TestGroup

    title 'At-Home In-Vitro Manual Input Test'
    short_description 'Validate a manually input FHIR Bundle and all of its nested resources.'
    description %(
      # Background

      The At-Home In-Vitro Manual Input Test sequence verifies that
      a At-Home In-Vitro FHIR Bundle and its entries, constructed either manually or by
      a digital testing application, conforms to the resource profiles
      outlined in the [At-Home In-Vitro FHIR Implementation Guide](http://hl7.org/fhir/us/home-lab-report/ImplementationGuide/hl7.fhir.us.home-lab-report).
      This validation process ensures data quality and interoperability for manually entered test results.

      # Testing Methodology
      ## Bundle Validation

      The first test in this sequence verifies that the FHIR Bundle
      taken from user input conforms to the specifications outlined in the
      [At-Home In-Vitro Bundle Profile](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Bundle-at-home-in-vitro-test).

      According to the Profile description, a valid Bundle MUST contain the following elements:

      * identifier - Persistent identifier for the bundle (UUID format recommended)
      * type - fixed value code that identifies the bundle type ('message')
      * timestamp - identifies time that the bundle was assembled (ISO 8601 format)
      * entry:messageHeader - bundle entry and resource of type [MessageHeader](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/MessageHeader-at-home-in-vitro-test-results)

      While a MessageHeader entry is required for all bundles to conform, a bundle
      may contain multiple entry resources that conform to other resource profiles outlined
      in the IG. The validation process includes checking for:
      * Correct data types for each field
      * Required elements presence
      * Valid code system values
      * Proper resource references

      ## Entry Validation

      The second test in this sequence uses the manually input FHIR Bundle
      from the first test, and validates each entry resource against its
      profile outlined in the IG. Entry types that can be validated (aside from MessageHeader) include
      the following:

      * [Device](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Device-at-home-in-vitro-test) - Represents the testing device used
      * [DiagnosticReport](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/DiagnosticReport-at-home-in-vitro-results) - Contains the overall test report
      * [Observation -At-Home In-Vitro Test Result](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Observation-at-home-in-vitro-test-result) - Individual test results
      * [Observation -Patient Question Answer](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Observation-patient-question-answer) - Patient-provided information
      * [Patient](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Patient-at-home-in-vitro-test) - Information about the person tested
      * [Specimen](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Specimen-at-home-in-vitro-test) - Details about the collected sample

      Each resource is validated against its specific profile requirements, ensuring all mandatory elements are present and correctly formatted. The test will provide detailed feedback for any validation errors encountered.
    )
    id :bundle_validator_manual_entry

    run_as_group(true)

    test from: :manual_fhir_bundle_validation
    test from: :manual_fhir_bundle_entry_validation
  end
end
