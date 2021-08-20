//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Саша Гужавин on 19.08.2021.
//

import Foundation

let apiKey = "56f54e41dada41698e4a5fce37aa4b0b"

class NetworkManager {
    
    var onCompletion: ((News) -> Void)?
    
    func fetchNews(country: String, category: String) {
        let urlString = "https://newsapi.org/v2/top-headlines?category=\(category)&country=\(country)&apiKey=\(apiKey)"
        performRequest(withURLString: urlString)
    }
    
    private func performRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let news = self.parseJSON(withData: data) {
                    self.onCompletion?(news)
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(withData data: Data) -> News? {
        let decoder = JSONDecoder()
        do {
            let news = try decoder.decode(News.self, from: data) as News
            print("данные получены и декодированы")
            return news
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    
  
    
    
}
