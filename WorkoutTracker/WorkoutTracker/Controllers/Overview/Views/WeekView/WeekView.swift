//
//  WeekView.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 17.06.2023.
//

import UIKit

final class WeekView: BaseView {
    
    private var stackView = UIStackView()
}

extension WeekView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        var weekdays = Date.calendar.shortStandaloneWeekdaySymbols
        
        if Date.calendar.firstWeekday == 2 {
            let sun = weekdays.remove(at: 0)
            weekdays.append(sun)
        }
        
        weekdays.enumerated().forEach { index, val in
            let view = WeekDayView()
            view.configureWith(with: index, and: val.uppercased())
            stackView.addArrangedSubview(view)
        }
    }
}
