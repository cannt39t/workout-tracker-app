//
//  SessionViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

final class SessionViewController: BaseController {

    private let timerView: TimerView = {
        let base = TimerView()
        
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
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationItem.title = R.Strings.Navbar.Session.title
        
        addNavBarButton(at: .left, with: R.Strings.Navbar.Session.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Navbar.Session.navBarRight)
    }
}
