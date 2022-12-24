import Foundation


class FoodDetailViewModel {
    var frepo = FoodAppDaoRepository()
    
    func insert(name: String, image: String, price: Int, category: String, orderAmount: Int){
        frepo.insertFoods(name: name, image: image, price: price, category: category, orderAmount: orderAmount)
    }
}
