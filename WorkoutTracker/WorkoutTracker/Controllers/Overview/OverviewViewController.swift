//
//  OverviewViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

class OverviewViewController: BaseController {
    
    private let navBar = OverviewNavBar()
}

extension OverviewViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(navBar)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func configureAppearance() {
        navigationController?.navigationBar.isHidden = true
    }
}
