import Foundation

public struct SourceCodeWriter {

    public static func write(contents str: String, to fileAtPath: String) {
        try! str.write(toFile: fileAtPath, atomically: true, encoding: .utf8)
    }
}