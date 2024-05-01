require_relative 'at_home_in_vitro_test_kit/manual_entry_group/bundle_validator_manual_entry'
require_relative 'at_home_in_vitro_test_kit/http_request_group/bundle_validator_request_group'
module AtHomeInVitroTestKit
  require 'inferno'
  class Suite < Inferno::TestSuite
    id :at_home_test_kit
    title 'At-Home In-Vitro Test Kit'
    description 'An Inferno Test Kit used for validating At-Home In-Vitro FHIR Bundles and their entry resources.'

    # All FHIR validation requsets will use this FHIR validator
    fhir_resource_validator do
      url ENV.fetch('FHIR_RESOURCE_VALIDATOR_URL', 'http://hl7_validator_service:3500')

      igs 'hl7.fhir.us.home-lab-report#1.0.0'

      exclude_message do |message|
        message.message.match?(/\A\S+: \S+: URL value '.*' does not resolve/) ||
        (message.type == 'warning' &&
        message.message.match?(/Global Profile reference .* could not be resolved, so has not been checked/)) || 
        (message.type == 'info' && message.message.match?(/.* This element does not match any known slice defined in the profile .*/))
      end
      
    end

    resume_test_route :post, '/bundle' do |request|
      request.query_parameters["id"]
    end

    links [
      {
        label: 'Report Issue',
        url: 'https://github.com/inferno-framework/at-home-in-vitro-test-kit/issues'
      },
      {
        label: 'Open Source',
        url: 'https://github.com/inferno-framework/at-home-in-vitro-test-kit/'
      },
      {
        label: 'At-Home In-Vitro Test Report IG',
        url: 'http://hl7.org/fhir/us/home-lab-report/STU1/'
      }
    ]

    group from: :bundle_validator_request_group
    group from: :bundle_validator_manual_entry
  end
end
