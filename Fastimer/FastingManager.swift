//
//  FastingManager.swift
//  Fastimer
//
//  Created by Soro on 2023-01-06.
//

import Foundation

enum FastingState {
    case notStarted
    case fasting
    case feeding
}

class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
    }
}
