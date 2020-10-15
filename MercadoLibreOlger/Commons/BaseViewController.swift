///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 14/10/20
Copyright (c)  olger.com.co
*/

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func onShowAlertMessage(_ mensaje: String?) {
        onShowAlertMessage(titulo: "", mensaje: mensaje)
    }
       
    func onShowAlertMessage(titulo: String?, mensaje: String?) {
           
           guard let titulo = titulo else { return }
           guard let mensaje = mensaje else { return }
           
        let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
           alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
           self.present(alertController, animated: true, completion: nil)
       }

}
