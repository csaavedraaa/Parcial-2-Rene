import Foundation
import Observation

@MainActor
@Observable
final class Counter {
    var number = 0

    private var task: Task<Void, Never>?

    func start() {
        guard task == nil else { return }

        task = Task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(2))
                guard !Task.isCancelled else { break }
                number += 1
            }
        }
    }

    func stop() {
        task?.cancel()
        task = nil
    }
}
