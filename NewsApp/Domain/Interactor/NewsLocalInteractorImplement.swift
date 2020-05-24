//
//  NewsLocalInteractorImplement.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation

class NewsLocalInteractorImplement: NewsLocalInteractorProtocol {
    
    let keyNews = "keyNews"
    
    let repository : LocalRepositoryProtocol
    
    init(repository : LocalRepositoryProtocol) {
        self.repository = repository
    }
    func getValuesNews() -> [Article] {
        let values = repository.getValue(forKey: keyNews)
        return values
    }
    
    func setValuesNews(values: [Article]) {
        repository.setValue(value: values, forKey: keyNews)
    }
}
