public struct TestTemplate {

  var testableStrings: [String] = []
  var testableInts: [Int] = []
  var testableDoubles: [Double] = []

  init(doubles: [Double]) {
      testableDoubles = doubles
  }

  init(strings: [String]) {
      testableStrings = strings
  }

  init(integers: [Int]) {
      testableInts = integers
  }

  var boundaryTestsSource: [String] {
      return []
  }

  var quartileTestsSource: [String] {
      return []

  }

  var membershipTestsSource: [String] {
      return []
  }

}