//
//  UserRemoteDataSource.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


// MARK: - Data/Remote/UserRemoteDataSource.swift
final class UserRemoteDataSource: UserRepository {
    private let apiService: APIService
    private let baseURL = "https://jsonplaceholder.typicode.com/users"

    init(apiService: APIService = DefaultAPIService()) {
        self.apiService = apiService
    }

    func fetchUsers() async throws -> [User] {
        return try await apiService.request(endpoint: baseURL)
    }
}
