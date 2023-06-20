//
//  BaseController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

enum NavBarPosition {
    case left, right
}


class BaseController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension BaseController {
    
    func setupViews() {
        
    }
    
    func constraintViews() {
        
    }
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.background
    }
    
    @objc func navBarLeftButton() {
        
    }
    
    @objc func navBarRightButton() {
        
    }
}

extension BaseController {
    
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helvelticaRegular(with: 17)
        
        switch position {
            case .left:
                button.addTarget(self, action: #selector(navBarLeftButton), for: .touchUpInside)
                navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            case .right:
                button.addTarget(self, action: #selector(navBarRightButton), for: .touchUpInside)
                navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForBarButton(at position: NavBarPosition, with title: String) {
        switch position {
            case .left:
                let button = navigationItem.leftBarButtonItem?.customView as! UIButton
                button.setTitle(title, for: .normal)
            case .right:
                let button = navigationItem.rightBarButtonItem?.customView as! UIButton
                button.setTitle(title, for: .normal)
        }
        navigationItem.leftBarButtonItem?.customView?.layoutSubviews()
    }
}
