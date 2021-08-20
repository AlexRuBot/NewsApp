//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Саша Гужавин on 19.08.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var contextTV: UITextView!
    
    
    var titleL: String?
    var context: String?
    var image: UIImage?
    var urlLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNews.image = image
        contextTV.text = context
        titleLable.text = titleL
        
    }
 
    @IBAction func getToWeb(_ sender: UIBarButtonItem) {
        
        guard let url = URL(string: urlLink!) else { return }
        UIApplication.shared.open(url)
    }
    
}
