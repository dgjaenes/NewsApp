//
//  LocalRepositoryImplement.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 23/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation


class LocalRepositoryImplement: LocalRepositoryProtocol {
    
    func getValue(forKey key: String) -> [Article]{
        
        var valueresult: [Article]? = nil
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            valueresult = try? PropertyListDecoder().decode([Article].self, from: data)
            if let values = valueresult {
                return values
            } else {
                return []
            }
        } else {
            return []
        }
    }
    
    func setValue(value: [Article], forKey key: String){
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    
}
