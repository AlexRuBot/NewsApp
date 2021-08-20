//
//  News.swift
//  NewsApp
//
//  Created by Саша Гужавин on 19.08.2021.
//

import Foundation
struct News: Codable {
    var articles: [New]
}

struct New: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}
