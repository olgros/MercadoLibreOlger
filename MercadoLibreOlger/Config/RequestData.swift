///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 14/10/20
Copyright (c)  olger.com.co
*/
import Foundation
import Alamofire
struct RequestData {
    
    static var server = "https://api.mercadolibre.com/"
    
    var body: String
    var params :String
    var path: String
    var  headers: HTTPHeaders {
        get {
             let headers: HTTPHeaders = [
                           .accept("application/json")
                       ]
                
               // headers.add(HTTPHeader(name: "Authorization", value: "Basic \(token)"))
            return headers
      }
    }
    
    func url() -> String{
        let url = RequestData.server + "sites/MLA/" + path + params
        return url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

