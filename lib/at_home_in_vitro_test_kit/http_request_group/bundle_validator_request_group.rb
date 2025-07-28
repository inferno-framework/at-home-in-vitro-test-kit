require_relative 'request_fhir_bundle_validation'
require_relative 'request_fhir_bundle_entry_validation'
require_relative 'request_receive_post'

module AtHomeInVitroTestKit
  class BundleValidatorRequestGroup< Inferno::TestGroup

    title 'At-Home In-Vitro Test'
    short_description 'Validate a FHIR Bundle and all of its nested resources.'
    description %(
    # Background
  
    The At-Home In-Vitro Test sequence validates FHIR Bundles that are submitted via HTTP POST requests.
    The test ensures that submitted bundles conform to the resource profiles defined in the
    [At-Home In-Vitro FHIR Implementation Guide](http://hl7.org/fhir/us/home-lab-report/ImplementationGuide/hl7.fhir.us.home-lab-report).
    This validation process is critical for ensuring data quality and interoperability in home-based laboratory testing scenarios.
  
    # Testing Methodology
    ## POST Request Requirements
        
    The first test in this sequence prepares the kit for POST request handling:

    1. The user provides a unique identifier for their test session
    2. The test kit provides an Inferno endpoint URL for submitting the POST request
    3. The POST request must include:
       * Query parameter: 'id=<session_identifier>'
       * Content-Type header: 'application/json'
       * Body: Raw JSON FHIR Bundle
    4. The test kit associates the received bundle with the test session for validation

    If any of these requirements are not met, the test will fail with specific error messages indicating which requirements were not satisfied.

    ## Bundle Validation
  
    The second test in this sequence verifies that the FHIR Bundle
    received via POST request conforms to the specifications outlined in the
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
  
    The third test in this sequence uses the FHIR Bundle
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
    id :bundle_validator_request_group

    run_as_group(true)

    test from: :request_receive_post
    test from: :request_fhir_bundle_validation
    test from: :request_fhir_bundle_entry_validation
  end
end
