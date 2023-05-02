
module AtHomeTestKit
    module FhirBundleValidator
        def validate_bundle(resource)

            assert_resource_type(:bundle, resource: resource)
            assert_valid_resource(resource: resource, profile_url: 'http://hl7.org/fhir/us/home-lab-report/StructureDefinition/Bundle-at-home-in-vitro-test')
        end

        def validate_bundle_entries(resource)
            assert_valid_bundle_entries(bundle: resource, resource_types: {})
        end
    end
end