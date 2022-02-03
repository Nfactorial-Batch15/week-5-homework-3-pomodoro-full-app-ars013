//
//  HistoryViewController.swift
//  HW3
//
//  Created by Арслан on 24.01.2022.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)
        
        title = "History"
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

}
