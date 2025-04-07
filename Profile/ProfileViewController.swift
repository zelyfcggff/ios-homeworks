//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vladimir Zykov on 07.04.2025.
//

import UIKit

class ProfileViewController: UIViewController {

    private let headerView = ProfileHeaderView() 

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        view.addSubview(headerView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.bounds
    }
}

