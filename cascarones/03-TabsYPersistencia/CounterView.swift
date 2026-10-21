import SwiftUI

struct CounterView: View {
    @State private var counter = Counter()

    var body: some View {
        VStack(spacing: 20) {
            Text("\(counter.number)")
                .font(.title)
                .bold()

            HStack {
                Button {
                    counter.stop()
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

                Button {
                    counter.start()
                } label: {
                    Label("Start", systemImage: "play.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
            }
        }
    }
}

#Preview {
    CounterView()
}
