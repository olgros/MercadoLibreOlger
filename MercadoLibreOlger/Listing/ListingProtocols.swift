//
//  ListingProtocols.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation
import UIKit

protocol ListingViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListingPresenterProtocol? { get set }
    func onReloadData()
    func onError(error: ErrorApi)
    func setLoadingIndicator(animating: Bool)
  
}


protocol ListingWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListingModule(_ query: String) -> UIViewController
    func presentNewViewDetail(from view: ListingViewProtocol, result: Result) 
}

protocol ListingPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListingViewProtocol? { get set }
    var interactor: ListingInteractorInputProtocol? { get set }
    var wireFrame: ListingWireFrameProtocol? { get set }
    var results: Array<Result>? { get set }
    var query: String? { get set }
    func viewDidLoad()
    func search(_ query: String)
    func openDetail(_ result: Result)
}

protocol ListingInteractorOutputProtocol: class {
    func onSuccess(results: Array<Result>)
    func onError(error: ErrorApi)
}

protocol ListingInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListingInteractorOutputProtocol? { get set }
    func search(_ query: String)
}

