//
//  XCTests+JSON.swift
//  InPost Interview Coding TaskTests
//
//  Created by David Silva on 14/10/2023.
//

import Foundation
import XCTest

extension XCTestCase {

    public enum TestError: Error {

        case unableToCast(object: String, into: String)
        case fileNotFound(fileName: String)
        case unableToEncoding(object: String, into: String)
    }

    public func loadJSON<T: Any>(from fileName: String) throws -> T {

        guard let filePath = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json") else {

            throw TestError.fileNotFound(fileName: fileName)
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)

        guard let object = json as? T else {

            throw TestError.unableToCast(object: String(describing: json.self), into: String(describing: T.self))
        }

        return object
    }

    public func load<T: Decodable>(from fileName: String) throws -> T {

        let file = try self.loadJSON(from: fileName) as Any
        let data = try JSONSerialization.data(withJSONObject: file, options: [.prettyPrinted])

        return try JSONDecoder().decode(T.self, from: data)
    }
}
