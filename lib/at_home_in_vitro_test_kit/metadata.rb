require_relative 'version'

module AtHomeInVitroTestKit
  class Metadata < Inferno::TestKit
    id :at_home_in_vitro_test_kit
    title 'At-Home In-Vitro Test Kit'
    suite_ids ['at_home_test_kit']
    tags []
    last_updated ::AtHomeInVitroTestKit::LAST_UPDATED
    version ::AtHomeInVitroTestKit::VERSION
    maturity 'Medium'
    authors ['Inferno Team']
    repo 'https://github.com/inferno-framework/at-home-in-vitro-test-kit'
    description <<~DESCRIPTION
      The At-Home In-Vitro Test Kit provides a comprehensive set of tests for validating
      FHIR resources against the [At-Home In-Vitro Test Implementation Guide v1.0.0](https://hl7.org/fhir/us/home-lab-report/STU1/).
      This test kit supports both manual input validation and automated HTTP POST request validation
      of At-Home In-Vitro FHIR Bundles and their entry resources.
  
      <!-- break -->

      This test kit is
      [open source](https://github.com/inferno-framework/at-home-in-vitro-test-kit#license)
      and freely available for use or adoption by the health IT community
      including EHR vendors, health app developers, and testing labs. It is
      built using the
      [Inferno Framework](https://inferno-framework.github.io/).
      The Inferno Framework is designed for reuse and aims to make it easier
      to build test kits for any FHIR-based data exchange.

      ## Status
  
      The At-Home In-Vitro Test Kit provides two primary testing pathways:
      
      1. Manual Entry Testing - Allows direct input of FHIR Bundles for validation
      2. HTTP Request Testing - Validates FHIR Bundles received via POST requests
      
      Both pathways perform comprehensive validation including:
      
      - Bundle Structure Validation - Verifies the Bundle conforms to the At-Home In-Vitro Bundle profile
      - Required Elements Validation - Checks for mandatory elements like identifier, type, timestamp, and MessageHeader
      - Entry Resource Validation - Validates each resource entry against its respective profile:
        * MessageHeader
        * Device
        * DiagnosticReport
        * Observation (Test Result and Patient Question Answer)
        * Patient
        * Specimen
      
      The test kit ensures that resources conform to the profiles defined in the
      implementation guide, including structure, required elements, value sets,
      and relationships between resources.

      ## Repository
  
      The At-Home In-Vitro Test Kit GitHub repository can be
      [found here](https://github.com/inferno-framework/at-home-in-vitro-test-kit).

      ## Providing Feedback and Reporting Issues
  
      We welcome feedback on the tests, including but not limited to the following areas:
  
      - Validation logic, such as potential bugs, lax checks, and unexpected failures.
      - Requirements coverage, such as requirements that have been missed, tests that
        necessitate features that the IG does not require, or other issues with the
        interpretation of the IG’s requirements.
      - User experience, such as confusing or missing information in the test UI.
  
      Please report any issues with this set of tests in the
      [issues section](https://github.com/inferno-framework/at-home-in-vitro-test-kit/issues)
      of the repository.
    DESCRIPTION
  end
end
