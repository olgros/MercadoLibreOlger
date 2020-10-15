///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 14/10/20
Copyright (c)  olger.com.co
*/

import UIKit
class UILabelMultiline:  UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}

