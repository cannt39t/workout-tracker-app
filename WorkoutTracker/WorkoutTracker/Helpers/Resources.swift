//
//  Resources.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

enum R {
    
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let separator = UIColor(hexString: "#E8ECEF")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F1F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
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
                static let title = "Today"
                static let allWorkoutsButton = "All Workouts"
            }
            
            enum Session {
                static let title = "High Intensity Cardio"
                static let navBarStart = "Start"
                static let navBarPaused = "Pause"
                static let navBarFinished = "Finish"
            }
            
            enum Progress {
                static let title = "Workout Progress"
                static let navBarLeft = "Export"
                static let navBarRight = "Details"
            }
            
            enum Settings {
                static let title = "Settings"
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
