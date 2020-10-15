///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 14/10/20
Copyright (c)  olger.com.co
*/

import Foundation
class ErrorApi{
    
    var statusCode:Int = 0;
    var message: String = "Error";
    var exceptionMessage: String = "";
    
    
    init(statusCode:Int, json: NSDictionary) {
        
        self.statusCode = statusCode
        if statusCode == 404{
            self.message = "No se encontró ningún registro"
            if let mensaje = json["message"] as? String {
                if mensaje != ""{
                    self.message = mensaje
                }
            }
        }else{
            
            if let mensaje = json["message"] as? String {
                self.message = mensaje
            }else{
                self.message = "Servicio no disponible"
            }
            if let statusCode = json["statusCode"] as? Int {
                self.statusCode = statusCode
            }
        }
    }
    init(statusCode:Int) {
        self.statusCode = statusCode
        
        if (statusCode >= 500){
            self.message = "Servicio no disponible"
        }else if statusCode == 404{
            self.message = "No se encontró ningún registro"
        }else{
            self.message = "Respuesta inesperada del servidor"
        }
    }
    
    init(statusCode:Int, message: String) {
        self.statusCode = statusCode
        self.message = message
    }
    
    func toString() -> String {
        return "StatusCode: \(statusCode) Message: \(message) Exeption: \(exceptionMessage)"
    }
}
