import SwiftUI

struct ContentView: View {
    @State private var viewModel = ProductViewModel()

    var body: some View {
        NavigationSplitView {
            VStack {
                AddProductView(viewModel: viewModel)
                ProductListView(viewModel: viewModel)
            }
            .padding()
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer, prompt: "Buscar producto")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Productos")
        } detail: {
            Text("Selecciona un Producto")
        }
    }
}

#Preview {
    ContentView()
}
