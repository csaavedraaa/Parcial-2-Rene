import Foundation

struct Producto: Identifiable {
    let id: Int
    let nombre: String
    let precio: Float
    let imagen: String
    let descripcion: String

    var precioTexto: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let formatted = formatter.string(from: NSNumber(value: precio)) {
            return formatted
        } else {
            return String(precio)
        }
    }
}
