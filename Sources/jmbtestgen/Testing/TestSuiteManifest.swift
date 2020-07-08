/// aggregate multiple different kinds of entities
public struct TestSuiteManifest {
    
    let entities: [TestSuiteEntity]

    public func writeTestSuite() {
        for entity in entities {
            for member in entity.members {
                for template in member.testTemplates {
                    print(template.boundaryTestsSource)
                    print(template.quartileTestsSource)
                    print(template.membershipTestsSource)
                }
            }
        }
    }

}