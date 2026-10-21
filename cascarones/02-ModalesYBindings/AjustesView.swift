import SwiftUI

struct AjustesView: View {
    @Binding var nombre: String
    @Binding var volumen: Double
    @Binding var cantidad: Int
    @Binding var color: String
    @Binding var notas: String

    @Environment(\.dismiss) private var dismiss

    let colores = ["Rojo", "Verde", "Azul"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos") {
                    TextField("Nombre", text: $nombre)
                }

                Section("Volumen: \(Int(volumen))") {
                    Slider(value: $volumen, in: 0...100)
                }

                Section("Cantidad") {
                    Stepper("Cantidad: \(cantidad)", value: $cantidad, in: 1...10)
                }

                Section("Color") {
                    Picker("Color", selection: $color) {
                        ForEach(colores, id: \.self) { opcion in
                            Text(opcion)
                        }
                    }
                }

                Section("Notas") {
                    TextEditor(text: $notas)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Ajustes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cerrar") { dismiss() }
                }
            }
        }
    }
}
