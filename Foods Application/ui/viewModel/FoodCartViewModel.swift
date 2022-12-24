import Foundation
import UIKit
import RxSwift

class FoodCartViewModel {
    var FoodCartList = BehaviorSubject<[FoodsCart]>(value: [FoodsCart]())
    var Frepo = FoodAppDaoRepository()
    
    init(){
        loadFoodCart()
        FoodCartList = Frepo.foodsCartList
    }
    
    func loadFoodCart(){
        Frepo.loadFoodCart()
    }
    func delete(cartId:Int){
        Frepo.delete(cartId: cartId)
    }
}
