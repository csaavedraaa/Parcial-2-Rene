import SwiftUI

struct EditProductView: View {
    let item: Product
    var viewModel: ProductViewModel

    @Environment(\.dismiss) private var dismiss

    @State private var draftProduct = Product(name: "", price: 0)
    @State private var showAlert = false
    @State private var alert: ProductAlert?
    @State private var lastResult: ProductOperationResult = .invalidData

    var body: some View {
        Form {
            Section("Producto") {
                ProductView(product: draftProduct)

                ProductButton(title: "Guardar", systemImage: "pencil") {
                    lastResult = viewModel.updateProduct(targetProduct: item, from: draftProduct)
                    alert = viewModel.alert(for: lastResult)
                    showAlert = true
                }
            }
        }
        .navigationTitle("Editar producto")
        .onAppear {
            draftProduct.name = item.name
            draftProduct.price = item.price
        }
        .alert(alert?.title ?? "", isPresented: $showAlert) {
            Button("OK") {
                if lastResult == .success {
                    dismiss()
                }
            }
        } message: {
            Text(alert?.message ?? "")
        }
    }
}

#Preview {
    EditProductView(item: Product(name: "Chocolates", price: 5), viewModel: ProductViewModel())
}
