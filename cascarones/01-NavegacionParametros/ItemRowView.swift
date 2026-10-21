import SwiftUI

struct ItemRowView: View {
    let producto: Producto

    var body: some View {
        HStack {
            Image(systemName: producto.imagen)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(width: 80, height: 80)

            VStack(alignment: .leading) {
                Text(producto.nombre).font(.title)
                Text("$\(producto.precioTexto)").fontWeight(.semibold).font(.body)
            }
        }
    }
}

#Preview {
    ItemRowView(producto: ProductosViewModel().getProductos()[0])
}
