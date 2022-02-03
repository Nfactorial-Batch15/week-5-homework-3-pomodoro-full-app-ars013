//
//  SettingsVCViewController.swift
//  HW3
//
//  Created by Арслан on 24.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let picker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.11, green: 0.11, blue: 0.12, alpha: 1)
        
        title = "Settings"
        // Navigation Bar:
//        navigationController?.navigationBar.barTintColor = UIColor.green

        // Navigation Bar Text:
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        
        picker.center = view.center
        
//        picker.datePickerMode = .date
        
        picker.datePickerMode = .countDownTimer
//        picker.datePickerStyle = .automatic
        
        
//        picker.dataSource = self
//        picker.delegate = self
        
        self.view.addSubview(picker)
        
//        var oneYearTime = TimeInterval()
//        oneYearTime = 365 * 24 * 60 * 60
        
//        let todayDate = Date()
        
//        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
//        let twoYearFromDate = todayDate.addingTimeInterval(2 * oneYearTime)
        
//        picker.minimumDate = oneYearFromToday
//        picker.maximumDate = twoYearFromDate
        
        picker.countDownDuration = 2 * 60
        
//        picker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
        picker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker) {
        if paramDatePicker.isEqual(self.picker) {
            print("dateChange: = ", paramDatePicker.date)
        }
    }
}



//extension SettingsViewController: UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10
//    }
//}
//
//extension SettingsViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        let result = "row = \(row)"
//
//        return result
//    }
//}
