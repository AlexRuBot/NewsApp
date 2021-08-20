//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Саша Гужавин on 19.08.2021.
//

import UIKit

protocol NewsTableViewControllerDelegate: class {
    func setData(country: String, category: String)
}

class NewsTableViewController: UITableViewController, NewsTableViewControllerDelegate {

    var startCategory = "general"
    var startCountry = "ru"
    private var arrayNews: [New] = []
    
    private var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
   private func updateData() {
        networkManager.fetchNews(country: startCountry, category: startCategory)
        networkManager.onCompletion = { [weak self] news in
            guard let self = self else { return }
            self.arrayNews += news.articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setData(country: String, category: String) {
        print("передал")
        startCountry = country
        startCategory = category
        arrayNews = []
        tableView.reloadData()
        updateData()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrayNews.count == 0{
            return 1
        }
        return arrayNews.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        if arrayNews.count == 0 {
            cell.titileLable.text = ""
            cell.descriptionLable.text = ""
            cell.spinner.isHidden = false
            cell.spinner.startAnimating()
            return cell
        }else{
        cell.spinner.stopAnimating()
        cell.spinner.isHidden = true
        cell.titileLable.text = arrayNews[indexPath.row].title
        cell.descriptionLable.text = arrayNews[indexPath.row].description
        
        return cell
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "settingSegue":
            guard let settingsVC = segue.destination as? SettingsTableViewController else { return }
            settingsVC.category = startCategory
            settingsVC.country = startCountry
            settingsVC.delegate = self
            
        case "detailSegue":
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let detailVC = segue.destination as! DetailViewController
            detailVC.titleL = arrayNews[indexPath.row].title
            detailVC.context = arrayNews[indexPath.row].content
            detailVC.urlLink = arrayNews[indexPath.row].url
            detailVC.navigationItem.title = arrayNews[indexPath.row].source?.name
            guard let url = URL(string: arrayNews[indexPath.row].urlToImage ?? "") else { return }
            if let data = try? Data(contentsOf: url ) {
                detailVC.image = UIImage(data: data)
                }

        default:
            let error = NSError()
            print(error.localizedDescription)
        }
    }
}
