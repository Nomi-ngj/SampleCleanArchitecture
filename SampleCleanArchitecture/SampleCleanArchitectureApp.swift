//
//  SampleCleanArchitectureApp.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//

import SwiftUI

@main
struct SampleCleanArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
            
            let repo = UserRemoteDataSource()
            let useCase = GetUsersUseCase(repository: repo)
            let viewModel = UserListViewModel(getUsersUseCase: useCase)
            
            //SWIFTUI
            UserListView(viewModel: viewModel)
            
            //UIKIT
//          let userListVC = UserListViewController(viewModel: viewModel)
        }
    }
}
