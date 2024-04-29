// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import ArgumentParser
import SwiftSyntax
import SwiftSyntaxBuilder

@main
struct TestCLITool: ParsableCommand {
    mutating func run() throws {
        let source = SourceFileSyntax {
            DeclSyntax("import Foundation")
            ClassDeclSyntax(name: "SampleModel") {
                DeclSyntax(#"private let title: String = "Hello""#)
            }
        }

        let string = source.formatted().description
        print(string)
    }
}