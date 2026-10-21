import SwiftUI

struct ProductListView: View {
    var viewModel: ProductViewModel

    var body: some View {
        List {
            ForEach(viewModel.filteredProducts()) { product in
                NavigationLink(destination: EditProductView(item: product, viewModel: viewModel)) {
                    Text(product.name)
                }
            }
            .onDelete { offsets in
                viewModel.deleteProduct(offsets: offsets, from: viewModel.filteredProducts())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProductListView(viewModel: ProductViewModel())
    }
}
