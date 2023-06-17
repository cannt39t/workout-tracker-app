//
//  BaseView.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit


class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureView() {
        
    }
}
