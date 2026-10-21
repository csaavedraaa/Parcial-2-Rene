import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                WelcomeView()
            }

            Tab("Contador", systemImage: "clock") {
                CounterView()
            }
        }
        .tint(.red)
    }
}

#Preview {
    ContentView()
}
