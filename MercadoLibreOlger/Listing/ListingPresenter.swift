//
//  ListingPresenter.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation

class ListingPresenter  {
    
    // MARK: Properties
    weak var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var wireFrame: ListingWireFrameProtocol?
    var results: Array<Result>?
    var query: String?
    
}

extension ListingPresenter: ListingPresenterProtocol {
   
    // TODO: implement presenter methods
    func viewDidLoad() {
        guard  let query = query else { return }
        search(query)
    }
    
    func search(_ query: String) {
        view?.setLoadingIndicator(animating: true)
        interactor?.search(query)
        
    }
    func openDetail(_ result: Result){
        wireFrame?.presentNewViewDetail(from: view!, result: result)
    }
}

extension ListingPresenter: ListingInteractorOutputProtocol {
    func onSuccess(results: Array<Result>) {
        self.results = results
        view?.onReloadData()
        view?.setLoadingIndicator(animating: false)
        
    }
    
    func onError(error: ErrorApi) {
        view?.onError(error: error)
        view?.setLoadingIndicator(animating: false)
    }
}
