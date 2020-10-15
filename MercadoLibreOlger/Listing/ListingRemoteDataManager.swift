//
//  ListingRemoteDataManager.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation
import Alamofire

class ListingRemoteDataManager {
    
    static func search(  query: String, onSuccess: @escaping (_ lstProducts: Array<Result>?)->(), onError:@escaping (_ error: ErrorApi)->()) {
         let params = "?q=\(query)&limit=20"
        
        let requestData:RequestData = RequestData(body:"", params:"\(params)", path:"search/")
        
       AF.request(  requestData.url(), method: .get, headers: requestData.headers).responseJSON { response in
            debugPrint(response)   
        let result = response.result
        switch result {
           case .success(let value):
            if response.response?.statusCode == 200 {
                guard let data = response.data else  {
                    onError(ErrorApi.init(statusCode: response.response?.statusCode ?? 0 ))
                    return
                }
                do {
                    let item =  try JSONDecoder().decode(Products.self, from:  data)
                    onSuccess(item.results)
                }catch (let error){
                    print(error)
                    onError(ErrorApi.init(statusCode: response.response?.statusCode ?? 0, message: "\(error )"))
                }
              
            }else{
                if let json = value as? NSDictionary  {
                    onError(ErrorApi.init(statusCode: response.response?.statusCode ?? 0, json: json))
                    
                }else{
                    onError(ErrorApi.init(statusCode: response.response?.statusCode ?? 0 ))
                }
            }
            case .failure(let error):
                  print(error)
                  onError(ErrorApi.init(statusCode: response.response?.statusCode ?? 0 ))
                }
               
            }
        }
}
