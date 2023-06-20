//
//  WAButton.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 16.06.2023.
//

import UIKit

public enum WAButtonType {
    case primary, secondary
}


final class WAButton: UIButton {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        
        view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    private var type: WAButtonType = .primary
    
    init(with type: WAButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        addViews()
        layoutViews()
        configure()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension WAButton {
    
    func addViews() {
        setupView(label)
        setupView(iconView)
    }
    
    func layoutViews() {
        let horizontalOffset: CGFloat = {
            switch type {
                case .primary:
                    return 0
                case .secondary:
                    return 10
            }
        }()
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1.5*horizontalOffset)
        ])
    }
    
    func configure() {
        switch type {
            case .primary:
                label.textColor = R.Colors.inactive
                iconView.tintColor = R.Colors.inactive
                label.font = R.Fonts.helvelticaRegular(with: 13)
            case .secondary:
                backgroundColor = R.Colors.secondary
                layer.cornerRadius = 14
                label.textColor = R.Colors.active
                label.font = R.Fonts.helvelticaRegular(with: 15)
                iconView.tintColor = R.Colors.active
        }
        makeSystem(self)
    }
}
