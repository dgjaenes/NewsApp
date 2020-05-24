//
//  NewResultRow.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 24/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct NewResultRow: View {
    
    var index: Int?
    let viewModel: NewResultViewModel
    
    init(viewModel: NewResultViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            VStack {
                if (viewModel.image != nil ) {
                    Image(uiImage: UIImage(data: viewModel.image!)!)
                        .resizable()
                        .frame(width: 90, height: 80)
                        .scaledToFit()
                        .cornerRadius(6)
                        .shadow(radius: 7)
                } else {
                    Text("Not Image")
                }
            }
            Spacer()
            VStack(alignment: .center) {
                Text(viewModel.title)
                    .font(.title)
                Spacer()
                Text(viewModel.description)
                    .font(.footnote)
                    .lineLimit(2)
            }
            .padding(.leading, 8)
        }
    }
    
}
