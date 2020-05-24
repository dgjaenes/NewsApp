//
//  NewResultViewModel.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 24/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import SwiftUI

struct NewResultViewModel: Identifiable {
    var id = UUID()
    
    private let item: Article
    
    var title: String {
        return item.title
    }
    
    var description: String {
        return item.description
    }
    
    var imagePaht: String {
        return item.urlToImage
    }
    
    var image: Data? {
        return item.imageData
    }
    var url: String {
        return item.url
    }
    
    init(item: Article) {
        self.item = item
    }
}

extension NewResultViewModel: Hashable {
    static func == (lhs: NewResultViewModel, rhs: NewResultViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
