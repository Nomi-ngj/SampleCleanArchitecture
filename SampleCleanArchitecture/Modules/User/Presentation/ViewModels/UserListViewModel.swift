//
//  UserListViewModel.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//


// MARK: - Presentation/ViewModels/UserListViewModel.swift
import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var errorMessage: String?
    
    private let getUsersUseCase: GetUsersUseCase

    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }

    func loadUsers() async {
        do {
            users = try await getUsersUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
