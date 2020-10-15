//
//  ListingInteractor.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation

class ListingInteractor: ListingInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ListingInteractorOutputProtocol?
   
    func search(_ query: String){
        ListingRemoteDataManager.search(query: query, onSuccess: {
            if let results = $0{
                self.presenter?.onSuccess(results: results)
            } else{
                self.presenter?.onError(error: ErrorApi(statusCode: 0, message: "No fue posible obtener los productos"))
            }
        }, onError: {
            self.presenter?.onError(error: $0)
        })
    }

}

