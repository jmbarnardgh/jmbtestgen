public struct TestAspect {

    var name: String
    var role: TestAspectRole
    var motifs: [TestMotif]
    
    init(name: String, role: TestAspectRole, motifs: [TestMotifType]) {
        self.name = name
        self.role = role
        self.motifs = [TestMotif]()
        for type in motifs {
            let motif = TestMotifFactory.motif(for: type)
            self.motifs.append(motif)
        }
    }
}