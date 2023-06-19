//
//  Resources.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

enum R {
    
    enum Colors {
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var separator = UIColor(hexString: "#E8ECEF")
        static var background = UIColor(hexString: "#F8F9F9")
        static var secondary = UIColor(hexString: "#F1F3FF")
        
        static var titleGray = UIColor(hexString: "#545C77")
    }
    
    enum Strings {
        enum Tabbar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                    case .overview: return "Overview"
                    case .session: return "Session"
                    case .progress: return "Progress"
                    case .settings: return "Settings"
                }
            }
        }
        
        enum Navbar {
            enum Overview {
                static var title = "Today"
                static let allWorkoutsButton = "All Workouts"
            }
            
            enum Session {
                static var title = "High Intensity Cardio"
                static var navBarLeft = "Pause"
                static var navBarRight = "Finish"
            }
            
            enum Progress {
                static var title = "Workout Progress"
                static var navBarLeft = "Export"
                static var navBarRight = "Details"
            }
            
            enum Settings {
                static var title = "Settings"
            }
        }
    }
    
    enum Images {
        enum Tabbar {
            static func icon(for tab: Tabs) -> UIImage {
                switch tab {
                    case .overview: return UIImage(named: "overview_tab")!
                    case .session: return UIImage(named: "session_tab")!
                    case .progress: return UIImage(named: "progress_tab")!
                    case .settings: return UIImage(named: "settings_tab")!
                }
            }
        }
        
        enum Common {
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
        }
    }
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
