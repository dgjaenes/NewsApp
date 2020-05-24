//
//  NewsInteractorImplement.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

class NewsInteractorImplement: NewsInteractorProtocol {
    
    var repository: NewsRemoteReporitoryProtocol
    
    init(repository: NewsRemoteReporitoryProtocol) {
        self.repository = repository
    }
    
    func getArticles() -> AnyPublisher<ResponseNewDO, NewsError> {
        return repository.getArticles()
    }
    
}
