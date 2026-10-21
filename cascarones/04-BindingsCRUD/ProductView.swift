import SwiftUI

struct ProductView: View {
    @Bindable var product: Product

    var body: some View {
        VStack {
            TextField("Nombre", text: $product.name)
            TextField("Precio", value: $product.price, format: .number)
                .keyboardType(.decimalPad)
        }
    }
}

#Preview {
    ProductView(product: Product(name: "Chocolates", price: 5))
}
