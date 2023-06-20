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
            layer.sublayers?.removeAll()
            
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
            
            let defaultLayer = CAShapeLayer()
            defaultLayer.path = circlePath.cgPath
            defaultLayer.strokeColor = R.Colors.separator.cgColor
            defaultLayer.lineWidth = 20
            defaultLayer.strokeEnd = 1
            defaultLayer.fillColor = UIColor.clear.cgColor
            defaultLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            let dotAngle = CGFloat.pi * (-7/6 + 8/6 * percent)
            let dotPoint = CGPoint(x: cos(dotAngle) * radius + center.x,
                                   y: sin(dotAngle) * radius + center.y)
            
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 8
            
            let defaultDotLayer = CAShapeLayer()
            defaultDotLayer.path = dotPath.cgPath
            defaultDotLayer.strokeColor = R.Colors.active.cgColor
            defaultDotLayer.fillColor = UIColor.clear.cgColor
            defaultDotLayer.lineCap = .round
            defaultDotLayer.lineWidth = 20
            
            // Bars
            
            let barsFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                          radius: barsRadius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            
            let startBarRadius = barsRadius - barsLayer.lineWidth * 0.5
            let endBarRadius = startBarRadius + barsLayer.lineWidth
            
            var angle: CGFloat = -7/6
            
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                
                let startBarPoint = CGPoint(x: cos(barAngle) * startBarRadius + center.x,
                                            y: sin(barAngle) * startBarRadius + center.y)
                
                let endBarPoint = CGPoint(x: cos(barAngle) * endBarRadius + center.x,
                                            y: sin(barAngle) * endBarRadius + center.y)
                
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle <= (-7/6 + 8/6 * percent) ? R.Colors.active.cgColor : R.Colors.separator.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 4
                
                
                barsLayer.addSublayer(barLayer)
                angle += 1/6
            }
            
            layer.addSublayer(defaultLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(defaultDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
