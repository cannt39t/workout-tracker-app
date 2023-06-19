//
//  SessionViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

class SessionViewController: BaseController {

    private let timerView: BaseInfoView = {
        let base = BaseInfoView(with: "Test")
        
        return base
    }()
}

extension SessionViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.heightAnchor.constraint(equalToConstant: 368)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationItem.title = R.Strings.Navbar.Session.title
        
        addNavBarButton(at: .left, with: R.Strings.Navbar.Session.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Navbar.Session.navBarRight)
    }
}
