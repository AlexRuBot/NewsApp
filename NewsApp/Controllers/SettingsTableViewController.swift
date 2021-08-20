//
//  SettingsTableViewController.swift
//  NewsApp
//
//  Created by Саша Гужавин on 19.08.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    private weak var delegate: NewsTableViewControllerDelegate?
    
    @IBOutlet weak var categorySC: UISegmentedControl!
    
    @IBOutlet weak var languageSC: UISegmentedControl!
    
    var category = ""
    var country = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setSC()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        delegate?.setData(country: country, category: category)
    }

    func setSC() {
        
        switch country {
        case "ru":
            languageSC.selectedSegmentIndex = 0
        case "us":
            languageSC.selectedSegmentIndex = 1
        case "de":
            languageSC.selectedSegmentIndex = 2
        case "fr":
            languageSC.selectedSegmentIndex = 3
        case "cn":
            languageSC.selectedSegmentIndex = 4
        default:
            languageSC.selectedSegmentIndex = 0
        }
        
        switch category {
        case "business":
            categorySC.selectedSegmentIndex = 0
        case "entertainment":
            categorySC.selectedSegmentIndex = 1
        case "general":
            categorySC.selectedSegmentIndex = 2
        case "health":
            categorySC.selectedSegmentIndex = 3
        case "science":
            categorySC.selectedSegmentIndex = 4
        case "sports":
            categorySC.selectedSegmentIndex = 5
        case "technology":
            categorySC.selectedSegmentIndex = 6
        case "":
            categorySC.selectedSegmentIndex = 7
        default:
            categorySC.selectedSegmentIndex = 0
        }
        
        
    }
    
    
    @IBAction func setCategory(_ sender: UISegmentedControl) {
        switch categorySC.selectedSegmentIndex {
        case 0:
            category = "business"
        case 1:
            category = "entertainment"
        case 2:
            category = "general"
        case 3:
            category = "health"
        case 4:
            category = "science"
        case 5:
            category = "sports"
        case 6:
            category = "technology"
        case 7:
            category = ""
        default:
            category = "sports"
        }
    }
    
    @IBAction func setLanguage(_ sender: UISegmentedControl) {
        
        switch languageSC.selectedSegmentIndex {
        case 0:
            country = "ru"
        case 1:
            country = "us"
        case 2:
            country = "de"
        case 3:
            country = "fr"
        case 4:
            country = "cn"
        default:
            country = "ru"
        }
    }
    
}
