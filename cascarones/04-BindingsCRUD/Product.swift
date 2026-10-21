import Foundation
import Observation

@Observable
final class Product: Identifiable {
    let id = UUID()
    var name: String
    var price: Decimal

    init(name: String, price: Decimal) {
        self.name = name
        self.price = price
    }
}
