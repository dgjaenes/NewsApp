
import Foundation
import SwiftUI


struct FeaturesProvider {
    static func buildDefaultView() -> SearchNewsView {
        let interactor = InteractorProvaider.getNewsInteractor()
        let localInteractor = InteractorProvaider.getNewsLocalInteractor()
        let viewModel = SearchNewsViewModel(interactor: interactor, localInteractor: localInteractor)
        let view = SearchNewsView(viewModel: viewModel)
        
        return view
    }
    
    static func builNewDetailView(viewModel: NewResultViewModel) -> NewDetailView {
        NewDetailView(viewModel: viewModel)
    }
}


