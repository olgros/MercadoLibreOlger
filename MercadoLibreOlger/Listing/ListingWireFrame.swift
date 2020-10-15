//
//  ListingWireFrame.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation
import UIKit

class ListingWireFrame: ListingWireFrameProtocol {

    class func createListingModule(_ query: String) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ListingView")
        if let view = navController as? ListingView {
            let presenter: ListingPresenterProtocol & ListingInteractorOutputProtocol = ListingPresenter()
            let interactor: ListingInteractorInputProtocol  = ListingInteractor()
          
            let wireFrame: ListingWireFrameProtocol = ListingWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.query = query
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ListingView", bundle: Bundle.main)
    }
    
    func presentNewViewDetail(from view: ListingViewProtocol, result: Result) {
        //CREAR NUEVO MODULO E INSTANCIARLO
        let newDetailView = DetailWireFrame.createDetailModule(result: result)
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(newDetailView, animated: true)
        }
        
    }
}
