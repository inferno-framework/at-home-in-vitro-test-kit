require_relative 'at_home_in_vitro/manual_entry_group/bundle_validator_manual_entry'
require_relative 'at_home_in_vitro/http_request_group/bundle_validator_request_group'
module AtHomeTestKit
  require 'inferno'
  class Suite < Inferno::TestSuite
    id :at_home_test_kit
    title 'At-Home In-Vitro Test Kit'
    description 'An Inferno Test Kit used for validating At-Home In-Vitro FHIR Bundles and their entry resources.'

    # All FHIR validation requsets will use this FHIR validator
    validator do

      url ENV.fetch('VALIDATOR_URL', 'http://validator_service:4567')

      exclude_message do |message|
        (message.type == 'warning' &&
        message.message.match?(/Global Profile reference .* could not be resolved, so has not been checked/)) || 
        (message.type == 'info' && message.message.match?(/.* This element does not match any known slice defined in the profile .*/))
      end
      
    end

    resume_test_route :post, '/bundle' do |request|
      request.query_parameters["id"]
    end

    group from: :bundle_validator_request_group
    group from: :bundle_validator_manual_entry
  end
end
