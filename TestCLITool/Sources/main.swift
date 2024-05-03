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
      ImportDeclSyntax(
        path: ImportPathComponentListSyntax([ImportPathComponentSyntax(name: "Foundation")])
      )
      ClassDeclSyntax(
        modifiers: [
          DeclModifierSyntax(name: .atSignToken(leadingTrivia: .newlines(2), trailingTrivia: .unexpectedText("objcMembers").appending(.newline), presence: .present)),
          DeclModifierSyntax(name: .keyword(.public)),
        ],
        name: "SampleModel"
      ) {
        VariableDeclSyntax(
          modifiers: [DeclModifierSyntax(name: .keyword(.private))],
          bindingSpecifier: .keyword(.let)
        ) {
          PatternBindingSyntax(
            pattern: PatternSyntax("title"),
            typeAnnotation: TypeAnnotationSyntax(type: TypeSyntax("String")),
            initializer: InitializerClauseSyntax(value: StringLiteralExprSyntax(content: "Hello"))
          )
        }
      }
    }

    let string = source.formatted().description
    print(string)
  }
}
