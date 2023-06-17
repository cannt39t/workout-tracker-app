//
//  Resources.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

enum Resources {
    
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
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
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
            static var overview = UIImage(named: "overview_tab")
            static var session = UIImage(named: "session_tab")
            static var progress = UIImage(named: "progress_tab")
            static var settings = UIImage(named: "settings_tab")
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
