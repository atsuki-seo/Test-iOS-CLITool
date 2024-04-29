// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

@main
struct TestCLITool: ParsableCommand {
  mutating func run() throws {
    let source = SourceFileSyntax {
      DeclSyntax("import Foundation")
      for i in 0...100 {
        ClassDeclSyntax(name: "SampleModel") {
          DeclSyntax(#"private let title: String = "Hello""#)
        }
      }
    }

    let string = source.formatted().description
    print(string)
  }
}
