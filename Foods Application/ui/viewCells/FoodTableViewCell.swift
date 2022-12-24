
import Foundation
import UIKit

class FoodTableViewCell: UITableViewCell {
   
    @IBOutlet weak var CardView: UIView!
   
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var lblFoodTotal: UILabel!
    @IBOutlet weak var lblFoodQty: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
 
    @IBOutlet weak var FoodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        CardView.layer.cornerRadius=10
    }

   
    

}
