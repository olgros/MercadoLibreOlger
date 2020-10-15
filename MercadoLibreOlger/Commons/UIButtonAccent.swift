///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 15/10/20
Copyright (c)  olger.com.co
*/

import UIKit

class UIButtonAccent:  UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 0.0
        layer.backgroundColor = UIColor(red: 255.0/255.0, green: 243.0/255.0, blue: 0.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 12.0
        setTitleColor(UIColor.black, for: .normal)
        // clipsToBounds = true
        
    }
}
