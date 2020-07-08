/// aggregate multiple different kinds of entities
public struct TestSuiteManifest {
    
    let entities: [TestSuiteEntity]

    public func writeTestSuite() {
        for entity in entities {
            for member in entity.members {
                for t in member.testables {
                    print(t.boundaryTestsSource)
                    print(t.quartileTestsSource)
                    print(t.membershipTestsSource)
                }
            }
        }
    }

}