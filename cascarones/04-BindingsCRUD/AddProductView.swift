import SwiftUI

struct AddProductView: View {
    @Bindable var viewModel: ProductViewModel
    @State private var showAlert = false
    @State private var alert: ProductAlert?

    var body: some View {
        GroupBox {
            ProductView(product: viewModel.product)

            ProductButton(title: "Agregar", systemImage: "plus") {
                let result = viewModel.addProduct()
                alert = viewModel.alert(for: result)
                showAlert = true
            }
        }
        .alert(alert?.title ?? "", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alert?.message ?? "")
        }
    }
}

#Preview {
    AddProductView(viewModel: ProductViewModel())
}
