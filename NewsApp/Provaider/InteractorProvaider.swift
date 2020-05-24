
import Foundation

struct InteractorProvaider {
    static func getNewsInteractor() -> NewsInteractorProtocol {
        return NewsInteractorImplement(repository: NewsRemoteReporitoryImplment())
    }
    
    static func getNewsLocalInteractor() -> NewsLocalInteractorProtocol {
        return NewsLocalInteractorImplement(repository: LocalRepositoryImplement())
    }
}
