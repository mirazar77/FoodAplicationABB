import Foundation
import Alamofire
import RxSwift
import UIKit
class FoodAppDaoRepository {
    
    
    
    
    var foodsList = BehaviorSubject<[Foods]>(value: [Foods]())
    var foodsCartList = BehaviorSubject<[FoodsCart]>(value: [FoodsCart]())
    
    func insertFoods(name:String,image:String,price:Int,category:String,orderAmount:Int){
        let params:Parameters = ["name":name,"image":image,"price":price,"category":category,"orderAmount":orderAmount,"userName":Constants.userName]

        AF.request(Constants.insertfoodtothecart,method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success : \(result.success!)")
                    print("Message : \(result.message!)")
                  
                
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    func loadFoods(){
        AF.request(Constants.getallfoods,method: .get).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let list = result.foods{
                        
                        self.foodsList.onNext(list)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func loadFoodCart(){
        let params:Parameters = ["userName":Constants.userName]
        AF.request(Constants.getfoodsfromcart,method: .post,parameters: params).response { response in
            if let data = response.data {
                let str = String(decoding: data, as: UTF8.self)
                do{
                    var result =  FoodsCartResponse()
                    if (str == "\n\n\n\n\n")
                    {
                        
                        self.foodsCartList.onNext([FoodsCart]())
                    }else{
                        result = try JSONDecoder().decode(FoodsCartResponse.self, from: data)
                        }
                    if let list = result.foods_cart{
                        
                        self.foodsCartList.onNext(list)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func delete(cartId:Int){
        let params:Parameters = ["cartId":cartId,"userName":Constants.userName]
        
        AF.request(Constants.deletefoodfromthecart,method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success : \(result.success!)")
                    print("Message : \(result.message!)")
                    
                    self.loadFoodCart()
                }catch{
                    self.loadFoodCart()
                    print(error.localizedDescription)
                }
            }
        }
    }
    


  
}

