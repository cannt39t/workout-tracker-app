//
//  OverviewViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

class OverviewViewController: BaseController {
    
    
    private let navBar = OverviewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        NSLayoutConstraint.activate([
            
        ])
    }
}

extension OverviewViewController {
    
    override func addViews() {
        super.addViews()
        
        view.addView(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func configure() {
        navigationController?.navigationBar.isHidden = true
    }
}
