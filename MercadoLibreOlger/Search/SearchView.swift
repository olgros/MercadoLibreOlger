//
//  SearchView.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 15/10/20.
//  
//

import Foundation
import UIKit

class SearchView: BaseViewController {

    @IBOutlet weak var searhBar: UISearchBar!
    
    // MARK: Properties
    var presenter: SearchPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSearch(){
        guard let query = searhBar.text else { return }
        if query.count == 0 {
            onShowAlertMessage("Ingresa una palabra para buscar")
        }else{
            presenter?.openListingView(query)
        }
    }
}

extension SearchView: SearchViewProtocol {
    // TODO: implement view output methods
}
