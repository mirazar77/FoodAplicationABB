import Foundation
class Foods: Codable {
    var id: Int?
    var name, image: String?
    var price: Int?
    var category: String?

    init(id: Int, name: String, image: String, price: Int, category :String) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.category = category
    }
}
