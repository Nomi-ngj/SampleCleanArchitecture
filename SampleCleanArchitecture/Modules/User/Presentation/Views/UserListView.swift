//
//  UserListView.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel: UserListViewModel

    init(viewModel: UserListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.id) { user in
                VStack(alignment: .leading) {
                    Text(user.name).font(.headline)
                    Text(user.email).font(.subheadline).foregroundColor(.gray)
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.loadUsers()
            }
            .overlay(
                Group {
                    if let error = viewModel.errorMessage {
                        Text(error).foregroundColor(.red)
                    }
                }
            )
        }
    }
}


