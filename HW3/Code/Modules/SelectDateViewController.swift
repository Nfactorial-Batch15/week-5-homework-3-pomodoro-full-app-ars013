//
//  SelectDateViewController.swift
//  HW3
//
//  Created by Арслан on 31.01.2022.
//

import UIKit

protocol SelectDateViewControllerDelegate: NSObjectProtocol {
    func selectDateViewController(viewController: SelectDateViewController, didSelectDate: NSDate)
}

class SelectDateViewController: UIViewController {
    
    weak var delegate: SelectDateViewControllerDelegate?
    
    var date: NSDate = NSDate() {
            didSet {
                if isViewLoaded {
                    if !date.isEqual(to: datePicker.date) {
                        datePicker.date = date as Date
                    }
                }
            }
        }
    
    var minimumDate: NSDate? {
            didSet {
                if isViewLoaded {
                    datePicker.minimumDate = minimumDate as Date?
                }
            }
        }
    
    var maximumDate: NSDate? {
            didSet {
                if isViewLoaded {
                    datePicker.maximumDate = maximumDate as Date?
                }
            }
        }
    
    var minuteInterval: Int = 5 {
            didSet {
                if isViewLoaded {
                    datePicker.minuteInterval = minuteInterval
                }
            }
        }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    

    override func viewDidLoad() {
//        super.viewDidLoad()
        title = "Settings"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        datePicker.date = date as Date
        datePicker.minimumDate = minimumDate as Date?
        datePicker.maximumDate = maximumDate as Date?
        datePicker.minuteInterval = minuteInterval
    }
    
    @IBAction func datePickerValueDidChange(sender: UIDatePicker) {
        date = datePicker.date as NSDate
        delegate?.selectDateViewController(viewController: self, didSelectDate: date)
        }

}
