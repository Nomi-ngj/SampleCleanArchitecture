//
//  UserListViewController.swift
//  SampleCleanArchitecture
//
//  Created by Nouman Gul Junejo on 02/05/2025.
//

import UIKit

final class UserListViewController: UIViewController {
    private let viewModel: UserListViewModel
    private let tableView = UITableView()
    private let errorLabel = UILabel()
    
    init(viewModel: UserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        view.backgroundColor = .white
        
//        setupTableView()
//        setupErrorLabel()
        
        Task {
            await viewModel.loadUsers()
            tableView.reloadData()
            if let error = viewModel.errorMessage {
                errorLabel.text = error
                errorLabel.isHidden = false
            }
        }
    }
}
