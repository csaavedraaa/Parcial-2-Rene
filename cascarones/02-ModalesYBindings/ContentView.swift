import SwiftUI

struct ContentView: View {
    @State private var mostrarAjustes = false
    @State private var nombre = ""
    @State private var volumen = 50.0
    @State private var cantidad = 1
    @State private var color = "Rojo"
    @State private var notas = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Nombre: \(nombre)")
            Text("Volumen: \(Int(volumen))")
            Text("Cantidad: \(cantidad)")
            Text("Color: \(color)")
            Text("Notas: \(notas)")

            Button("Abrir ajustes") {
                mostrarAjustes = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $mostrarAjustes) {
            AjustesView(nombre: $nombre,
                        volumen: $volumen,
                        cantidad: $cantidad,
                        color: $color,
                        notas: $notas)
        }
    }
}

#Preview {
    ContentView()
}
