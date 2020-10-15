//
//  SearchWireFrame.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 15/10/20.
//  
//

import Foundation
import UIKit

class SearchWireFrame: SearchWireFrameProtocol {

    class func createSearchModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "Navigation")
        if let view = navController.children.first as? SearchView {
            let presenter: SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter()
            let interactor: SearchInteractorInputProtocol = SearchInteractor()
            let wireFrame: SearchWireFrameProtocol = SearchWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SearchView", bundle: Bundle.main)
    }
    
    
    func presentNewViewSearch(from view: SearchViewProtocol, query: String) {
        //CREAR NUEVO MODULO E INSTANCIARLO
        let newListingView = ListingWireFrame.createListingModule(query)
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(newListingView, animated: true)
        }
        
    }
}
