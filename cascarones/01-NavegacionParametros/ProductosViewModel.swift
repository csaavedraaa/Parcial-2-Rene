import Foundation

struct ProductosViewModel {

    func getProductos() -> [Producto] {

        let productos = [
            Producto(id: 1, nombre: "MacBook Pro", precio: 31899, imagen: "laptopcomputer",
                     descripcion: "Chip M2, 512 GB de almacenamiento y hasta 20 horas de batería."),

            Producto(id: 2, nombre: "iPhone 15", precio: 18999, imagen: "iphone",
                     descripcion: "Pantalla Super Retina, cámara de 48 MP y chip A16."),

            Producto(id: 3, nombre: "iPad Air", precio: 14999, imagen: "ipad",
                     descripcion: "Pantalla de 11 pulgadas, compatible con Apple Pencil."),

            Producto(id: 4, nombre: "Apple Watch", precio: 9499, imagen: "applewatch",
                     descripcion: "Monitor de actividad, ritmo cardiaco y notificaciones.")
        ]

        return productos
    }
}
