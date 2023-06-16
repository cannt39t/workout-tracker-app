//
//  TabBarViewController.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

enum Tabs: Int {
    case overview, session, progress, settings
}

final class TabBarViewController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewViewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        let settingsController = SettingsViewController()
        
        let overviewNavigationController = NavBarController(rootViewController: overviewController)
        let sessionNavigationController = NavBarController(rootViewController: sessionController)
        let progressNavigationController = NavBarController(rootViewController: progressController)
        let settingsNavigationController = NavBarController(rootViewController: settingsController)
        
        overviewNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.Tabbar.overview,
                                                     image: Resources.Images.Tabbar.overview,
                                                     tag: Tabs.overview.rawValue)
        sessionNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.Tabbar.session,
                                                     image: Resources.Images.Tabbar.session,
                                                     tag: Tabs.session.rawValue)
        progressNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.Tabbar.progress,
                                                     image: Resources.Images.Tabbar.progress,
                                                     tag: Tabs.progress.rawValue)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.Tabbar.settings,
                                                     image: Resources.Images.Tabbar.settings,
                                                     tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
        ], animated: false)
    }
}
