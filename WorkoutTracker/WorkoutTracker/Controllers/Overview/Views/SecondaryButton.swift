//
//  SecondaryButton.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit


final class SecondaryButton: UIButton {
    
    private let label =  UILabel()
    private let iconView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension SecondaryButton {
    
    func addViews() {
        addView(label)
        addView(iconView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func configure() {
        makeSystem(self)
        backgroundColor = Resources.Colors.secondary
        layer.cornerRadius = 14
        
        label.textAlignment = .center
        label.textColor = Resources.Colors.active
        label.font = Resources.Fonts.helvelticaRegular(with: 15)
        
        iconView.image = Resources.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resources.Colors.active
    }
}