//
//  GetUsersUseCase.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


// MARK: - Domain/UseCases/GetUsersUseCase.swift
final class GetUsersUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> [User] {
        return try await repository.fetchUsers()
    }
}
