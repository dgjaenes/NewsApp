//
//  GeneralRouting.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 24/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import Foundation
import SwiftUI

struct GeneralRouting {
    static func getInitView() -> SearchNewsView {
        FeaturesProvider.buildDefaultView()
    }
    
    static func getDetailView(viewModel: NewResultViewModel) -> NewDetailView {
        FeaturesProvider.builNewDetailView(viewModel: viewModel)
    }
}
