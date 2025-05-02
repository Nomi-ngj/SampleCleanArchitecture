//
//  UserRepository.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


// MARK: - Domain/Repositories/UserRepository.swift
protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
