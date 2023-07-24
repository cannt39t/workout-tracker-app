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
    
    private let elapaedTimeLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 14)
        label.text = R.Strings.Session.elapsedTime
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapaedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "02:15"
        label.font = R.Fonts.helvelticaRegular(with: 46)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 13)
        label.text = R.Strings.Session.remainingTime
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingValueTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:45"
        label.font = R.Fonts.helvelticaRegular(with: 13)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double = 0.0
    
    var state: TimerState = .isStopped
    
    func configure(with duration: Double, progressInTime: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progressInTime > duration ? duration : progressInTime
        let goalValueDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDivider
        
        elapaedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remainingValueTimeLabel.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        
        progressView.drawProgress(with: percent)
    }
    
    func startTimer(completion: @escaping () -> Void) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.timerProgress += 0.01
            
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                completion()
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
        
        [
            elapaedTimeLabel,
            elapaedTimeValueLabel,
            remainingTimeLabel,
            remainingValueTimeLabel
        ].forEach {
            timerStackView.addArrangedSubview($0)
        }
        setupView(timerStackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        
    }
}


private extension TimerView {
    
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = value / 60 % 60
        let hours = value / 3600
        
        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutesStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0 ?
            [minutesStr, secondsStr].joined(separator: ":") :
            [hoursStr, minutesStr, secondsStr].joined(separator: ":")
    }
}
