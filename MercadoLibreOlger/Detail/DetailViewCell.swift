///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 15/10/20
Copyright (c)  olger.com.co
*/

import UIKit
import AlamofireImage

class DetailViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSoldQuantity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var result: Result?{
        didSet {
            guard  let result = result  else { return }
        
            lblTitle.text = result.title
            lblPrice.text = String(result.price ?? 0)
            lblSoldQuantity.text = "\(result.soldQuantity ?? 0) Vendidos"
            lblStock.text = "\(result.availableQuantity ?? 0) disponibles"
            setImage(urlImage: result.thumbnail)
            
        }
    }
    
    func setImage(urlImage: String?){
        guard let urlImage = urlImage?.replacingOccurrences(of: "http://", with: "https://") else { return }
        
        if let URL = URL(string: urlImage ){
           /*  let filter =  AspectScaledToFillSizeWithRoundedCornersFilter(
                 size: imageProduct.frame.size,
                 radius: 0.0
             )*/
             imageProduct.af.setImage(
                 withURL: URL,
                 placeholderImage: nil,
                 filter: nil,
                 imageTransition: .crossDissolve(0.2)
             )

         }
    }
}
