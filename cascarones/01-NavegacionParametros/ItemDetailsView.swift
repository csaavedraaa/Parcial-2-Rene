import SwiftUI

struct ItemDetailsView: View {
    let producto: Producto

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Image(systemName: producto.imagen)
                    .font(.system(size: 90))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, minHeight: 200)

                Text(producto.nombre)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)

                HStack {
                    Text("$\(producto.precioTexto)").font(.title)

                    Text("16% OFF").font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }

                Text("Descripción").foregroundColor(Color.primary).padding(.top, 40)

                Text(producto.descripcion).foregroundColor(Color.secondary)
            }
            .padding()
        }
        .navigationTitle("Detalles")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "arrow.backward.circle.fill").foregroundColor(.yellow)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ItemDetailsView(producto: ProductosViewModel().getProductos()[0])
    }
}
