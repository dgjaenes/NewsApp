//
//  LocalRepositoryProtocol.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

protocol LocalRepositoryProtocol {
    func getValue(forKey key: String) -> [Article]
    func setValue(value: [Article], forKey key: String)
}
