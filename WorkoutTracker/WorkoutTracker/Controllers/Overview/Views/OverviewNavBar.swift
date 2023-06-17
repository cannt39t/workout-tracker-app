//
//  OverviewNavBar.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let allWorkoutsButton = SecondaryButton()
    private let addButton = UIButton()
    private let titleLabel = UILabel()
    
    private let weekdayView = WeekView()
    
    func allWorkoutsButtonAction(_ action: Selector, _ target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addButtonAction(_ action: Selector, _ target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
}

extension OverviewNavBar {
    
    override func addViews() {
        super.addViews()
        addView(allWorkoutsButton)
        addView(addButton)
        addView(titleLabel)
        addView(weekdayView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            allWorkoutsButton.bottomAnchor.constraint(equalTo: addButton.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            weekdayView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekdayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekdayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekdayView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekdayView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureView() {
        super.configureView()
        
        backgroundColor = .white
        
        addButton.setImage(Resources.Images.Common.add, for: .normal)
        
        titleLabel.text = Resources.Strings.Navbar.Overview.title
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Fonts.helvelticaRegular(with: 22)
        
        allWorkoutsButton.setTitle(Resources.Strings.Navbar.Overview.allWorkoutsButton)
    }
}
