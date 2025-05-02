//
//  UserRepository.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//

protocol UserRepository {
    func fetchUsers() async throws -> [User]
}
