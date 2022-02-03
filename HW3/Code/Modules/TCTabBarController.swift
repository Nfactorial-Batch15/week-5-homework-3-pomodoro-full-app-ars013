//
//  TabBarViewController.swift
//  HW3
//
//  Created by Арслан on 25.01.2022.
//

import UIKit
import SnapKit

class TCTabBarController: UIViewController {
    
    
    private let wallpaperImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BG")
        return image
    }()
    
    private let button: UIButton = {
        let but = UIButton()
        but.setTitle("Let's start focus time", for: .normal)
        but.setTitleColor(.black, for: .normal)
        but.backgroundColor = .white
        but.layer.cornerRadius = 16
        return but
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton() {
        let tabBarVC = UITabBarController()
        let vc1 = MainViewController()
        let vc2 = UINavigationController(rootViewController: SettingsViewController())
//        let vc2 = UINavigationController(rootViewController: SelectDateViewController())
        let vc3 = UINavigationController(rootViewController: HistoryViewController())
        


        
        
        vc1.title = "Main"
        vc2.title = "Settings"
        vc3.title = "History"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["house.circle.fill", "gear", "doc"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        
        
        
        present(tabBarVC, animated: true)
    }
    
    private func setUI() {
        view.addSubview(wallpaperImage)
        wallpaperImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(58)
        }
        
    }
    

}
