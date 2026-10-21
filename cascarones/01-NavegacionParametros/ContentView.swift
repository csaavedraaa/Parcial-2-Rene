import SwiftUI

struct ContentView: View {
    @State private var productos = ProductosViewModel().getProductos()

    var body: some View {
        NavigationStack {
            List {
                ForEach(productos) { producto in
                    NavigationLink(destination: ItemDetailsView(producto: producto)) {
                        ItemRowView(producto: producto)
                    }
                }
            }
            .navigationTitle("Productos")
        }
    }
}

#Preview {
    ContentView()
}
