require_relative 'request_fhir_bundle_validation'
require_relative 'request_fhir_bundle_entry_validation'
require_relative 'request_receive_post'

module AtHomeInVitroTestKit
  class BundleValidatorRequestGroup< Inferno::TestGroup

    title 'At-Home In-Vitro Test'
    short_description 'Validate a FHIR Bundle and all of its nested resources.'
    description %(
    # Background
  
    The At-Home In-Vitro Test sequence verifies that
    a At-Home In-Vitro FHIR Bundle and its entries, constructed either manually or by
    a digital testing application, can be sent via a POST request and conforms to the resource profile
    outlined in the [At-Home In-Vitro FHIR Implementation Guide](http://hl7.org/fhir/us/home-lab-report/ImplementationGuide/hl7.fhir.us.home-lab-report).
  
    # Testing Methodology
    ## POST Request verification
        
    The first test in this sequence prepares the kit for POST request handling. The user will enter an input string identifier for this test session
    and will be prompted with a message about the Inferno endpoint a POST request should be sent to. The request MUST include 'id=<INPUT VALUE>' as
    a query parameter so the test kit can associate a POST with a particular testing session. The FHIR bundle MUST be sent as raw JSON in the body
    of the POST request.

    ## Bundle Validation
  
    The second test in this sequence verifies that the FHIR Bundle
    received via POST request conforms to the specifications outlined in the
    [At-Home In-Vitro Bundle Profile](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Bundle-at-home-in-vitro-test).
  
    According to the Profile description, a valid Bundle MUST contain the following elements:
  
    * identifier - Persistent identifier for the bundle
    * type - fixed value code that identifies the bundle type ('message')
    * timestamp - identifies time that the bundle was assembled
    * entry:messageHeader - bundle entry and resource of type [MessageHeader](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/MessageHeader-at-home-in-vitro-test-results)
  
    While a MessageHeader entry is required for all bundles to conform, a bundle
    may contain multiple entry resources that conform to other resource profiles outlined
    in the IG.
  
    ## Entry Validation
  
    The third test in this sequence uses the FHIR Bundle
    from the first test, and validates each entry resource against its
    profile outlined in the IG. Entry types that can be validated (aside from MessageHeader) include
    the following:
  
    * [Device](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Bundle-at-home-in-vitro-test)
    * [DiagnosticSupport](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/DiagnosticReport-at-home-in-vitro-results)
    * [Observation -At-Home In-Vitro Test Result](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Observation-at-home-in-vitro-test-result)
    * [Observation -Patient Question Answer](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Observation-patient-question-answer)
    * [Patient](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Patient-at-home-in-vitro-test)
    * [Specimen](http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Specimen-at-home-in-vitro-test)
    )
    id :bundle_validator_request_group

    run_as_group(true)

    test from: :request_receive_post
    test from: :request_fhir_bundle_validation
    test from: :request_fhir_bundle_entry_validation
  end
end
