//
//  TimerView.swift
//  WorkoutTracker
//
//  Created by Илья Казначеев on 20.06.2023.
//

import UIKit

enum TimerState {
    case isRunning, isPaused, isStopped
}

final class TimerView: WABaseInfoView {
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double = 0.0
    
    public var state: TimerState = .isStopped
    
    func configure(with duration: Double, progressInTime: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progressInTime > duration ? duration : progressInTime
        
        let goalValueDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDivider
        
        progressView.drawProgress(with: percent)
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progressInTime: self.timerProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else {
            return
        }
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= 0.05
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progressInTime: self.timerProgress)
        })
    }
}

extension TimerView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(progressView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        

    }
}
