//
//  GetUsersUseCaseTests.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


import XCTest
@testable import SampleCleanArchitecture

// MARK: - Tests/DomainTests/GetUsersUseCaseTests.swift
final class GetUsersUseCaseTests: XCTestCase {
    class MockUserRepository: UserRepository {
        var usersToReturn: [User] = []
        func fetchUsers() async throws -> [User] {
            return usersToReturn
        }
    }
    
//    class FailingUserRepository: UserRepository {
//        func fetchUsers() async throws -> [User] {
//            throw URLError(.notConnectedToInternet)
//        }
//    }

    func testExecute_ReturnsUsers() async throws {
        let mockRepo = MockUserRepository()
        mockRepo.usersToReturn = [User(id: 1, name: "John", email: "john@example.com")]
        let useCase = GetUsersUseCase(repository: mockRepo)

        let result = try await useCase.execute()

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "John")
    }
}

final class UserListViewModelTests: XCTestCase {
    class FailingUserRepository: UserRepository {
        func fetchUsers() async throws -> [User] {
            throw URLError(.notConnectedToInternet)
        }
    }

    func testLoadUsers_SetsErrorMessageOnFailure() async throws {
        
        let mockRepo = FailingUserRepository()
        let useCase = GetUsersUseCase(repository: mockRepo)
        let viewModel = await UserListViewModel(getUsersUseCase: useCase)

        await viewModel.loadUsers()

        await MainActor.run {
            XCTAssertNotNil(viewModel.errorMessage)
        }
    }
}
