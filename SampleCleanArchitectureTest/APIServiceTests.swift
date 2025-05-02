//
//  APIServiceTests.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


// MARK: - Tests/DataTests/APIServiceTests.swift
import XCTest
@testable import SampleCleanArchitecture

final class APIServiceTests: XCTestCase {
    func testRequest_DecodesUsers() async throws {
        let service = DefaultAPIService()
        let users: [User] = try await service.request(endpoint: "https://jsonplaceholder.typicode.com/users")

        XCTAssertFalse(users.isEmpty)
        XCTAssertNotNil(users.first?.name)
    }
}
