//
//  SearchNewsViewModel.swift
//  NewsApp
//
//  Created by DAVID GONZALEZ on 24/05/2020.
//  Copyright © 2020 DAVID GONZALEZ. All rights reserved.
//

import SwiftUI
import Combine

class SearchNewsViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var dataSource: [NewResultViewModel] = []
    private var totalDataSource: [NewResultViewModel] = []
    
    private let interactor: NewsInteractorProtocol
    private let localInteractor: NewsLocalInteractorProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(interactor: NewsInteractorProtocol, localInteractor: NewsLocalInteractorProtocol, scheduler: DispatchQueue = DispatchQueue(label: "SearchNewsViewModel")) {
        self.interactor = interactor
        self.localInteractor = localInteractor
        searchArticles()
        $search
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: filterNews(title:))
            .store(in: &disposables)
    }
    
    private func searchArticles() {
        interactor.getArticles()
            .map { response in
                response.articles.map(Article.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = self.localInteractor.getValuesNews().map { item in
                        NewResultViewModel(item: item)
                    }
                    self.totalDataSource = self.dataSource
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] results in
                guard let self = self else { return }
                self.dataSource = results.map(NewResultViewModel.init)
                self.localInteractor.setValuesNews(values: results)
                self.totalDataSource = self.dataSource
        })
            .store(in: &disposables)
    }
    
    private func filterNews(title: String) {
        if totalDataSource.count > 0 && !title.isEmpty {
            dataSource = totalDataSource.filter{$0.title.contains(title)}
        } else {
            dataSource = totalDataSource
        }
    }
}
