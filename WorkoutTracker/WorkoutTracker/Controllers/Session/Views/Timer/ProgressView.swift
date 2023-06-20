//
//  ProgressView.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 20.06.2023.
//

import UIKit

extension TimerView {
    
    final class ProgressView: UIView {
        
        func drawProgress(with percent: CGFloat) {
            
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            
            let startAngle = -7/6 * CGFloat.pi
            let endAngle = 1/6 * CGFloat.pi
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            layer.addSublayer(circleLayer)
        }
    }
}
