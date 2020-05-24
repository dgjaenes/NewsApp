//
//  SearchNewsView.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 24/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI

struct SearchNewsView: View {
    @ObservedObject var viewModel: SearchNewsViewModel
    
    init(viewModel: SearchNewsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                searchField
                    .padding(.leading, 20)
                
                Divider()
                    .padding(.leading, 8)
                
                if viewModel.dataSource.isEmpty {
                    emptySection
                        .padding(.leading, 20)
                    
                } else {
                    
                    List(self.viewModel.dataSource) { item in
                        NavigationLink(destination: GeneralRouting.getDetailView(viewModel: item)) {
                            NewResultRow.init(viewModel: item)
                        }
                    }
                    .padding(.leading, 8)
                    .frame(alignment: .topLeading)
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitle(Text("News"))
            .listStyle(GroupedListStyle())
        }
    }
}

private extension SearchNewsView {
    
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("example: Trump, coronavirus ...", text: $viewModel.search)
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}

