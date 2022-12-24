import Foundation
import UIKit
class FoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var CardView: UIView!
   
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    @IBOutlet weak var FoodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        CardView.layer.cornerRadius=10
    }

 
    

}
