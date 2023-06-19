//
//  SessionViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

class SessionViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = R.Strings.Navbar.Session.title
        
        addNavBarButton(at: .left, with: R.Strings.Navbar.Session.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Navbar.Session.navBarRight)
    }
}
