//
//  Article.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

struct Article: Codable {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    var publishedAt: String
    var content: String? = nil
    var imageData: Data? = nil
    
    init(article: ArticleDO) {
        self.source = article.source
        self.author = article.author
        self.title = article.title
        self.description = article.description
        self.url = article.url
        self.urlToImage = article.urlToImage
        self.publishedAt = article.publishedAt
        self.content = article.content
        self.imageData = getImage(pahtImg: article.urlToImage)
    }
    
    func getImage(pahtImg: String) -> Data? {
           if let url = URL(string: pahtImg) {
                   do{
                       let imageData: Data = try Data(contentsOf: url)
                       return imageData
                   }catch{
                           print("Unable to load data: \(error)")
                       return nil
                   }
           }
           return nil
       }
}
