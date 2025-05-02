//
//  APIService.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//

import Foundation

protocol APIService {
    func request<T: Decodable>(endpoint: String) async throws -> T
}

final class DefaultAPIService: APIService {
    func request<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
