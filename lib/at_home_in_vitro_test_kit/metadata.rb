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
      The At-Home In-Vitro Test Kit provides an executable set of tests for the
      [At-Home In-Vitro Test Implementation Guide v1.0.0](https://hl7.org/fhir/us/home-lab-report/STU1/).
      This test kit validates At-Home In-Vitro FHIR Bundles and their entry
      resources.
  
      <!-- break -->

      This test kit is
      [open source](https://github.com/inferno-framework/at-home-in-vitro-test-kit#license)
      and freely available for use or adoption by the health IT community
      including EHR vendors, health app developers, and testing labs. It is
      built using the
      [Inferno Framework]().
      The Inferno Framework is designed for reuse and aims to make it easier
      to build test kits for any FHIR-based data exchange.

      ## Status
  
      The At-Home In-Vitro tests verify that an At-Home In-Vitro FHIR Bundle
      and its entries, constructed either manually or by a digital testing
      application, conform to the resource profiles as defined in the
      implementation guide.
  
      The test kit currently tests the following requirements:
  
      - FHIR Bundle POST Request Verification
      - FHIR Bundle Validation
      - Entry Validation
  
      See the test descriptions within the test kit for detail on the specific
      validations performed as part of testing these requirements.

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
