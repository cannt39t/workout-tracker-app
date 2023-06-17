//
//  WeekDayView.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 17.06.2023.
//

import UIKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configureWith(with index: Int, and name: String) {
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.addForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background
            nameLabel.textColor = isToday ? .white : Resources.Colors.inactive
            dateLabel.textColor = isToday ? .white : Resources.Colors.inactive
            
            nameLabel.text = name
            dateLabel.text = "\(day)"
        }
    }
}

extension WeekView.WeekDayView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func configureView() {
        super.configureView()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = Resources.Fonts.helvelticaRegular(with: 9)
        
        dateLabel.font = Resources.Fonts.helvelticaRegular(with: 15)
        
        stackView.spacing = 3
        stackView.axis = .vertical
        stackView.alignment = .center
    }
}



