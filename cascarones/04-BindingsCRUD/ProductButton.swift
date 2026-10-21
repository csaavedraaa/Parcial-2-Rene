import SwiftUI

struct ProductButton: View {
    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        HStack {
            Spacer()
            Button(action: action) {
                Label(title, systemImage: systemImage)
            }
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ProductButton(title: "Agregar", systemImage: "plus", action: {})
}
