//
//  SearchPresenter.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 15/10/20.
//  
//

import Foundation

class SearchPresenter  {
    
    // MARK: Properties
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var wireFrame: SearchWireFrameProtocol?
    
}

extension SearchPresenter: SearchPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    func openListingView(_ query: String){
        wireFrame?.presentNewViewSearch(from: view!, query: query)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
