import Foundation
import Observation

@MainActor
@Observable
final class ProductViewModel {

    var products = [
        Product(name: "Tacos", price: 10),
        Product(name: "Tamales", price: 20),
        Product(name: "Tortas", price: 30)
    ]
    var product = Product(name: "", price: 0)
    var searchText = ""

    func filteredProducts() -> [Product] {
        let search = searchText
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard !search.isEmpty else { return products }

        return products.filter {
            $0.name.localizedCaseInsensitiveContains(search)
        }
    }

    private func validateProduct(_ product: Product)
        -> (name: String, price: Decimal)? {

        let nombre = product.name
            .trimmingCharacters(in: .whitespacesAndNewlines)

        guard !nombre.isEmpty,
              product.price >= 0
        else {
            return nil
        }

        return (name: nombre, price: product.price)
    }

    func addProduct() -> ProductOperationResult {
        guard let data = validateProduct(product)
        else {
            return .invalidData
        }

        products.append(Product(name: data.name, price: data.price))
        product.name = ""
        product.price = 0
        return .success
    }

    func updateProduct(targetProduct: Product, from draftProduct: Product) -> ProductOperationResult {
        guard let validatedData = validateProduct(draftProduct) else {
            return .invalidData
        }

        targetProduct.name = validatedData.name
        targetProduct.price = validatedData.price
        return .success
    }

    func deleteProduct(offsets: IndexSet, from lista: [Product]) {
        for index in offsets {
            guard lista.indices.contains(index) else { continue }
            let id = lista[index].id
            products.removeAll { $0.id == id }
        }
    }

    func alert(for result: ProductOperationResult) -> ProductAlert {
        switch result {
        case .success:
            return ProductAlert(
                title: "Operación exitosa",
                message: "Los cambios se guardaron correctamente.")

        case .invalidData:
            return ProductAlert(
                title: "Datos inválidos",
                message: "El nombre del producto no puede estar vacío y el precio no puede ser menor que 0.")
        }
    }
}
