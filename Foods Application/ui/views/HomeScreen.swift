import UIKit

import Kingfisher
class HomeScreen: UIViewController{
    
    
    @IBOutlet weak var lblUserName: UILabel!
    var tempFoodList = [Foods]()
    var foodList = [Foods]()
    var viewModel = HomeViewModel()
    @IBOutlet weak var FoodCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUserName.text = "Hi, "+Constants.userName
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        FoodCollection.collectionViewLayout = layout
        _ = viewModel.foodList.subscribe(onNext: { list in
            self.tempFoodList = list
            self.foodList = list
            DispatchQueue.main.async {
                self.FoodCollection.reloadData()
            }
        })
       
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadFood()
    }

    @IBAction func SearchTextFieldAction(_ sender: UITextField) {
        let SearchTxt = sender.text?.lowercased() ?? ""
        tempFoodList=foodList.filter{$0.name!.lowercased().contains(SearchTxt)}
        if SearchTxt == ""
        {
            tempFoodList=foodList
        }
        FoodCollection.reloadData()
    }
   

}
extension HomeScreen: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempFoodList.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
                //calculation of cell size
                return CGSize(width: ((width / 2) - 15)   , height: 200)
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let FoodItem = tempFoodList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
     
        cell.lblFoodName.text = String(FoodItem.name!)
        cell.lblFoodPrice.text = "$"+String(FoodItem.price!)
        DispatchQueue.main.async {
            
            cell.FoodImage.kf.setImage(with: URL(string: Constants.getfoodimage+FoodItem.image!), placeholder: UIImage(named: "photo.artframe"))
            
        }
         
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let Food = tempFoodList[indexPath.row]
        DispatchQueue.main.async {
            
            
            let DetailPage = self.storyboard?.instantiateViewController(withIdentifier: "FoodDetailScreen") as! FoodDetailScreen
            DetailPage.FoodDetail = Food
            self.navigationController?.pushViewController(DetailPage, animated: true)
        }
       
    }
}
