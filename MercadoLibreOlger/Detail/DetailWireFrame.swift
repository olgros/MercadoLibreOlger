//
//  DetailWireFrame.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {

    class func createDetailModule(result: Result) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = navController as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol  = DetailInteractor()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.result =  result
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
}
