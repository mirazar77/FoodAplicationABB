import Foundation
import UIKit
class FoodCartScreen: UIViewController{
    var viewModel = FoodCartViewModel()
    @IBOutlet weak var FoodCartTableView: UITableView!
    var FoodCartList = [FoodsCart]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadFoodCart()
        _ = viewModel.FoodCartList.subscribe(onNext: { list in
            
            self.FoodCartList = list
            DispatchQueue.main.async {
                self.FoodCartTableView.reloadData()
            }
        })
    }
   
    
}
extension FoodCartScreen : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FoodCartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let FoodCartItem = FoodCartList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell") as! FoodTableViewCell
        cell.lblFoodPrice.text = "Price: $\(FoodCartItem.price ?? 0)/Item"
        cell.lblFoodName.text = FoodCartItem.name!
        cell.lblFoodQty.text = "Qty: \(FoodCartItem.orderAmount ?? 0)"
        cell.lblFoodTotal.text = "Total: $\((FoodCartItem.orderAmount ?? 0) * (FoodCartItem.price ?? 0))"
        
        cell.FoodImage.kf.setImage(with: URL(string: Constants.getfoodimage+FoodCartItem.image!), placeholder: UIImage(named: "photo.artframe"))
        
        
        return cell
    }
    
 
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
        
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
                (action,view,bool) in
                let FoodCartItem = self.FoodCartList[indexPath.row]
                
                let alert = UIAlertController(title: "Deletion Process", message: "Do you want to delete \(FoodCartItem.name!) ?", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(cancelAction)
                
                let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                    self.viewModel.delete(cartId: FoodCartItem.cartId!)
                }
                DispatchQueue.main.async {
                    alert.addAction(yesAction)
                    self.present(alert, animated: true)
                }
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        
        
       
    }
}
