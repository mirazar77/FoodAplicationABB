import Foundation
import RxSwift

class HomeViewModel {
    var foodList = BehaviorSubject<[Foods]>(value: [Foods]())
    var frepo = FoodAppDaoRepository()
    
    init(){
        loadFood()
        foodList = frepo.foodsList
    }
    
    func loadFood(){
        frepo.loadFoods()
    }
}
