//
//  OverviewNavBar.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Navbar.Overview.title
        label.textColor = R.Colors.titleGray
        label.font = R.Fonts.helvelticaRegular(with: 22)
        return label
    }()
    
    private let allWorkoutsButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(R.Strings.Navbar.Overview.allWorkoutsButton)
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(R.Images.Common.add, for: .normal)
        return button
    }()

    private let weekdayView = WeekView()
    
    func allWorkoutsButtonAction(_ action: Selector, _ target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func addButtonAction(_ action: Selector, _ target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addBottomBorder(with: R.Colors.separator, height: 1)
    }
}

extension OverviewNavBar {
    
    override func setupViews() {
        super.setupViews()
        setupView(allWorkoutsButton)
        setupView(addButton)
        setupView(titleLabel)
        setupView(weekdayView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
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
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .white
    }
}
