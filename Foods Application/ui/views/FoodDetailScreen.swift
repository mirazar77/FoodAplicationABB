import Foundation
import UIKit
import Kingfisher
class FoodDetailScreen: UIViewController{
    var FoodDetail : Foods?
    var viewModel = FoodDetailViewModel()
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var AmountStepper: UIStepper!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var FoodImageView: UIImageView!
    @IBOutlet weak var ImageUiView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageUiView.layer.cornerRadius = 120
        FoodImageView.layer.cornerRadius = 120
        ImageUiView.layer.borderWidth = 1
        lblFoodName.text = FoodDetail?.name
        lblPrice.text = "$" +  String(FoodDetail?.price ?? Int(0.0))
        
      
        FoodImageView.kf.setImage(with: URL(string: Constants.getfoodimage+FoodDetail!.image!), placeholder: UIImage(named: "photo.artframe"))
        lblDetail.text = " Category " + (FoodDetail?.category!)!
        
        AmountStepper.autorepeat = true
        AmountStepper.isContinuous = true
        lblAmount.text =  Int(AmountStepper.value).description
        AmountStepper.maximumValue = 20
        AmountStepper.minimumValue = 1
        AmountStepper.value = 1
        lblAmount.text = "1"
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lblAmount.text =  Int(sender.value).description
    }
    @IBAction func AddToCartAction(_ sender: UIButton) {
        DispatchQueue.main.async { [self] in
            
            viewModel.insert(name: (FoodDetail?.name)!, image: (FoodDetail?.image)!, price: (FoodDetail?.price)!, category: (FoodDetail?.category)!, orderAmount: Int(self.AmountStepper.value))
            let view = self.storyboard?.instantiateViewController(withIdentifier: "FoodCartScreen") as! FoodCartScreen
            self.present(view, animated: true)
        }
       
    }
}
