//
//  ProgressViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

class ProgressViewController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = R.Strings.Navbar.Progress.title
        
        addNavBarButton(at: .left, with: R.Strings.Navbar.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Navbar.Progress.navBarRight)
    }
}
