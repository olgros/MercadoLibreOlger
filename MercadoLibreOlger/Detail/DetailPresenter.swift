//
//  DetailPresenter.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var result: Result?
}

extension DetailPresenter: DetailPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
