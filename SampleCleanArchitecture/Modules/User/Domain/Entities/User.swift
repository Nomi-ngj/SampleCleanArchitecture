//
//  User.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


// MARK: - Domain/Entities/User.swift
struct User: Decodable, Equatable {
    let id: Int
    let name: String
    let email: String
}
