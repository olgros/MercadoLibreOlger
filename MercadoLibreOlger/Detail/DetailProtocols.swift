//
//  DetailProtocols.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
}

protocol DetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(result: Result) -> UIViewController
}

protocol DetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var result: Result? {get set}
    
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol DetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }

}

protocol DetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

