//
//  ResponseNewDO.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

// MARK: - ResponseNew
struct ResponseNewDO: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDO]
}
