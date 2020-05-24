//
//  ArticleDO.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

// MARK: - Article
struct ArticleDO: Codable {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    var content: String? = nil
    var imageData: Data? = nil
}

// MARK: - Source
struct Source: Codable {
    let name: String
}
