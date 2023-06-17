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

        navigationItem.title = Resources.Strings.Navbar.Progress.title
        
        addNavBarButton(at: .left, with: Resources.Strings.Navbar.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Navbar.Progress.navBarRight)
    }
}
