//
//  SearchProtocols.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 15/10/20.
//  
//

import Foundation
import UIKit

protocol SearchViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SearchPresenterProtocol? { get set }
}

protocol SearchWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSearchModule() -> UIViewController
    func presentNewViewSearch(from view: SearchViewProtocol, query: String)
}

protocol SearchPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var wireFrame: SearchWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func openListingView(_ query: String)
}

protocol SearchInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol SearchInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SearchInteractorOutputProtocol? { get set }

}
