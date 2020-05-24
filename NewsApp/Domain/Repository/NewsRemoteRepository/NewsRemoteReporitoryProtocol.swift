//
//  NewsRemoteReporitoryProtocol.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import Combine

protocol NewsRemoteReporitoryProtocol {
    func getArticles() -> AnyPublisher<ResponseNewDO, NewsError>
}
