//
//  NewsRemoteReporitoryImplment.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

class NewsRemoteReporitoryImplment: ManagerRemoteRepository, NewsRemoteReporitoryProtocol {
    
    struct NewsAPI {
        static let scheme = "https"
        static let host = "newsapi.org"
        static let path = "/v2/top-headlines"
    }
    
    func getArticles() -> AnyPublisher<ResponseNewDO, NewsError> {
        return execute(components: makeArticlesUrltComponents())
    }
    
    func makeArticlesUrltComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = NewsAPI.scheme
        components.host = NewsAPI.host
        components.path = NewsAPI.path
        
        components.queryItems = [
                                 URLQueryItem(name: "apiKey", value: "be5315079dda4a0f985b848360ef800d"),
                                 URLQueryItem(name: "sortBy", value: "latest"),
                                 URLQueryItem(name: "sources", value: "bbc-news")]
        
        return components
    }
}
