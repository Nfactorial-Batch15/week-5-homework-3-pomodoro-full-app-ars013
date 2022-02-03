//
//  ViewController.swift
//  HW3
//
//  Created by Арслан on 24.01.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let wallpaperImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BG")
        return image
    }()
    
    private let shapeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Base")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 44)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Focus on your task"
//        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playB = UIButton()
    
    private func configureButton() {
        playB.configuration = .gray()
        playB.configuration?.baseBackgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        playB.configuration?.image = UIImage(named: "play")
        playB.configuration?.cornerStyle = .capsule
        
        view.addSubview(playB)
        playB.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(530)
            make.leading.equalToSuperview().offset(100)
            make.size.equalTo(56)
        }
        
        playB.addTarget(self, action: #selector(playBTapped), for: .touchUpInside)
    }
    
    var timer = Timer()
    let shapeLayer = CAShapeLayer()
    var durationTimer = 10
//    var durationTimer = SettingsViewController.datePickerChange(SettingsViewController)
    
    @objc private func playBTapped() {
        basicAnimation()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc private func stopBTapped() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction2), userInfo: nil, repeats: true)
        timer.invalidate()
        durationTimer = 10
        timerLabel.text = "\(durationTimer)"
    }
    
    @objc private func pauseBTapped() {
        timer.invalidate()
    }
    
    @objc private func timerAction2() {
//        durationTimer -= 1
        timerLabel.text = "\(durationTimer)"
        print(durationTimer)
        
//        if stopBTapped().timer == true {
//            timer.invalidate()
//        }
        
        if durationTimer > 0 {
            timer.invalidate()
        }
    }
    
    @objc private func timerAction() {
        durationTimer -= 1
        timerLabel.text = "\(durationTimer)"
        print(durationTimer)
        
        if durationTimer == 0 {
            timer.invalidate()
//            durationTimer = 10
//            timerLabel.text = "\(durationTimer)"
        }
    }
    
    private let pauseB = UIButton()
    
    private func configureButton2() {
        pauseB.configuration = .gray()
        pauseB.configuration?.baseBackgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        pauseB.configuration?.image = UIImage(named: "pause")
        pauseB.configuration?.cornerStyle = .capsule
        
        view.addSubview(pauseB)
        pauseB.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(630)
            make.leading.equalToSuperview().offset(100)
            make.size.equalTo(56)
        }
        
        pauseB.addTarget(self, action: #selector(pauseBTapped), for: .touchUpInside)
    }
    
    private let stopB = UIButton()
    
    private func configureButton3() {
        stopB.configuration = .gray()
        stopB.configuration?.baseBackgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
        stopB.configuration?.image = UIImage(named: "stop")
        stopB.configuration?.cornerStyle = .capsule
        
        view.addSubview(stopB)
        stopB.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(530)
            make.trailing.equalToSuperview().offset(-100)
            make.size.equalTo(56)
        }
        
        stopB.addTarget(self, action: #selector(stopBTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        title = "Main"
        
//        playB.addTarget(self, action: #selector(playBTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    private func setUI() {
        view.addSubview(wallpaperImage)
        wallpaperImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(shapeView)
        shapeView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(210)
            make.centerX.equalToSuperview()
            make.size.equalTo(248)
        }
        
        view.addSubview(timerLabel)
        timerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(270)
            make.centerX.equalToSuperview()
        }
        timerLabel.text = "\(durationTimer)"
        
        view.addSubview(textLabel)
        textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(330)
            make.centerX.equalToSuperview()
        }
        
        configureButton()
        configureButton2()
        configureButton3()
        
    }
    
    // MARK: Animation
    
    func animationCircular() {
        
        let center = CGPoint(x: shapeView.frame.width / 2, y: shapeView.frame.height / 2)
        
        let endAngle = (-CGFloat.pi / 2)
        let startAngle = 2 * CGFloat.pi + endAngle
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 120, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 6
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        shapeView.layer.addSublayer(shapeLayer)
    }
    
    
    func basicAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(durationTimer)
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}

