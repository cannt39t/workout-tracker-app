//
//  SessionViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

final class SessionViewController: BaseController {

    private let timerView = TimerView()
    private let timerDuration: Double = 3.0
    
    override func navBarLeftButton() {
        if timerView.state != .isRunning {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        timerView.state = timerView.state == .isRunning ? .isPaused : .isRunning
        setTitleForBarButton(at: .left, with: timerView.state == .isRunning ?
                             R.Strings.Navbar.Session.navBarPaused : R.Strings.Navbar.Session.navBarStart)
    }
    
    override func navBarRightButton() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForBarButton(at: .left, with: R.Strings.Navbar.Session.navBarStart)
    }
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
//            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        navigationItem.title = R.Strings.Navbar.Session.title
        
        addNavBarButton(at: .left, with: R.Strings.Navbar.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Navbar.Session.navBarFinished)
        
        timerView.configure(with: timerDuration,
                            progressInTime: 0)
    }
}
